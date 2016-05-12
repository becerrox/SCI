<?php

/* Entidad Bienes */

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Message,
    Phalcon\Mvc\Model\Validator\InclusionIn,
    Phalcon\Mvc\Model\Validator\Uniqueness,
    Phalcon\Mvc\Model\Validator\PresenceOf,
    Phalcon\Mvc\Model\Behavior\SoftDelete;


class Bienes extends Model{
    public function initialize(){
      $this->setSource("bienes");
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
                "message" => "El serial es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "marca",
                "message" => "La marca es obligatoria"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "descripcion",
                "message" => "El equipo es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "modelo",
                "message" => "El modelo es obligatoria"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "estatus_uso_bien",
                "message" => "El estatus del uso de bien es obligatorio"
                )
            ));        

        $this->validate(new PresenceOf(
            array(
                "field" => "cat_unid_admin",
                "message" => "La unidad administrativa es obligatoria"
                )
            ));         

        $this->validate(new PresenceOf(
            array(
                "field" => "num_bien",
                "message" => "El número de bien es obligatoria"
                )
            ));                 

        $this->validate(new PresenceOf(
            array(
                "field" => "colores",
                "message" => "El campo color es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "unidad_trabajo",
                "message" => "El campo de unidad de trabajo es obligatorio"
                )
            ));        

        $this->validate(new Uniqueness(
             array(
                 "field"  => "serial",
                 "message" => "El serial debe ser único"
             )
         ));

        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
