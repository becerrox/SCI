<?php

class ConfiguracionbienService{

    public function listar(){

      $configuracionbien=Configuracionbien::find("status=1");

      if(count($configuracionbien->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de configuración de bienes");
      }else{
          foreach($configuracionbien as $cfb){
               $configuracionbien[]=array(
                "id" => $cfb->id,
                "codigo" => $cfb->codigo,
                "descripcion" => $cfb->descripcion,
                "tipo" => $cfb->tipo
                );
            }
      }
        return array("status" => 200, "mensaje" =>$users);
    }

        public function nuevo($cfb){
            $configuracionbien=new configuracionbien();

            $data=array(
                "id" => $cfb->id,
                "codigo" => $cfb->codigo,
                "descripcion" => $cfb->descripcion,
                "tipo" => $cfb->tipo
                );

            if($configuracionbien->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($configuracionbien->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$us){
            $modificar=Configuracionbien::find($id);
            if(count($modificar)>0){
                if(isset($us->pass) && $us->pass !== '' && $us->pass !== null && $us->pass !== 'undefined'){
                    $pass = sha1($us->pass);
                }else{
                    $pass = $modificar[0]->pass;
                }
                $data=array(     
                "codigo" => $cfb->codigo,
                "descripcion" => $cfb->descripcion,
                "tipo" => $cfb->tipo
                );

                if($modificar->update($data)){
                        unset($data['pass']);
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($configuracionbien->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $configuracionbien=Configuracionbien::find($id);
            if(count($configuracionbien)){
                $configuracionbien->delete();
                return array("status" => 200, "mensaje" => 'Configuración Eliminada');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }




}
?>
