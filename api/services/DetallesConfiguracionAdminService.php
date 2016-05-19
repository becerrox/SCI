<?php
class DetallesConfiguracionAdminService{
    public function listar($query){

          if(empty($query))
             $detallesConfiguracionAdmin=DetallesConfiguracionAdmin::find();
          else
          {
            $detallesConfiguracionAdmin=DetallesConfiguracionAdmin::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($detallesConfiguracionAdmin->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de detallesConfiguracionAdmin");
      }else{
            return array("status" => 200, "mensaje" =>$detallesConfiguracionAdmin->toArray());
      }
    }
        public function nuevo($dconfbie){
            $detallesConfiguracionAdmin=new DetallesConfiguracionAdmin();
            $data=array(
                "descripcion" => strtoupper($dconfbie->descripcion)
                );
            if($detallesConfiguracionAdmin->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($detallesConfiguracionAdmin->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$dconfbie){
            $modificar=DetallesConfiguracionAdmin::find($id);
            if(count($modificar)>0){
                $data=array(
                    "descripcion" => strtoupper($dconfbie->descripcion)
                    );
                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($detallesConfiguracionAdmin->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $detallesConfiguracionAdmin=DetallesConfiguracionAdmin::find($id);
            if(count($detallesConfiguracionAdmin)){
                $detallesConfiguracionAdmin->delete();
                return array("status" => 200, "mensaje" => 'detallesConfiguracionAdmin Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
