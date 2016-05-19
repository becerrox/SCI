<?php
class ResponsablesService{
    public function listar($query){

          if(empty($query))
             $responsables=Responsables::find("status = 1");
          else
          {
            $responsables=Responsables::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($responsables->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de responsables");
      }else{
            return array("status" => 200, "mensaje" =>$responsables->toArray());
      }
    }
        public function nuevo($resp){
            $responsables=new Responsables();
            $data=array(
                "cedula" => strtoupper($resp->cedula),
                "nombres" => strtoupper($resp->nombres),
                "apellidos" => strtoupper($resp->apellidos),
                "cargo" => strtoupper($resp->cargo),
                "unidad_trabajo" => strtoupper($resp->unidad_trabajo),
                "unidad_admin" => strtoupper($resp->unidad_admin),                
                "fecha_creacion" => date("Y-m-D h:i:s"),
                "fecha_modif" => date("Y-m-D h:i:s"),
                "status" => 1
            );
            if($responsables->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($responsables->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$resp){
            $modificar=Responsables::find($id);
            if(count($modificar)>0){
                $data=array(
                    "cedula" => strtoupper($resp->cedula),
                    "nombres" => strtoupper($resp->nombres),
                    "apellidos" => strtoupper($resp->apellidos),
                    "cargo" => strtoupper($resp->cargo),
                    "unidad_trabajo" => strtoupper($resp->unidad_trabajo),
                    "fecha_modif" => date("Y-m-D h:i:s"),
                    "status" => 1
                );
                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($responsables->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $responsables=Responsables::find($id);
            if(count($responsables)){
                $responsables->delete();
                return array("status" => 200, "mensaje" => 'responsables Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
