<?php

class Drivers extends \Phalcon\Mvc\Model
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
    public $branch_id;

    /**
     *
     * @var integer
     */
    public $user_id;

    /**
     *
     * @var integer
     */
    public $gender;

    /**
     *
     * @var string
     */
    public $next_of_kin_name;

    /**
     *
     * @var string
     */
    public $next_of_kin_number;

    /**
     *
     * @var string
     */
    public $license_no;

    /**
     *
     * @var string
     */
    public $date_employed;

    /**
     *
     * @var string
     */
    public $work_phone;

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
        $this->hasMany('id', 'DriverVehicle', 'driver_id', array('alias' => 'DriverVehicle'));
        $this->hasMany('id', 'Tickets', 'driver_id', array('alias' => 'Tickets'));
        $this->belongsTo('branch_id', 'Branches', 'id', array('alias' => 'Branches'));
        $this->belongsTo('user_id', 'Users', 'id', array('alias' => 'Users'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'drivers';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Drivers[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Drivers
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
