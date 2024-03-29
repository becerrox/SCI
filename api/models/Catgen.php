<?php

/* Entidad Usuarios */

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Message,
    Phalcon\Mvc\Model\Validator\InclusionIn,
    Phalcon\Mvc\Model\Validator\Uniqueness,
    Phalcon\Mvc\Model\Validator\PresenceOf,
    Phalcon\Mvc\Model\Behavior\SoftDelete;


class Catgen extends Model{
    
    public function initialize(){
      $this->setSource("catgen");
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
                "message" => "Categoría General"
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
                "message" => "El Código de la categoría general debe ser único"
            )
        ));

       $this->validate(new Uniqueness(
            array(
                "field"  => "descripcion",
                "message" => "La descripcion debe ser único"
            )
        ));

        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
