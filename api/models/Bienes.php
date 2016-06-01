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
                "message" => " serial"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "per_ini",
                "message" => " período de inicio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "per_culm",
                "message" => " período de culminación"
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
                "field" => "estatus_uso_bien",
                "message" => " estatus del uso de bien"
                )
            ));        

        $this->validate(new PresenceOf(
            array(
                "field" => "cat_unid_admin",
                "message" => " unidad administrativa"
                )
            ));         

        $this->validate(new PresenceOf(
            array(
                "field" => "num_bien",
                "message" => " número de bien"
                )
            ));                 

        $this->validate(new PresenceOf(
            array(
                "field" => "colores",
                "message" => " campo color"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "unidad_trabajo",
                "message" => " campo de unidad de trabajo"
                )
            ));        

        $this->validate(new PresenceOf(
            array(
                "field" => "responsable_pa",
                "message" => " responsable patrimonial"
                )
            ));                 

        $this->validate(new PresenceOf(
            array(
                "field" => "responsable_ad",
                "message" => " responsable administrativo"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "responsable_uso",
                "message" => " responsable de uso"
                )
            ));        

        $this->validate(new Uniqueness(
             array(
                 "field"  => "serial",
                 "message" => " serial debe ser único"
             )
         ));

        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
