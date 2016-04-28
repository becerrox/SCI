<?php 

class UsuariosService{
    
    public function listar($query){

          if(empty($query))
             $usuario=Usuario::find();
          else
          {
            $usuario=Usuario::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($usuario->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de usuario");
      }else{
            return array("status" => 200, "mensaje" =>$usuario->toArray());
      }
    }

        public function nuevo($us){
            $usuario=new Usuario();

            $data=array(
                    "usuario" => $us->usuario,
                    "pass" => sha1($us->pass),
                    "nivel" => $us->nivel,
                    "fecha_creacion" => date("Y-m-d h:i:s"),
                    "status" => 1,
                    "primer_inicio" => 0,
                    "fecha_modif" => date("Y-m-d h:i:s")
            );
            if($usuario->save($data)){
                    $return = ($usuario->toArray());
                    unset($return['pass']);
                    return array("status" => 201, "mensaje" => $return);
            }else{
                $errors = array();
                foreach ($usuario->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$us){
            $modificar=Usuario::find($id);
            if(count($modificar)>0){
                if(isset($us->pass) && $us->pass !== '' && $us->pass !== null && $us->pass !== 'undefined'){
                    $pass = sha1($us->pass);
                }else{
                    $pass = $modificar[0]->pass;
                }
                $data=array(                    
                    "usuario" => $us->usuario,
                    "pass" => sha1($us->pass),
                    "nivel" => $us->nivel,
                    "status" => $us->status,
                    "primer_inicio" => $us->primer_inicio,
                    "fecha_modif" => date("Y-m-d h:i:s")
                );
                if($modificar->update($data)){
                                            
                        return array("status" => 200, "mensaje" => $data);                    
                }
                else{
                     $errors = array();
                    foreach ($usuario->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);               
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");               
            }
        }

        public function eliminar($id){
            $Usuario=Usuario::find($id);
            if(count($Usuario)){
                $Usuario->delete();
                return array("status" => 200, "mensaje" => 'Usuario Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }

        public function solicitarToken($credentials){

        if(isset($credentials->usuario) && isset($credentials->pass)){
            
            $user=Usuario::find(array("usuario='".utf8_encode($credentials->usuario)."' AND pass ='".sha1($credentials->pass)."' AND status=1"));
            if(count($user)==0){
                    $mensaje=array(
                        "usuario"=>$credentials->usuario,
                        "error"=>"Credenciales incorrectas"
                    );      
                    $datos=array("status"=>401, "data" => $mensaje);
                }else{
                    $datos=array(
                        "id" => $user[0]->id,
                        "status" => 200,
                        "data_personal" => (Personal::findFirst("id_usuario = ".$user[0]->id)), 
                        "usuario" => $user[0]->usuario,
                        "nivel" => $user[0]->nivel,
                        "primer_inicio" => $user[0]->primer_inicio,
                        "token" => sha1($credentials->usuario.$credentials->pass)
                    );          
                }

                return $datos;
        }else{
            return array("status" => 400, "mensaje" => "Debes incluir tus credenciales");
        }

         }



}
?>


