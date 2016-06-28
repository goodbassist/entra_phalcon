<?php

class Schedules extends \Phalcon\Mvc\Model
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
    public $destination_id;

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
    public $vehicle_id;

    /**
     *
     * @var integer
     */
    public $driver_id;

    /**
     *
     * @var string
     */
    public $departure_time;

    /**
     *
     * @var double
     */
    public $price;

    /**
     *
     * @var integer
     */
    public $boarded;

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
    public $date_boarded;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->belongsTo('branch_id', 'Branches', 'id', array('alias' => 'Branches'));
        $this->belongsTo('destination_id', 'Branches', 'id', array('alias' => 'Branches'));
        $this->belongsTo('user_id', 'Users', 'id', array('alias' => 'Users'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'schedules';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Schedules[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Schedules
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
