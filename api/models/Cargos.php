<?php

/* Entidad Cargos */

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Message,
    Phalcon\Mvc\Model\Validator\InclusionIn,
    Phalcon\Mvc\Model\Validator\Uniqueness,
    Phalcon\Mvc\Model\Validator\PresenceOf,
    Phalcon\Mvc\Model\Behavior\SoftDelete;


class Cargos extends Model{

    public function initialize(){
      $this->setSource("cargos");
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
                "field" => "cargo",
                "message" => "El cargo se debe ingresar"
                )
            ));

       $this->validate(new Uniqueness(
            array(
                "field"  => "cargo",
                "message" => "El cargo debe ser único"
            )
        ));

        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
