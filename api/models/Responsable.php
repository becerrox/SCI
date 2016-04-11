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

/*        $this->validate(new PresenceOf(
            array(
                "field" => "codigo",
                "message" => "El código es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "descripcion",
                "message" => "La descripción es obligatoria"
                )
            ));*/

       $this->validate(new Uniqueness(
            array(
                "field"  => "ci_responsable",
                "message" => "El codigo debe ser único"
            )
        ));

        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
