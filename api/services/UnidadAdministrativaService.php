<?php
class UnidadAdministrativaService{
    public function listar($query){

          if(empty($query))
             $unidadAdministrativa=UnidadAdministrativa::find();
          else
          {
            $unidadAdministrativa=UnidadAdministrativa::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($unidadAdministrativa->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de unidadAdministrativa");
      }else{
            return array("status" => 200, "mensaje" =>$unidadAdministrativa->toArray());
      }
    }
        public function nuevo($uniad){
            $unidadAdministrativa=new UnidadAdministrativa();

            $data=array(
                "descripcion" => mb_strtoupper($uniad->descripcion, "UTF-8")
            );
            if($unidadAdministrativa->save($data)){
                    $return = ($unidadAdministrativa->toArray());
                    return array("status" => 201, "mensaje" => $return);
            }else{
                $errors = array();
                foreach ($unidadAdministrativa->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$uniad){
            $modificar=UnidadAdministrativa::find($id);
            if(count($modificar)>0){
                $data=array(
                    "descripcion" => mb_strtoupper($uniad->descripcion, "UTF-8")
                    );
                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($unidadAdministrativa->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $unidadAdministrativa=UnidadAdministrativa::find($id);
            if(count($unidadAdministrativa)){
                $unidadAdministrativa->delete();
                return array("status" => 200, "mensaje" => 'unidadAdministrativa Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
