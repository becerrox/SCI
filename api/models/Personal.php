<?php

/* Entidad Personal */

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Message,
    Phalcon\Mvc\Model\Validator\InclusionIn,
    Phalcon\Mvc\Model\Validator\Uniqueness,
    Phalcon\Mvc\Model\Validator\PresenceOf,
    Phalcon\Mvc\Model\Behavior\SoftDelete;


    class Personal extends Model{
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

        $this->validate(new PresenceOf(
            array(
                "field" => "CI_per",
                "message" => "La cédula es obligatoria"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "nombre",
                "message" => "El campo nombre es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "apellidos",
                "message" => "El campo apellidos es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "cargo",
                "message" => "El campo cargo es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "telf_pers",
                "message" => "El campo teléfono personal es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "telf_casa",
                "message" => "El campo teléfono es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "correo",
                "message" => "El campo correo es obligatorio"
                )
            ));

        $this->validate(new PresenceOf(
            array(
                "field" => "f_nac",
                "message" => "El campo fecha de nacimiento es obligatorio"
                )
            ));

       $this->validate(new Uniqueness(
            array(
                "field"  => "CI_per",
                "message" => "La cédula debe ser única"
            )
        ));

       $this->validate(new Uniqueness(
            array(
                "field"  => "correo",
                "message" => "El correo debe ser único"
            )
        ));

        if ($this->validationHasFailed() == true) {
            return false;
        }


    }

}
