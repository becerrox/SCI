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
                "primer_inicio" => 0,
                "fecha_modif" => date("Y-m-d h:i:s"),
                "pregunta" => mb_strtoupper($us->pregunta, "UTF-8"),
                "respuesta" => mb_strtoupper($us->respuesta, "UTF-8"),
                "ci_per" => mb_strtoupper($us->ci_per, "UTF-8"),
                "nombres" => mb_strtoupper($us->nombres, "UTF-8"),
                "apellidos" => mb_strtoupper($us->apellidos, "UTF-8"),
                "cargo" => mb_strtoupper($us->cargo, "UTF-8"),
                "telf_pers" => mb_strtoupper($us->telf_pers, "UTF-8"),
                "correo" => mb_strtoupper($us->correo, "UTF-8"),
                "f_nac" => mb_strtoupper($us->f_nac, "UTF-8"),
                "status" => 1,
                "unidad_trabajo" => mb_strtoupper($us->unidad_trabajo, "UTF-8"),
                "unidad_admin" => mb_strtoupper($us->unidad_admin, "UTF-8"),
                "fecha_creacion" => date("Y-m-d h:i:s")
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
          if(count((array) $us)){
              if(count($modificar)>0){
                  $data=array(                    
                    "usuario" => $us->usuario,
                    "pass" => sha1($us->pass),
                    "nivel" => $us->nivel,
                    "fecha_modif" => date("Y-m-d h:i:s"),
                    "pregunta" => mb_strtoupper($us->pregunta, "UTF-8"),
                    "respuesta" => mb_strtoupper($us->respuesta, "UTF-8"),
                    "ci_per" => mb_strtoupper($us->ci_per, "UTF-8"),
                    "nombres" => mb_strtoupper($us->nombres, "UTF-8"),
                    "apellidos" => mb_strtoupper($us->apellidos, "UTF-8"),
                    "cargo" => mb_strtoupper($us->cargo, "UTF-8"),
                    "telf_pers" => mb_strtoupper($us->telf_pers, "UTF-8"),
                    "correo" => mb_strtoupper($us->correo, "UTF-8"),
                    "f_nac" => mb_strtoupper($us->f_nac, "UTF-8"),
                    "status" => 1,
                    "unidad_trabajo" => mb_strtoupper($us->unidad_trabajo, "UTF-8"),
                    "unidad_admin" => mb_strtoupper($us->unidad_admin, "UTF-8"),
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
          }else{
            $this->modificarPass($id,$us);
          }
        }

        public function modificarPass($id,$us){
            $modificar=Usuario::find($id);
            if(count($modificar)>0){
                $data=array(                  
                    "pass" => sha1($us->pass),
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
                        "data_personal" => (Usuario::findFirst("id = ".$user[0]->id)), 
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


