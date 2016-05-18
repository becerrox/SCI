<?php
class ConfiguracionService{
        public function listar($query = []){

          if(empty($query))
             $configuracion=Configuracion::find();
          else
          {
            $configuracion = Configuracion::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

          if(count($configuracion->toArray())==0){
                return array("status" => 404, "mensaje" => "No hay registros de configuracion");
          }else{
                return array("status" => 200, "mensaje" =>$configuracion->toArray());
          }
        }

        
        public function nuevo($conf){
            $configuracion=new Configuracion();
            $data=array(
                  "codigo" => $conf->codigo,
                  "descripcion" => $conf->descripcion,
                  "tipo" => $conf->tipo
            );
            if($configuracion->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($configuracion->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$conf){
            $modificar=Configuracion::find($id);
            if(count($modificar)>0){
                $data=array(
                  "codigo" => $conf->codigo,
                  "descripcion" => $conf->descripcion,
                  "tipo" => $conf->tipo
                );

                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($configuracion->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }
        public function eliminar($id){
            $configuracion=Configuracion::find($id);
            if(count($configuracion)){
                $configuracion->delete();
                return array("status" => 200, "mensaje" => 'configuracion Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
