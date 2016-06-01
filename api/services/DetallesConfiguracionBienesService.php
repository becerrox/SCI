<?php
class DetallesConfiguracionBienesService{
    public function listar($query){

          if(empty($query))
             $detallesConfiguracionBienes=DetallesConfiguracionBienes::find();
          else
          {
            $detallesConfiguracionBienes=DetallesConfiguracionBienes::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($detallesConfiguracionBienes->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de detallesConfiguracionBienes");
      }else{
            return array("status" => 200, "mensaje" =>$detallesConfiguracionBienes->toArray());
      }
    }
        public function nuevo($dconfbie){
            $detallesConfiguracionBienes=new DetallesConfiguracionBienes();
            $data=array(
                "descripcion" => mb_strtoupper($dconfbie->descripcion, "UTF-8")
                );
            if($detallesConfiguracionBienes->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($detallesConfiguracionBienes->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$dconfbie){
            $modificar=DetallesConfiguracionBienes::find($id);
            if(count($modificar)>0){
                $data=array(
                    "descripcion" => mb_strtoupper($dconfbie->descripcion, "UTF-8")
                    );
                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($detallesConfiguracionBienes->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $detallesConfiguracionBienes=DetallesConfiguracionBienes::find($id);
            if(count($detallesConfiguracionBienes)){
                $detallesConfiguracionBienes->delete();
                return array("status" => 200, "mensaje" => 'detallesConfiguracionBienes Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
