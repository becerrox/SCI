<?php

/* Entidad Sedes */

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Message,
    Phalcon\Mvc\Model\Validator\InclusionIn,
    Phalcon\Mvc\Model\Validator\Uniqueness,
    Phalcon\Mvc\Model\Validator\PresenceOf,
    Phalcon\Mvc\Model\Behavior\SoftDelete;


class Sedes extends Model{

    public function initialize(){
      $this->setSource("sedes");
      $this->addBehavior(
            new SoftDelete(
                array(
                    'field' => 'status',
                    'value' => 0
                )
            )
        );
    }

 /* Validaciones */
 public function validation()
    {

        $this->validate(new PresenceOf(
            array(
                "field" => "sede",
                "message" => "La sede debe ser ingresada"
                )
            ));

       $this->validate(new Uniqueness(
            array(
                "field"  => "sede",
                "message" => "La sede debe ser única"
            )
        ));

        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
