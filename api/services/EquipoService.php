<?php
class EquipoService{
    public function listar(){
      $equipo=Equipo::find("status=1");
      if(count($equipo->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de equipos");
      }else{
          foreach($equipo as $eq){
               $equipo[]=array(
                "id" => $eq->id,
                "descripcion" => $eq->descripcion,
                "marca" => $eq->marca,
                "modelo" => $eq->modelo,
                "serial" => $eq->serial,
                "color" => $eq->color,
                "estado" => $eq->estado,
                "cod_bien" => $eq->cod_bien,
                "ubicacion" => $eq->ubicacion,
                "status" => $eq->status,
                "responsable" => $eq->responsable,
                "caracteristicas" => $eq->caracteristicas,
                "fecha_modif" => $eq->fecha_modif
                );
            }
      }
        return array("status" => 200, "mensaje" =>$users);
    }
        public function nuevo($eq){
            $equipo=new Equipo();
            $data=array(
                "descripcion" => $eq->descripcion,
                "marca" => $eq->marca,
                "modelo" => $eq->modelo,
                "serial" => $eq->serial,
                "color" => $eq->color,
                "estado" => $eq->estado,
                "cod_bien" => $eq->cod_bien,
                "ubicacion" => $eq->ubicacion,
                "status" => $eq->status,
                "responsable" => $eq->responsable,
                "caracteristicas" => $eq->caracteristicas,
                "fecha_modif" => $eq->now()
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
                "descripcion" => $eq->descripcion,
                "marca" => $eq->marca,
                "modelo" => $eq->modelo,
                "serial" => $eq->serial,
                "color" => $eq->color,
                "estado" => $eq->estado,
                "cod_bien" => $eq->cod_bien,
                "ubicacion" => $eq->ubicacion,
                "status" => $eq->status,
                "responsable" => $eq->responsable,
                "caracteristicas" => $eq->caracteristicas,
                "fecha_modif" => $eq->fecha_modif
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