<?php

use Phalcon\Mvc\Model\Validator\Email as Email;

class Branches extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $name;

    /**
     *
     * @var integer
     */
    public $company_id;

    /**
     *
     * @var integer
     */
    public $state_id;

    /**
     *
     * @var string
     */
    public $city;

    /**
     *
     * @var string
     */
    public $address;

    /**
     *
     * @var string
     */
    public $phone_number;

    /**
     *
     * @var string
     */
    public $email;

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
     *
     * @var string
     */
    public $slug;

    /**
     * Validations and business logic
     *
     * @return boolean
     */
    public function validation()
    {
        $this->validate(
            new Email(
                array(
                    'field'    => 'email',
                    'required' => true,
                )
            )
        );

        if ($this->validationHasFailed() == true) {
            return false;
        }

        return true;
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->hasMany('id', 'BranchAdmins', 'branch_id', array('alias' => 'BranchAdmins'));
        $this->hasMany('id', 'Customers', 'branch_id', array('alias' => 'Customers'));
        // $this->hasMany('id', 'DestinationStops', 'branch_id', array('alias' => 'DestinationStops'));
        // $this->hasMany('id', 'DestinationStops', 'destination_id', array('alias' => 'DestinationStops'));
        // $this->hasMany('id', 'Destinations', 'start_id', array('alias' => 'Destinations'));
        // $this->hasMany('id', 'Destinations', 'stop_id', array('alias' => 'Destinations'));
        $this->hasMany('id', 'Drivers', 'branch_id', array('alias' => 'Drivers'));
        $this->hasMany('id', 'Vehicles', 'branch_id', array('alias' => 'Vehicles'));
        $this->hasMany('id', 'ExpenseTypes', 'branch_id', array('alias' => 'ExpenseTypes'));
        $this->hasMany('id', 'Expenses', 'branch_id', array('alias' => 'Expenses'));
        $this->hasMany('id', 'SalesReps', 'branch_id', array('alias' => 'SalesReps'));
        $this->hasMany('id', 'Schedules', 'branch_id', array('alias' => 'Schedules'));
        $this->hasMany('id', 'Destinations', 'destination_id', array('alias' => 'Destinations'));
        $this->belongsTo('company_id', 'Companies', 'id', array('alias' => 'Companies'));
        $this->belongsTo('state_id', 'States', 'id', array('alias' => 'States'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'branches';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Branches[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Branches
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
