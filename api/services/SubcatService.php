<?php

class SubcatService{

    public function listar(){

      $subcat=Subcat::find();

      if(count($subcat->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de configuración de bienes");
      }else{
          foreach($subcat as $scb){
               $subcat[]=array(
                "id" => $scb->id,
                "codigo" => $scb->codigo,
                "descripcion" => $scb->descripcion,
                "tipo" => $scb->tipo,
                "id_categoria_general_bienes" => $scb->id_categoria_general_bienes
                );
            }
      }
        return array("status" => 200, "mensaje" =>$users);
    }

        public function nuevo($scb){
            $subcat=new Subcat();

            $data=array(
                "id" => $scb->id,
                "codigo" => $scb->codigo,
                "descripcion" => $scb->descripcion,
                "tipo" => $scb->tipo,
                "id_categoria_general_bienes" => $scb->id_categoria_general_bienes                
                );

            if($subcat->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($subcat->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$us){
            $modificar=Subcat::find($id);
            if(count($modificar)>0){
                if(isset($us->pass) && $us->pass !== '' && $us->pass !== null && $us->pass !== 'undefined'){
                    $pass = sha1($us->pass);
                }else{
                    $pass = $modificar[0]->pass;
                }
                $data=array(     
                "codigo" => $scb->codigo,
                "descripcion" => $scb->descripcion,
                "tipo" => $scb->tipo
                );

                if($modificar->update($data)){
                        unset($data['pass']);
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($subcat->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $subcat=Subcat::find($id);
            if(count($subcat)){
                $subcat->delete();
                return array("status" => 200, "mensaje" => 'Configuración Eliminada');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }




}
?>
