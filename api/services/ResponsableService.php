<?php
class responsableService{
        public function listar($query = []){

          if(empty($query))
             $responsable=Responsable::find();
          else
          {
            $responsable = Responsable::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

          if(count($responsable->toArray())==0){
                return array("status" => 404, "mensaje" => "No hay registros de responsable");
          }else{
                return array("status" => 200, "mensaje" =>$responsable->toArray());
          }
        }

        
        public function nuevo($rsp){
            $responsable=new Responsable();
            $data=array(
              "nombres" => $rsp->nombres,
              "apellidos" => $rsp->apellidos,
              "uni_admin" => $rsp->uni_admin,
              "fecha_creacion" => $rsp->fecha_creacion,
              "fecha_modif" => $rsp->fecha_modif,
              "status" => $rsp->status,
              "ci_responsable" =>$rsp->ci_responsable
            );
            if($responsable->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($responsable->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }
        public function modificar($id,$e){
            $modificar=Responsable::find($id);
            if(count($modificar)>0){
                if(isset($us->pass) && $us->pass !== '' && $us->pass !== null && $us->pass !== 'undefined'){
                    $pass = sha1($us->pass);
                }else{
                    $pass = $modificar[0]->pass;
                }
                $data=array(
                  "nombres" => $rsp->nombres,
                  "apellidos" => $rsp->apellidos,
                  "uni_admin" => $rsp->uni_admin,
                  "fecha_creacion" => $rsp->fecha_creacion,
                  "fecha_modif" => date("Y-m-d h-i-s"),
                  "status" => $rsp->status,
                  "ci_responsable" =>$rsp->ci_responsable
                );
                if($modificar->update($data)){
                        unset($data['pass']);
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($responsable->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }
        public function eliminar($id){
            $responsable=Responsable::find($id);
            if(count($responsable)){
                $responsable->delete();
                return array("status" => 200, "mensaje" => 'responsable Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }
}
?>
