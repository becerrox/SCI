<?php

class personalService{
    
    public function listar($query){

          if(empty($query))
             $personal=Personal::find();
          else
          {
            $personal=Personal::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($personal->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de personal");
      }else{
            return array("status" => 200, "mensaje" =>$personal->toArray());
      }
    }

        public function nuevo($pe){
            $personal=new Personal();

            $data=array(
                "ci_per" => $pe->ci_per,
                "nombres" => $pe->nombres,
                "apellidos" => $pe->apellidos,
                "cargo" => $pe->cargo,
                "telf_pers" => $pe->telf_pers,
                "telf_casa" => $pe->telf_casa,
                "correo" => $pe->correo,
                "f_nac" => $pe->f_nac,
                "fecha_creacion" => date("Y-m-d h:i:s"),
                "usuario_creacion" => 0,
                "usuario_modif" => 0,
                "status" => $pe->status,
                "unid_admin" => $pe->unid_admin,
                "id_usuario" => $pe->id_usuario,
                "nacionalidad" => $pe->nacionalidad
            );

            if($personal->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($personal->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$us){
            $modificar=Personal::find($id);
            if(count($modificar)>0){
                if(isset($us->pass) && $us->pass !== '' && $us->pass !== null && $us->pass !== 'undefined'){
                    $pass = sha1($us->pass);
                }else{
                    $pass = $modificar[0]->pass;
                }
                $data=array(
                    "ci_per" => $pe->ci_per,
                    "nombres" => $pe->nombres,
                    "apellidos" => $pe->apellidos,
                    "cargo" => $pe->cargo,
                    "telf_pers" => $pe->telf_pers,
                    "telf_casa" => $pe->telf_casa,
                    "correo" => $pe->correo,
                    "f_nac" => $pe->f_nac,
                    "fecha_modif" => date("Y-m-d h:i:s"),
                    "usuario_modif" => 0,
                    "status" => $pe->status,
                    "unid_admin" => $pe->unid_admin,
                    "nacionalidad" => $pe->nacionalidad
                );

                if($modificar->update($data)){
                        unset($data['pass']);
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($personal->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $personal=Personal::find($id);
            if(count($personal)){
                $personal->delete();
                return array("status" => 200, "mensaje" => 'Personal Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
           }
     }

}
?>
