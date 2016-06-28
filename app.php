<?php
/**
 * Local variables
 *By Badejo Oluwatobi ADEKUNLE   FOR ENRTRANIC
 * @var \Phalcon\Mvc\Micro $app
 */
use Phalcon\Http\Response;
use Phalcon\Security;
/**
 * Add your routes here
 */


$app->post('/login/ticketer',function () use ($app){
	
	$loginDetails   = $app->request->getJsonRawBody();
    $phone          = $loginDetails->phone;
    $password       = (!empty($loginDetails->password)) ? $loginDetails->password : '' ;
    $user           = Users::findFirstByPhoneNumber($phone);

	$response = new Response();
    if($user){
        if ($app->security->checkHash($password,$user->password)) {
           $role = $user->RoleUser->role_id;
           if ($role == '4') {
                $user           = Users::findFirstByPhoneNumber($phone);
                $data = array();
                $data['fullName']     = $user->first_name.' '.$user->last_name;
                $data['phone']        = $user->phone_number;
                $data['user_id']      = $user->id;
                $data['branch']       = $user->SalesReps->Branches->name;    
                $data['branch_id']    = $user->SalesReps->Branches->id;    
                $data['Comapany']     = $user->SalesReps->Branches->Companies->name;  
                $data['password']     = $user->password;  
                $response->setStatusCode(201, "Correct Credentials");
                $response->setJsonContent(
                    array(
                        'status' => 'success',
                        'data'   =>  $data
                    )
                );
           }else{
                $response->setStatusCode(400, "Wrong Role");
                $response->setJsonContent(
                    array(
                        'status' => 'error',
                        'data'    => [],
                        'message' => 'Access Denied'
                    )
                );
            }   
        }
    }else{
        $response->setStatusCode(400, "Wrong Credentails");
        $response->setJsonContent(
            array(
                'status'    => 'error',
                'data'      => [],
                'message'   => 'Access Denied'
            )
        );
    } 
    return $response;

});

$app->post('/ticketer/book',function () use ($app){
    $ticketDetails      = $app->request->getJsonRawBody();
    $tickets            = new Tickets();
    $destionations      = new Destinations;
    $data               = $ticketDetails->data;
    $branch_id          = $ticketDetails->branch_id;
    $user               = Users::findFirstById($ticketDetails->user_id);
    $company_id         = $user->SalesReps->Branches->Companies->id;
    $user_id            = $ticketDetails->user_id; 
    $channel            = '3'; // android
    $payment_method_id  = '1'; // cash
    $shortcode          = rand(0,9999);
    $response       = new Response();
    $i = 0;
    foreach ($data as $value) {
        $phone =  (!empty($value->phone)) ? $value->phone : '' ;
        $price_paid                    = $value->price;
        $driver_id                     = $value->driver_id;
        $vehicle_id                    = $value->vehicle_id;
        $passenger_name                = $value->passenger_name;
        $passenger_next_of_kin         = (!empty($value->passenger_next_of_kin)) ? $value->passenger_next_of_kin : '' ;
        $passenger_next_of_kin_phone   = (!empty($value->passenger_next_of_kin_phone)) ? $value->passenger_next_of_kin_phone : '' ;
        $seat_no                       = (!empty($value->seat_no)) ? $value->seat_no : '' ;

        //check if Destination Exists
        $destionationsCheck      = Destinations::findFirst(array(
        'conditions' => 'destination_name = ?1 AND branch_id = ?2 ',
        'bind'      =>  array(1 => $value->destination ,2 => $branch_id)));
        if ($destionationsCheck) {
                $destination_id = $destionationsCheck->id;
            }elseif (!$destionationsCheck) {
                $insertDestination = "INSERT INTO Destinations (destination_name, user_id, company_id, branch_id) VALUES (:destination_name:, :user_id:, :company_id:, :branch_id:)";
                $status = $app->modelsManager->executeQuery($insertDestination, array(
                    'destination_name' => $value->destination,
                    'user_id' => $ticketDetails->user_id,
                    'company_id' => $company_id,
                    'branch_id' => $branch_id
                ));
                 $destination_id = $status->getModel()->id;
        }
        $tickets->destination_id                = $destination_id;

        //check if Phone Number Exitst
        $checkPhoneNumber = Customers::findFirstByPhoneNumber($phone);
        if ($checkPhoneNumber) {
            $customerID                        = $checkPhoneNumber->id;
            
        }elseif (!$checkPhoneNumber && !empty($phone)) {
             //create new customer record
            $insertCustomer = "INSERT INTO Customers (fullname, phone_number, branch_id, next_of_kin_name, next_of_kin_number) VALUES (:passenger_name:, :phone:, :branch_id:, :passenger_next_of_kin:, :passenger_next_of_kin_phone:)";
                $status1b = $app->modelsManager->executeQuery($insertCustomer, array(
                    'destination_name' => $value->destination,'passenger_name' => $passenger_name,
                    'phone' => $phone,
                    'branch_id' => $branch_id,
                    'passenger_next_of_kin' => $passenger_next_of_kin,
                    'passenger_next_of_kin_phone' => $passenger_next_of_kin_phone
                ));
             $customerID               = '';
        }elseif (empty($phone)) {
             $customerID               = $status1b->getModel()->id;
        }
        $insertTicket = "INSERT INTO Tickets (channel, payment_method_id, vehicle_id, user_id, driver_id, price_paid, passenger_name, passenger_next_of_kin, passenger_next_of_kin_phone, destination_id, customer_id, branch_id, seat_no) VALUES (:channel:, :payment_method_id:, :vehicle_id:, :user_id:, :driver_id:, :price_paid:, :passenger_name:, :passenger_next_of_kin:, :passenger_next_of_kin_phone:, :destination_id:, :customer_id:, :branch_id:, :seat_no:)";
        $status2 = $app->modelsManager->executeQuery($insertTicket, array(
            'channel' => $channel,
            'payment_method_id' => $payment_method_id,
            'vehicle_id' => $vehicle_id,
            'driver_id' => $driver_id,
            'user_id' => $user_id,
            'price_paid' => $price_paid,
            'passenger_name' => $passenger_name,
            'passenger_next_of_kin' => $passenger_next_of_kin,
            'passenger_next_of_kin_phone' => $passenger_next_of_kin_phone,
            'destination_id' => $destination_id,
            'customer_id' => $customerID,
            'branch_id' => $branch_id,
            'seat_no' => $seat_no,
        ));
        $ids[] = $status2->getModel();
    }
    $response->setStatusCode(202, "Created");
    $response->setJsonContent(
        array(
            'status'   => 'success',
            'data'   => $ids,
        )
    );
    return $response;
});


$app->post('/closesale',function () use($app){
        $scheduleDetails        = $app->request->getJsonRawBody();
        $dt = new DateTime($scheduleDetails->departure_time);
        $date = $dt->format('Y-m-d');

        //check for Exiting Schedule
        $checkExistingSchedule  = Schedules::findFirst(array(
        'conditions' => 'DATE(departure_time) = ?1 AND vehicle_id = ?2 AND branch_id = ?3',
        'bind'      =>  array(1 => $date ,2 => $scheduleDetails->vehicle_id, 3 => $scheduleDetails->branch_id)
        ));
        if ($checkExistingSchedule) {
           $schedule_data           = $checkExistingSchedule;
           $message                 = 'Schedule Already Exist';
        }else{
            $insertSchedule = "INSERT INTO Schedules (branch_id, user_id, vehicle_id, driver_id, departure_time, price, endpoint) VALUES (:branch_id:, :user_id:, :vehicle_id:, :driver_id:, :departure_time:, :price:, :endpoint:)";
                $status = $app->modelsManager->executeQuery($insertSchedule, array(
                    'branch_id'         => $scheduleDetails->branch_id,
                    'endpoint'          => $scheduleDetails->endpoint,
                    'user_id'           => $scheduleDetails->user_id,
                    'driver_id'         => $scheduleDetails->driver_id,
                    'vehicle_id'        => $scheduleDetails->vehicle_id,
                    'departure_time'    => $scheduleDetails->departure_time,
                    'price'             => $scheduleDetails->price
                ));
            $schedule_data = $status->getModel();
            $message                 = 'Schedule Succesfully Created';

        }
        $response = new Response();
        $response->setStatusCode(202, "Created");
        $response->setJsonContent(
            array(
                'status'    => 'success',
                'data'      => $schedule_data,
                'message'   => $message
            )
        );
        return $response;

});

$app->get('/drivers/{id}', function ($id) use ($app) {
   $branch_id   =  $id;
   $company_id  = Branches::findFirstById($branch_id)->Companies->id;
   $company     = Companies::findFirst($company_id);
   foreach($company->Branches as $ko){
        foreach ($ko->Drivers as $key => $value) {
            $val[] = $value;
        }
   }
   $results = array();
   foreach ($val as $value) {
        $r['driver_id']     = $value->id;
        $r['name']          = $value->Users->first_name.' '.$value->Users->last_name;
        $r['company']       = $value->Branches->Companies->name;
        $results[] = $r;
    } 
    $response = new Response();
    if (is_array($results) && !empty($results)) {
        $response->setStatusCode(202, "Drivers");
        $response->setJsonContent(
                array(
                    'status'    => 'success',
                    'data'      => $results,
            )
        );
    }else{
        $response->setStatusCode(400, "No Drivers");
        $response->setJsonContent(
            array(
                'status'    => 'error',
                'data'      => null,
                'message'   => 'No Drivers',
            )
        );
    }
    
    return $response;
});

$app->get('/vehicles/{id}', function ($id) use ($app) {
   $vehicles = Vehicles::find();
   $branch_id   =  $id;
   $company_id  = Branches::findFirstById($branch_id)->Companies->id;
   $company     = Companies::findFirst($company_id);
   $results = array();
   foreach($company->Branches as $ko){
        foreach ($ko->Vehicles as $key => $value) {
            $val[] = $value;
        }
   }
   foreach ($val as $value) {
        $r['vehicle_id']  = $value->id;
        $r['plate_no']     = $value->plate_no;
        $r['serial_no']    = $value->serial_no;
        $results[] = $r;
    } 
     $response = new Response();
    if (is_array($results) && !empty($results)) {
        $response->setStatusCode(202, "Vehicles");
        $response->setJsonContent(
            array(
                'status'    => 'success',
                'data'      => $results,
            )
        );
    }else{
        $response->setStatusCode(400, "No Vehicles");
        $response->setJsonContent(
            array(
                'status'    => 'error',
                'data'      => null,
                'message'   => 'No Drivers',
            )
        );
    }
    
    return $response;
});

$app->get('/drivertovehicle/{id}', function ($id) use ($app) {
   $drvh = DriverVehicle::find();
   $results = array();
   $branch_id   =  $id;
   $company_id  = Branches::findFirstById($branch_id)->Companies->id;
   $company     = Companies::findFirst($company_id);
   foreach($company->Branches as $ko){
        foreach ($ko->Vehicles as $key => $value) {
            $val[] = $value->id;
        }
   }
   foreach ($drvh as $value) {
        if(in_array($value->vehicle_id, $val)){
            $r['vehicle_id']            = $value->vehicle_id;
            $r['driver_id']             = $value->driver_id;
            $r['vehichle_plate_no']     = $value->Vehicles->plate_no;
            $r['vehichle_serial_no']    = $value->Vehicles->serial_no;
            // $r['company']               = $value->Vehicles->Branches->Companies->name;
            $r['driver_name']           = $value->Drivers->Users->first_name.' '.$value->Drivers->Users->last_name;
            $results[] = $r;
        }
    } 
     $response = new Response();
   if (is_array($results) && !empty($results)) {
        $response->setStatusCode(202, "Drivers To Vehicles");
        $response->setJsonContent(
            array(
                'status'    => 'success',
                'data'      => $results,
            )
        );
    }else{
        $response->setStatusCode(400, "No Drivers To Vehicles");
        $response->setJsonContent(
            array(
                'status'    => 'error',
                'data'      =>  $val,
                'message'   => 'Drivers To Vehicles',
            )
        );
    }
    return $response;
});




