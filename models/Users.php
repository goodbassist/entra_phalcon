<?php

use Phalcon\Mvc\Model\Validator\Email as Email;


class Users extends \Phalcon\Mvc\Model
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
    public $first_name;

    /**
     *
     * @var string
     */
    public $last_name;

    /**
     *
     * @var string
     */
    public $email;

    /**
     *
     * @var string
     */
    public $password;

    /**
     *
     * @var string
     */
    public $phone_number;

    /**
     *
     * @var integer
     */
    public $status;

    /**
     *
     * @var string
     */
    public $remember_token;

    /**
     *
     * @var string
     */
    public $last_login;

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
        $this->hasMany('id', 'Activities', 'user_id', array('alias' => 'Activities'));
        $this->hasMany('id', 'BranchAdmins', 'user_id', array('alias' => 'BranchAdmins'));
        $this->hasOne('id', 'CompanyAdmins', 'user_id', array('alias' => 'CompanyAdmins'));
        $this->hasMany('id', 'Customers', 'user_id', array('alias' => 'Customers'));
        $this->hasOne('id', 'Drivers', 'user_id', array('alias' => 'Drivers'));
        $this->hasMany('id', 'Expenses', 'user_id', array('alias' => 'Expenses'));
        $this->hasOne('id', 'FleetManagers', 'user_id', array('alias' => 'FleetManagers'));
        $this->hasOne('id', 'RoleUser', 'user_id', array('alias' => 'RoleUser'));
        $this->hasOne('id', 'SalesReps', 'user_id', array('alias' => 'SalesReps'));
        $this->hasMany('id', 'Schedules', 'user_id', array('alias' => 'Schedules'));
        $this->hasMany('id', 'Tickets', 'user_id', array('alias' => 'Tickets'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'users';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Users[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Users
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
