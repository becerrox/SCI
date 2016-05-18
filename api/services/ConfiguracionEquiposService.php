<?php
class ConfiguracionEquipo{
    public function listar($query){

          if(empty($query))
             $confequipo=ConfEquipo::find("status = 1");
          else
          {
            $confequipo=ConfEquipo::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($confequipo->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de confequipo");
      }else{
            return array("status" => 200, "mensaje" =>$confequipo->toArray());
      }
    }
        public function nuevo($confeq){
            $confequipo=new confEquipo();
            $data=array(
                "descripcion" => $confeq->descripcion,
                "tipo" => $confeq->tipo
            );
            if($confequipo->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($confequipo->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$confeq){
            $modificar=ConfEquipo::find($id);
            if(count($modificar)>0){
                $data=array(
                    "descripcion" => $confeq->descripcion,
                    "tipo" => $confeq->tipo
                );
                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($confequipo->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $confequipo=ConfEquipo::find($id);
            if(count($confequipo)){
                $confequipo->delete();
                return array("status" => 200, "mensaje" => 'confEquipo Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
