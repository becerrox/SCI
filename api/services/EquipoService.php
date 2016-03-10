<?php

class EquipoService{

    public function listar(){

      $equipo=Equipo::find("status=1");

      if(count($equipo->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de equipos");
      }else{
          foreach($equipo as $eq){
               $equipo[]=array(
                "item" => $eq->item,
                "descripcion" => $eq->descripcion,
                "marca" => $eq->marca,
                "modelo" => $eq->modelo,
                "serial" => $eq->serial,
                "color" => $eq->color,
                "estado" => $eq->estado,
                "cod_bien" => $eq->cod_bien,
                "id" => $eq->id,
                "cantidad" => $eq->cantidad,
                "id_Ubicacion_ubicacion" => $eq->id_Ubicacion_ubicacion,
                "status" => $eq->status
                );
            }
      }
        return array("status" => 200, "mensaje" =>$users);
    }

        public function nuevo($eq){
            $equipo=new Equipo();

            $data=array(
                    "item" => $eq->item,
                    "descripcion" => $eq->descripcion,
                    "marca" => $eq->marca,
                    "modelo" => $eq->modelo,
                    "serial" => $eq->serial,
                    "color" => $eq->color,
                    "estado" => $eq->estado,
                    "cod_bien" => $eq->cod_bien,
                    "id" => $eq->id,
                    "cantidad" => $eq->cantidad,
                    "id_Ubicacion_ubicacion" => $eq->id_Ubicacion_ubicacion,
                    "fecha_creacion" => date("Y-m-d h:i:s"),
                    "usuario_creacion" => 0,
                    "usuario_modif" => 0,
                    "status" => $eq->status
            );

            if($equipo->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($equipo->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$us){
            $modificar=Equipo::find($id);
            if(count($modificar)>0){
                if(isset($us->pass) && $us->pass !== '' && $us->pass !== null && $us->pass !== 'undefined'){
                    $pass = sha1($us->pass);
                }else{
                    $pass = $modificar[0]->pass;
                }
                $data=array(
                    "item" => $eq->item,
                    "descripcion" => $eq->descripcion,
                    "marca" => $eq->marca,
                    "modelo" => $eq->modelo,
                    "serial" => $eq->serial,
                    "color" => $eq->color,
                    "estado" => $eq->estado,
                    "cod_bien" => $eq->cod_bien,
                    "cantidad" => $eq->cantidad,
                    "id_Ubicacion_ubicacion" => $eq->id_Ubicacion_ubicacion,
                    "usuario_creacion" => 0,
                    "usuario_modif" => 0,
                    "status" => $eq->status

                );

                if($modificar->update($data)){
                        unset($data['pass']);
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($equipo->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $equipo=Equipo::find($id);
            if(count($equipo)){
                $equipo->delete();
                return array("status" => 200, "mensaje" => 'Equipo Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }




}
?>
