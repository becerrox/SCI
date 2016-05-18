<?php

/* Entidad Configuracion de Equipo */

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Message,
    Phalcon\Mvc\Model\Validator\InclusionIn,
    Phalcon\Mvc\Model\Validator\Uniqueness,
    Phalcon\Mvc\Model\Validator\PresenceOf,
    Phalcon\Mvc\Model\Behavior\SoftDelete;


class ConfiguracionEquipo extends Model{

    public function initialize(){
      $this->setSource("configuracion_equipo");
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
                "field" => "tipo",
                "message" => "El tipo es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "descripcion",
                "message" => "La descripción es obligatoria"
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
