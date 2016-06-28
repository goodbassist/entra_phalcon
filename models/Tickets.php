<?php

class Tickets extends \Phalcon\Mvc\Model
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
    public $customer_id;

    /**
     *
     * @var integer
     */
    public $schedule_id;

    /**
     *
     * @var integer
     */
    public $channel;

    /**
     *
     * @var double
     */
    public $price_paid;

    /**
     *
     * @var integer
     */
    public $payment_method_id;

    /**
     *
     * @var string
     */
    public $code;

    /**
     *
     * @var string
     */
    public $shortcode;

    /**
     *
     * @var integer
     */
    public $active;

    /**
     *
     * @var integer
     */
    public $seat_no;

    /**
     *
     * @var string
     */
    public $deleted_at;

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
     *
     * @var integer
     */
    public $user_id;

    /**
     *
     * @var string
     */
    public $passenger_name;

    /**
     *
     * @var string
     */
    public $passenger_next_of_kin;

    /**
     *
     * @var string
     */
    public $passenger_next_of_kin_phone;

    /**
     *
     * @var integer
     */
    public $destination_id;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->belongsTo('customer_id', 'Customers', 'id', array('alias' => 'Customers'));
        $this->belongsTo('destination_id', 'Destinations', 'id', array('alias' => 'Destinations'));
        $this->belongsTo('payment_method_id', 'PaymentMethods', 'id', array('alias' => 'PaymentMethods'));
        $this->belongsTo('schedule_id', 'Schedules', 'id', array('alias' => 'Schedules'));
        $this->belongsTo('user_id', 'Users', 'id', array('alias' => 'Users'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'tickets';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Tickets[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Tickets
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
