<?php

class SubcatService{

    public function listar($query){

          if(empty($query))
             $subcat=Subcat::find();
          else
          {
            $subcat = Subcat::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($subcat->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de Sub-Categorías");
      }else{
            return array("status" => 200, "mensaje" =>$subcat->toArray());
      }
    }

        public function nuevo($scb){
            $subcat=new Subcat();

            $data=array(
                "codigo" => mb_strtoupper($scb->codigo, "UTF-8"),
                "descripcion" => mb_strtoupper($scb->descripcion, "UTF-8"),
                "status" => mb_strtoupper($scb->status, "UTF-8"),
                "catgen" => mb_strtoupper($scb->catgen, "UTF-8")                
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
                "codigo" => mb_strtoupper($scb->codigo, "UTF-8"),
                "descripcion" => mb_strtoupper($scb->descripcion, "UTF-8"),
                "status" => mb_strtoupper($scb->status, "UTF-8")
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
