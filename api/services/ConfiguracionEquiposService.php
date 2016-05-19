<?php
class ConfiguracionEquipoService{
    public function listar($query){

          if(empty($query))
             $configuracionEquipo=ConfiguracionEquipo::find();
          else
          {
            $configuracionEquipo=ConfiguracionEquipo::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($configuracionEquipo->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de configuracionEquipo");
      }else{
            return array("status" => 200, "mensaje" =>$configuracionEquipo->toArray());
      }
    }
        public function nuevo($confeq){
            $configuracionEquipo=new configuracionEquipo();
            $data=array(
                "descripcion" => strtoupper($confeq->descripcion),
                "tipo" => strtoupper($confeq->tipo)
            );
            if($configuracionEquipo->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($configuracionEquipo->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$confeq){
            $modificar=ConfiguracionEquipo::find($id);
            if(count($modificar)>0){
                $data=array(
                    "descripcion" => strtoupper($confeq->descripcion),
                    "tipo" => strtoupper($confeq->tipo)
                );
                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($configuracionEquipo->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $configuracionEquipo=ConfiguracionEquipo::find($id);
            if(count($configuracionEquipo)){
                $configuracionEquipo->delete();
                return array("status" => 200, "mensaje" => 'configuracionEquipo Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
