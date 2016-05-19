<?php
class NumeroBienService{
    public function listar($query){

          if(empty($query))
             $numeroBien=NumeroBien::find();
          else
          {
            $numeroBien=NumeroBien::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($numeroBien->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de numeroBien");
      }else{
            return array("status" => 200, "mensaje" =>$numeroBien->toArray());
      }
    }
        public function nuevo($numbie){
            $numeroBien=new NumeroBien();
            $data=array(
                "numero_bien" => strtoupper($numbie->numero_bien),
                "descripcion" => strtoupper($numbie->descripcion)
                );
            if($numeroBien->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($numeroBien->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$numbie){
            $modificar=NumeroBien::find($id);
            if(count($modificar)>0){
                $data=array(
                    "numero_bien" => strtoupper($numbie->numero_bien),
                    "descripcion" => strtoupper($numbie->descripcion)
                    );
                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($numeroBien->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $numeroBien=NumeroBien::find($id);
            if(count($numeroBien)){
                $numeroBien->delete();
                return array("status" => 200, "mensaje" => 'numeroBien Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
