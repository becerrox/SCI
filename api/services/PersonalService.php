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
                "ci_per" => mb_strtoupper($pe->ci_per, "UTF-8"),
                "nombres" => mb_strtoupper($pe->nombres, "UTF-8"),
                "apellidos" => mb_strtoupper($pe->apellidos, "UTF-8"),
                "cargo" => mb_strtoupper($pe->cargo, "UTF-8"),
                "telf_pers" => mb_strtoupper($pe->telf_pers, "UTF-8"),
                "correo" => mb_strtoupper($pe->correo, "UTF-8"),
                "f_nac" => mb_strtoupper($pe->f_nac, "UTF-8"),
                "fecha_creacion" => date("Y-m-d h:i:s"),
                "fecha_modif" => date("Y-m-d h:i:s"),
                "status" => 1,
                "unidad_trabajo" => mb_strtoupper($pe->unidad_trabajo, "UTF-8"),
                "unidad_admin" => mb_strtoupper($pe->unidad_admin, "UTF-8"),
                "id_usuario" => mb_strtoupper($pe->id_usuario, "UTF-8")
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

        public function modificar($id,$pe){
            $modificar=Personal::find($id);
            if(count($modificar)>0){
                $data=array(
                    "ci_per" => mb_strtoupper($pe->ci_per, "UTF-8"),
                    "nombres" => mb_strtoupper($pe->nombres, "UTF-8"),
                    "apellidos" => mb_strtoupper($pe->apellidos, "UTF-8"),
                    "cargo" => mb_strtoupper($pe->cargo, "UTF-8"),
                    "telf_pers" => mb_strtoupper($pe->telf_pers, "UTF-8"),
                    "correo" => mb_strtoupper($pe->correo, "UTF-8"),
                    "f_nac" => mb_strtoupper($pe->f_nac, "UTF-8"),
                    "fecha_modif" => date("Y-m-d h:i:s"),
                    "status" => 1,
                    "unidad_trabajo" => mb_strtoupper($pe->unidad_trabajo, "UTF-8"),
                    "unidad_admin" => mb_strtoupper($pe->unidad_admin, "UTF-8"),
                    );
                if($modificar->update($data)){
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
