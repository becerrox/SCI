<?php
class SedesService{
    public function listar($query){

          if(empty($query))
             $sedes=Sedes::find();
          else
          {
            $sedes=Sedes::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($sedes->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de sedes");
      }else{
            return array("status" => 200, "mensaje" =>$sedes->toArray());
      }
    }
        public function nuevo($sed){
            $sedes=new Sedes();
            $data=array(
                "sede" => $sed->sede
            );
            if($sedes->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($sedes->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$sed){
            $modificar=Sedes::find($id);
            if(count($modificar)>0){
                $data=array(
                    "sede" => $sed->sede
                );
                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($sedes->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $sedes=Sedes::find($id);
            if(count($sedes)){
                $sedes->delete();
                return array("status" => 200, "mensaje" => 'sedes Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
