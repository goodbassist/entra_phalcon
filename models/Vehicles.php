<?php

class Vehicles extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var integer
     */
    public $vehicle_type_id;

    /**
     *
     * @var integer
     */
    public $branch_id;

    /**
     *
     * @var string
     */
    public $plate_no;

    /**
     *
     * @var string
     */
    public $serial_no;

    /**
     *
     * @var integer
     */
    public $active;

    /**
     *
     * @var string
     */
    public $created_at;

    /**
     *
     * @var string
     */
    public $updated_at;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->hasMany('id', 'DriverVehicle', 'vehicle_id', array('alias' => 'DriverVehicle'));
        $this->hasMany('id', 'Tickets', 'vehicle_id', array('alias' => 'Tickets'));
        $this->belongsTo('vehicle_type_id', 'VehicleTypes', 'id', array('alias' => 'VehicleTypes'));
        $this->belongsTo('branch_id', 'Branches', 'id', array('alias' => 'Branches'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'vehicles';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Vehicles[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Vehicles
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
