<?php

/* Entidad Equipo */

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Message,
    Phalcon\Mvc\Model\Validator\InclusionIn,
    Phalcon\Mvc\Model\Validator\Uniqueness,
    Phalcon\Mvc\Model\Validator\PresenceOf,
    Phalcon\Mvc\Model\Behavior\SoftDelete;


class Configuracionbien extends Model{
    public function initialize(){
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
                "field" => "usuario",
                "message" => "El campo usuario es obligatorio"
                )
            ));
*/
        $this->validate(new PresenceOf(
            array(
                "field" => "codigo",
                "message" => "El campo código es obligatorio"
                )
            ));

       $this->validate(new Uniqueness(
            array(
                "field"  => "tipo",
                "message" => "El campo tipo es obligatorio"
            )
        ));

       $this->validate(new Uniqueness(
            array(
                "field"  => "codigo",
                "message" => "El codigo debe ser único"
            )
        ));

        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
