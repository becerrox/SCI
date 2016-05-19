<?php
class ConfiguracionAdminService{
    public function listar($query){

          if(empty($query))
             $configuracionAdmin=ConfiguracionAdmin::find();
          else
          {
            $configuracionAdmin=ConfiguracionAdmin::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($configuracionAdmin->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de ConfiguracionAdmin");
      }else{
            return array("status" => 200, "mensaje" =>$configuracionAdmin->toArray());
      }
    }
        public function nuevo($confeq){
            $configuracionAdmin=new ConfiguracionAdmin();
            $data=array(
                "tipo" => strtoupper($confeq->tipo),
                "descripcion" => strtoupper($confeq->descripcion),
                "status" => 1
            );
            if($configuracionAdmin->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($configuracionAdmin->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$confeq){
            $modificar=ConfiguracionAdmin::find($id);
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
                    foreach ($configuracionAdmin->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $configuracionAdmin=ConfiguracionAdmin::find($id);
            if(count($configuracionAdmin)){
                $configuracionAdmin->delete();
                return array("status" => 200, "mensaje" => 'ConfiguracionAdmin Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
