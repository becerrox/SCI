<?php

/* Entidad Configuracion */

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Message,
    Phalcon\Mvc\Model\Validator\InclusionIn,
    Phalcon\Mvc\Model\Validator\Uniqueness,
    Phalcon\Mvc\Model\Validator\PresenceOf,
    Phalcon\Mvc\Model\Behavior\SoftDelete;


class Configuracion extends Model{

    public function initialize(){
      $this->setSource("configuracion_bien");
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
                "field" => "codigo",
                "message" => " código"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "descripcion",
                "message" => " descripción"
                )
            ));

       $this->validate(new Uniqueness(
            array(
                "field"  => "descripcion",
                "message" => "La descripción debe ser única"
            )
        ));
/*
       $this->validate(new Uniqueness(
            array(
                "field"  => "codigo",
                "message" => "El código debe ser único"
            )
        ));*/

        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
