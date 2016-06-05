<?php

class CatespService{

    public function listar($query){

          if(empty($query))
             $catesp=Catesp::find("status = 1");
          else
          {
            $catesp = Catesp::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($catesp->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de Categoría Específica");
      }else{
            return array("status" => 200, "mensaje" =>$catesp->toArray());
      }
    }

        public function nuevo($cce){
            $catesp=new Catesp();

            $data=array(
                "codigo" => mb_strtoupper($cce->codigo, "UTF-8"),
                "descripcion" => mb_strtoupper($cce->descripcion, "UTF-8"),
                "status" => 1,
                "subcat" => mb_strtoupper($cce->subcat, "UTF-8")                
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
                $data=array(     
                "codigo" => mb_strtoupper($cce->codigo, "UTF-8"),
                "descripcion" => mb_strtoupper($cce->descripcion, "UTF-8"),
                "status" => 1
                );

                if($modificar->update($data)){
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
