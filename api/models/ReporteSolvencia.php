<?php

/* Entidad ReporteSolvencia */

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Message,
    Phalcon\Mvc\Model\Validator\InclusionIn,
    Phalcon\Mvc\Model\Validator\Uniqueness,
    Phalcon\Mvc\Model\Validator\PresenceOf,
    Phalcon\Mvc\Model\Behavior\SoftDelete;


class ReporteSolvencia extends Model{

    public function initialize(){
      $this->setSource("reporteSolvencia");
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

/*       $this->validate(new Uniqueness(
            array(
                "field"  => "descripcion",
                "message" => "La unidad debe ser única"
            )
        ));*/

        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
