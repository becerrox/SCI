<?php

class DependenciasService{

    public function listar($query){

          if(empty($query))
             $dependencias=Dependencias::find();
          else
          {
            $dependencias=Dependencias::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($dependencias->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de Dependencias");
      }else{
            return array("status" => 200, "mensaje" =>$dependencias->toArray());
      }
    }

        public function nuevo($dep){
            $dependencias=new Dependencias();

            $data=array(
                "pertenece" => mb_strtoupper($dep->pertenece, "UTF-8"),
                "descripcion" => mb_strtoupper($dep->descripcion, "UTF-8"),
                "status" => 1
            );
            if($dependencias->save($data)){
                    $return = ($dependencias->toArray());
                    return array("status" => 201, "mensaje" => $return);
            }else{
                $errors = array();
                foreach ($dependencias->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$dep){
            $modificar=Dependencias::find($id);
            if(count($modificar)>0){
                $data=array(
                    "pertenece" => mb_strtoupper($dep->pertenece, "UTF-8"),
                    "descripcion" => mb_strtoupper($dep->descripcion, "UTF-8"),
                    "status" => 1
                );

                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($dependencias->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $dependencias=Dependencias::find($id);
            if(count($dependencias)){
                $dependencias->delete();
                return array("status" => 200, "mensaje" => 'Dependencias Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
           }
     }

}
?>
