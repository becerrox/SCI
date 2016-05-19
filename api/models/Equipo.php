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
                "field" => "serial",
                "message" => "El serial es obligatorio"
                )
            ));
*/
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

 /*       $this->validate(new PresenceOf(
            array(
                "field" => "responsable",
                "message" => "El responsable es obligatorio"
                )
            ));
*/
        $this->validate(new PresenceOf(
            array(
                "field" => "estado",
                "message" => "La estado es obligatoria"
                )
            ));

/*        $this->validate(new PresenceOf(
            array(
                "field" => "unidad_admin",
                "message" => "La unidad administrativa es obligatoria"
                )
            ));         */

        $this->validate(new PresenceOf(
            array(
                "field" => "color",
                "message" => "El campo color es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "caracteristicas",
                "message" => "El campo caracteristicas es obligatorio"
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
