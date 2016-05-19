<?php
class DetallesConfiguracionEquiposService{
    public function listar($query){

          if(empty($query))
             $detallesConfiguracionEquipos=DetallesConfiguracionEquipos::find();
          else
          {
            $detallesConfiguracionEquipos=DetallesConfiguracionEquipos::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($detallesConfiguracionEquipos->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de detallesConfiguracionEquipos");
      }else{
            return array("status" => 200, "mensaje" =>$detallesConfiguracionEquipos->toArray());
      }
    }
        public function nuevo($dconfeq){
            $detallesConfiguracionEquipos=new DetallesConfiguracionEquipos();
            $data=array(
                "descripcion" => strtoupper($dconfeq->descripcion)
            );
            if($detallesConfiguracionEquipos->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($detallesConfiguracionEquipos->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$dconfeq){
            $modificar=DetallesConfiguracionEquipos::find($id);
            if(count($modificar)>0){
                $data=array(
                    "descripcion" => strtoupper($dconfeq->descripcion)
                    );
                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($detallesConfiguracionEquipos->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $detallesConfiguracionEquipos=DetallesConfiguracionEquipos::find($id);
            if(count($detallesConfiguracionEquipos)){
                $detallesConfiguracionEquipos->delete();
                return array("status" => 200, "mensaje" => 'detallesConfiguracionEquipos Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
