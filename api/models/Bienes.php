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
      $this->setSource("bienesgeneral");
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
                "field" => "cod_general",
                "message" => "El código general es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "cod_subcat",
                "message" => "El código de subcategoría es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "cod_catespf",
                "message" => "El código de categoría específica es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "estatus_uso_bien",
                "message" => "El campo estatus del uso del bien es obligatorio"
                )
            ));

       $this->validate(new PresenceOf(
            array(
                "field" => "marca",
                "message" => "El campo marca es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "num_bien",
                "message" => "El campo num_bien es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "cat_unid_admin",
                "message" => "El campo de categoría de la unidad administrativa es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "unidad_trabajo",
                "message" => "El campo unidad de trabajo es obligatorio"
                )
            ));

       $this->validate(new Uniqueness(
            array(
                "field"  => "serial",
                "message" => "El serial debe ser único"
            )
        ));

       $this->validate(new Uniqueness(
            array(
                "field"  => "num_bien",
                "message" => "El número de bien debe ser único"
            )
        ));

        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
