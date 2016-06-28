<?php

class Customers extends \Phalcon\Mvc\Model
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
     * @var integer
     */
    public $branch_id;

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
    public $fullname;

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
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->hasMany('id', 'Tickets', 'customer_id', array('alias' => 'Tickets'));
        $this->belongsTo('branch_id', 'Branches', 'id', array('alias' => 'Branches'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'customers';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Customers[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Customers
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
