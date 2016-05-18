<?php
class NivelesService{
        public function listar($query = []){

          if(empty($query))
             $niveles=Niveles::find();
          else
          {
            $niveles=Niveles::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

          if(count($niveles->toArray())==0){
                return array("status" => 404, "mensaje" => "No hay registros de niveles");
          }else{
                return array("status" => 200, "mensaje" =>$niveles->toArray());
          }
        }

        
        public function nuevo($niv){
            $niveles=new niveles();
            $data=array(
                  "codigo" => $niv->codigo,
                  "nivel" => $niv->nivel
            );
            if($niveles->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($niveles->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$niv){
            $modificar=Niveles::find($id);
            if(count($modificar)>0){
                $data=array(
                  "codigo" => $niv->codigo,
                  "nivel" => $niv->nivel
                );

                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($niveles->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }
        public function eliminar($id){
            $niveles=Niveles::find($id);
            if(count($niveles)){
                $niveles->delete();
                return array("status" => 200, "mensaje" => 'niveles Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
