<?php

class Companies extends \Phalcon\Mvc\Model
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
     * @var string
     */
    public $slogan;

    /**
     *
     * @var string
     */
    public $logo_url;

    /**
     *
     * @var string
     */
    public $website;

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
        $this->hasMany('id', 'Branches', 'company_id', array('alias' => 'Branches'));
        $this->hasMany('id', 'CompanyAddresses', 'company_id', array('alias' => 'CompanyAddresses'));
        $this->hasMany('id', 'CompanyAdmins', 'company_id', array('alias' => 'CompanyAdmins'));
        $this->hasMany('id', 'FleetManagers', 'company_id', array('alias' => 'FleetManagers'));
        $this->hasMany('id', 'VehicleTypes', 'company_id', array('alias' => 'VehicleTypes'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'companies';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Companies[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Companies
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
