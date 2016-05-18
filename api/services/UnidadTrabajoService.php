<?php
class UnidadTrabajoService{
    public function listar($query){

          if(empty($query))
             $unidadTrabajo=UnidadTrabajo::find();
          else
          {
            $unidadTrabajo=UnidadTrabajo::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($unidadTrabajo->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de unidadTrabajo");
      }else{
            return array("status" => 200, "mensaje" =>$unidadTrabajo->toArray());
      }
    }
        public function nuevo($unitr){
            $unidadTrabajo=new UnidadTrabajo();
            $data=array(
                "codigo" => $unitr->codigo,
                "descripcion" => $unitr->descripcion
                );
            if($unidadTrabajo->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($unidadTrabajo->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$unitr){
            $modificar=UnidadTrabajo::find($id);
            if(count($modificar)>0){
                $data=array(
                    "codigo" => $unitr->codigo,
                    "descripcion" => $unitr->descripcion
                    );
                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($unidadTrabajo->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $unidadTrabajo=UnidadTrabajo::find($id);
            if(count($unidadTrabajo)){
                $unidadTrabajo->delete();
                return array("status" => 200, "mensaje" => 'unidadTrabajo Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
