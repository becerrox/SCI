<?php
class EquipoService{
    public function listar($query){

          if(empty($query))
             $equipo=Equipo::find("status = 1");
          else
          {
            $equipo=Equipo::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($equipo->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de equipo");
      }else{
            return array("status" => 200, "mensaje" =>$equipo->toArray());
      }
    }
        public function nuevo($eq){
            $equipo=new Equipo();
            $data=array(
                "descripcion" => mb_strtoupper($eq->descripcion, "UTF-8"),
                "marca" => mb_strtoupper($eq->marca, "UTF-8"),
                "modelo" => mb_strtoupper($eq->modelo, "UTF-8"),
                "serial" => $eq->serial,
                "color" => mb_strtoupper($eq->color, "UTF-8"),
                "estado" => mb_strtoupper($eq->estado, "UTF-8"),
                "unidad_admin" => mb_strtoupper($eq->unidad_admin, "UTF-8"),
                "status" => 1,
                "responsable" => mb_strtoupper($eq->responsable, "UTF-8"),
                "caracteristicas" => mb_strtoupper($eq->caracteristicas, "UTF-8"),
                "fecha_modif" => date("Y-m-d h:i:s"),
                "unidad_trabajo" => mb_strtoupper($eq->unidad_trabajo, "UTF-8"),
                "observaciones" => mb_strtoupper($eq->observaciones, "UTF-8"),
                "serialSim" => mb_strtoupper($eq->serialSim, "UTF-8"),
                "accesorios" => mb_strtoupper($eq->accesorios, "UTF-8"),
                "planCelular" => mb_strtoupper($eq->planCelular, "UTF-8"),
                "numeroCelular" => mb_strtoupper($eq->numeroCelular, "UTF-8"),
                "estadoUsoEquipo" => mb_strtoupper($eq->estadoUsoEquipo, "UTF-8"),
                "motivo" => mb_strtoupper($eq->motivo, "UTF-8")
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

        public function modificar($id,$eq){
            $modificar=Equipo::find($id);
            if(count($modificar)>0){
                $data=array(
                "descripcion" => mb_strtoupper($eq->descripcion, "UTF-8"),
                "marca" => mb_strtoupper($eq->marca, "UTF-8"),
                "modelo" => mb_strtoupper($eq->modelo, "UTF-8"),
                "serial" => $eq->serial,
                "color" => mb_strtoupper($eq->color, "UTF-8"),
                "estado" => mb_strtoupper($eq->estado, "UTF-8"),
                "unidad_admin" => mb_strtoupper($eq->unidad_admin, "UTF-8"),
                "status" => 1,
                "responsable" => mb_strtoupper($eq->responsable, "UTF-8"),
                "caracteristicas" => mb_strtoupper($eq->caracteristicas, "UTF-8"),
                "fecha_modif" => date("Y-m-d h:i:s"),
                "unidad_trabajo" => mb_strtoupper($eq->unidad_trabajo, "UTF-8"),
                "observaciones" => mb_strtoupper($eq->observaciones, "UTF-8"),
                "serialSim" => mb_strtoupper($eq->serialSim, "UTF-8"),
                "accesorios" => mb_strtoupper($eq->accesorios, "UTF-8"),
                "planCelular" => mb_strtoupper($eq->planCelular, "UTF-8"),
                "numeroCelular" => mb_strtoupper($eq->numeroCelular, "UTF-8"),
                "estadoUsoEquipo" => mb_strtoupper($eq->estadoUsoEquipo, "UTF-8"),
                "motivo" => mb_strtoupper($eq->motivo, "UTF-8")
                );
                if($modificar->update($data)){
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

        public function solvencia($id,$eq){
            $solvencia=Equipo::find($id);
            if(count($solvencia)>0){
                $data=array(
                "status" => 1,
                "fecha_modif" => date("Y-m-d h:i:s"),
                "observaciones" => mb_strtoupper($eq->observaciones, "UTF-8"),
                "estadoUsoEquipo" => "EN PROCESO DE DISPOCISIÓN",
                "motivo" => mb_strtoupper($eq->motivo, "UTF-8")
                );
                if($solvencia->update($data)){
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
                return array("status" => 404, "mensaje" =>"El registro que intenta solventar no existe");
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
