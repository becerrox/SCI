<?php 

class UsuariosService{
    
    public function listar(){

      $usuario=Usuario::find("status=1");        

      if(count($usuario->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de usuario");        
      }else{
          foreach($usuario as $us){
               $users[]=array(
                    "usuario" => $us->usuario,
                    "nivel" => $us->nivel,
                    "id_usuario" => $us->id_usuario,
                    "fecha_modif" => $us->fecha_modif,
                    "usuario_creacion" => $us->usuario_creacion,
                    "usuario_modif" => $us->usuario_modif,
                    "status" => $us->status
                );
            }
      }
        return array("status" => 200, "mensaje" =>$users);
    }

        public function nuevo($us){
            $usuario=new Usuario();

            $data=array(
                    "usuario" => $us->usuario,
                    "pass" => sha1($us->pass),
                    "nivel" => $us->nivel,
                    "fecha_creacion" => date("Y-m-d"),
                    "usuario_creacion" => 0,
                    "usuario_modif" => 0,
                    "status" => $us->status
            );

            if($usuario->save($data)){
                    unset($data['pass']);
                    return array("status" => 201, "mensaje" => $data);
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
                    "pass" => $pass,
                    "nivel" => $us->nivel,
                    "fecha_creacion" => date("Y-m-d"),
                    "usuario_creacion" => 0,
                    "usuario_modif" => 0,
                    "status" => $us->status
                );

                if($modificar->update($data)){
                        unset($data['pass']);                    
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

        if(isset($credentials->email) && isset($credentials->password)){
            
            $user=Usuario::find(array("email='".utf8_encode($credentials->email)."' AND password ='".md5($credentials->password)."' AND autorizacion=1"));
            if(count($user)==0){
                    $mensaje=array(
                    "email"=>$credentials->email,
                    "error"=>"Credenciales incorrectas"
                    );      
                    $datos=array("status"=>401, "data" => $mensaje);
                }else{
                    $datos=array(
                    "status" => 200,
                    "id"=>$user[0]->id,
                    "email"=>$user[0]->email,
                    "hash_mail"=>md5($user[0]->email),
                    "seudonimo"=>$user[0]->seudonimo,
                    "token"=> $user[0]->token,
                    "nombre_completo" => $user[0]->nombre_completo,
                    "pais" => $user[0]->pais,
                    "nivel" => $user[0]->nivel,
                    "primera_vez" => $user[0]->primera_vez,
                    "autorizacion" => $user[0]->autorizacion
                    );          
                }

                return $datos;
        }else{
            return array("status" => 300, "mensaje" => "Debes incluir tus credenciales");
        }

         }



}
?>


