<?php

/* Entidad Cateoría Específica */

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Message,
    Phalcon\Mvc\Model\Validator\InclusionIn,
    Phalcon\Mvc\Model\Validator\Uniqueness,
    Phalcon\Mvc\Model\Validator\PresenceOf,
    Phalcon\Mvc\Model\Behavior\SoftDelete;


class catesp extends Model{
    public function initialize(){
      $this->setSource("catesp");
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
                "message" => " categoría específica"
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
                "field"  => "codigo",
                "message" => "El Código de la categoría específica debe ser único"
            )
        ));

       $this->validate(new Uniqueness(
            array(
                "field"  => "descripcion",
                "message" => "La descripción debe ser única"
            )
        ));

        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
