<?php

class UnidadesService{

    public function listar($query){

          if(empty($query))
             $unidades=Unidades::find("status = 1");
          else
          {
            $unidades=Unidades::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($unidades->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de Unidades");
      }else{
            return array("status" => 200, "mensaje" =>$unidades->toArray());
      }
    }

        public function nuevo($uni){
            $unidades=new Unidades();

            $data=array(
                "descripcion" => mb_strtoupper($uni->descripcion, "UTF-8"),
                "status" => 1
            );
            if($unidades->save($data)){
                    $return = ($unidades->toArray());
                    return array("status" => 201, "mensaje" => $return);
            }else{
                $errors = array();
                foreach ($unidades->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$uni){
            $modificar=Unidades::find($id);
            if(count($modificar)>0){
                $data=array(
                    "descripcion" => mb_strtoupper($uni->descripcion, "UTF-8"),
                    "status" => 1
                );

                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($unidades->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $unidades=Unidades::find($id);
            if(count($unidades)){
                $unidades->delete();
                return array("status" => 200, "mensaje" => 'Unidades Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
           }
     }

}
?>
