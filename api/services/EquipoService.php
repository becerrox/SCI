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
                "descripcion" => strtoupper($eq->descripcion),
                "marca" => strtoupper($eq->marca),
                "modelo" => strtoupper($eq->modelo),
                "serial" => $eq->serial,
                "color" => strtoupper($eq->color),
                "estado" => $eq->estado,
                "unidad_admin" => strtoupper($eq->unidad_admin),
                "status" => 1,
                "responsable" => strtoupper($eq->responsable),
                "caracteristicas" => strtoupper($eq->caracteristicas),
                "fecha_modif" => date("Y-m-d h:i:s"),
                "unidad_trabajo" => strtoupper($eq->unidad_trabajo),
                "observaciones" => strtoupper($eq->observaciones),
                "serialSim" => strtoupper($eq->serialSim),
                "accesorios" => strtoupper($eq->accesorios),
                "planCelular" => strtoupper($eq->planCelular),
                "numeroCelular" => strtoupper($eq->numeroCelular),
                "estadoUsoEquipo" => strtoupper($eq->estadoUsoEquipo),
                "motivo" => strtoupper($eq->motivo)
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
                "descripcion" => strtoupper($eq->descripcion),
                "marca" => strtoupper($eq->marca),
                "modelo" => strtoupper($eq->modelo),
                "serial" => $eq->serial,
                "color" => strtoupper($eq->color),
                "estado" => strtoupper($eq->estado),
                "unidad_admin" => strtoupper($eq->unidad_admin),
                "status" => 1,
                "responsable" => strtoupper($eq->responsable),
                "caracteristicas" => strtoupper($eq->caracteristicas),
                "fecha_modif" => date("Y-m-d h:i:s"),
                "unidad_trabajo" => strtoupper($eq->unidad_trabajo),
                "observaciones" => strtoupper($eq->observaciones),
                "serialSim" => strtoupper($eq->serialSim),
                "accesorios" => strtoupper($eq->accesorios),
                "planCelular" => strtoupper($eq->planCelular),
                "numeroCelular" => strtoupper($eq->numeroCelular),
                "estadoUsoEquipo" => strtoupper($eq->estadoUsoEquipo),
                "motivo" => strtoupper($eq->motivo)
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
                "observaciones" => strtoupper($eq->observaciones),
                "estadoUsoEquipo" => "En proceso de disposición",
                "motivo" => strtoupper($eq->motivo)
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
