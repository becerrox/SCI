<?php

/* Entidad Responsables */

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Message,
    Phalcon\Mvc\Model\Validator\InclusionIn,
    Phalcon\Mvc\Model\Validator\Uniqueness,
    Phalcon\Mvc\Model\Validator\PresenceOf,
    Phalcon\Mvc\Model\Behavior\SoftDelete;


class Responsables extends Model{

    public function initialize(){
      $this->setSource("responsables");
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
                "field" => "cedula",
                "message" => " cédula"
                )
            ));        


        $this->validate(new PresenceOf(
            array(
                "field" => "apellidos",
                "message" => " nombre"
                )
            ));        

        $this->validate(new PresenceOf(
            array(
                "field" => "cargo",
                "message" => " apellido"
                )
            ));        

        $this->validate(new PresenceOf(
            array(
                "field" => "unidad_admin",
                "message" => " unidad aministrativa"
                )
            ));        

        $this->validate(new PresenceOf(
            array(
                "field" => "unidad_trabajo",
                "message" => " unidad de trabajo"
                )
            ));        

       $this->validate(new Uniqueness(
            array(
                "field"  => "cedula",
                "message" => "La cédula debe ser única"
            )
        ));

        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
