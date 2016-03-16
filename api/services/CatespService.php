<?php

class CatespService{

    public function listar(){

      $catesp=Catesp::find();

      if(count($catesp->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de configuración de bienes");
      }else{
          foreach($catesp as $ceb){
               $catesp[]=array(
                "id" => $ceb->id,
                "codigo" => $ceb->codigo,
                "descripcion" => $ceb->descripcion,
                "tipo" => $ceb->tipo,
                "id_sub_categorias_bienes" => $ceb->id_sub_categorias_bienes
                );
            }
      }
        return array("status" => 200, "mensaje" =>$users);
    }

        public function nuevo($ceb){
            $catesp=new Catesp();

            $data=array(
                "id" => $ceb->id,
                "codigo" => $ceb->codigo,
                "descripcion" => $ceb->descripcion,
                "tipo" => $ceb->tipo,
                "id_sub_categorias_bienes" => $ceb->id_sub_categorias_bienes                
                );

            if($catesp->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($catesp->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$us){
            $modificar=Catesp::find($id);
            if(count($modificar)>0){
                if(isset($us->pass) && $us->pass !== '' && $us->pass !== null && $us->pass !== 'undefined'){
                    $pass = sha1($us->pass);
                }else{
                    $pass = $modificar[0]->pass;
                }
                $data=array(     
                "codigo" => $ceb->codigo,
                "descripcion" => $ceb->descripcion,
                "tipo" => $ceb->tipo
                );

                if($modificar->update($data)){
                        unset($data['pass']);
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($catesp->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $catesp=Catesp::find($id);
            if(count($catesp)){
                $catesp->delete();
                return array("status" => 200, "mensaje" => 'Configuración Eliminada');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }




}
?>
