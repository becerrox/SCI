<?php

/* Entidad Equipo */

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Message,
    Phalcon\Mvc\Model\Validator\InclusionIn,
    Phalcon\Mvc\Model\Validator\Uniqueness,
    Phalcon\Mvc\Model\Validator\PresenceOf,
    Phalcon\Mvc\Model\Behavior\SoftDelete;


class Equipo extends Model{
    public function initialize(){
      $this->setSource("equipo");
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
                "field" => "serial",
                "message" => " serial"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "marca",
                "message" => " marca"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "descripcion",
                "message" => " equipo"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "modelo",
                "message" => " modelo"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "responsable",
                "message" => " responsable"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "estado",
                "message" => " estado"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "unidad_admin",
                "message" => " unidad administrativa"
                )
            ));         

        $this->validate(new PresenceOf(
            array(
                "field" => "color",
                "message" => " color"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "caracteristicas",
                "message" => " caracteristicas"
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
                 "field"  => "serial",
                 "message" => " serial debe ser único"
             )
         ));
/*
        $this->validate(new Uniqueness(
             array(
                 "field"  => "imei",
                 "message" => " imei debe ser único"
             )
         ));
*/
        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
