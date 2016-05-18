<?php
class CargosService{
    public function listar($query){

          if(empty($query))
             $cargos=Cargos::find();
          else
          {
            $cargos=Cargos::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($cargos->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de cargos");
      }else{
            return array("status" => 200, "mensaje" =>$cargos->toArray());
      }
    }
        public function nuevo($carg){
            $cargos=new Cargos();
            $data=array(
                "cargo" => $carg->cargo
            );
            if($cargos->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($cargos->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$carg){
            $modificar=Cargos::find($id);
            if(count($modificar)>0){
                $data=array(
                    "cargo" => $carg->cargo
                );
                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($cargos->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $cargos=Cargos::find($id);
            if(count($cargos)){
                $cargos->delete();
                return array("status" => 200, "mensaje" => 'cargos Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
