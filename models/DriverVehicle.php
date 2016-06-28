<?php

class DriverVehicle extends \Phalcon\Mvc\Model
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
    public $driver_id;

    /**
     *
     * @var integer
     */
    public $vehicle_id;

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
        $this->belongsTo('driver_id', 'Drivers', 'id', array('alias' => 'Drivers'));
        $this->belongsTo('vehicle_id', 'Vehicles', 'id', array('alias' => 'Vehicles'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'driver_vehicle';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return DriverVehicle[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return DriverVehicle
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
