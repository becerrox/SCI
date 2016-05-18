<?php

class TrasladosService{

    public function listar($query){

          if(empty($query))
             $traslados=Traslados::find();
          else
          {
            $traslados=Traslados::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($traslados->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de traslados");
      }else{
            return array("status" => 200, "mensaje" =>$traslados->toArray());
      }
    }

        public function nuevo($tras){
            $traslados=new Traslados();
            $data=array(
                "nombresApellidos" => $tras->nombresApellidos,
                "ci_personal" => $tras->ci_personal,
                "institucion" => $tras->institucion,
                "cargo" => $tras->cargo,
                "unidad" => $tras->unidad,
                "fecha_solicitud" => $tras->fecha_solicitud,
                "fecha_salida" => $tras->fecha_salida,
                "entregado" => $tras->entregado,
                "motivo" => $tras->motivo,
                "nControl" => $tras->nControl,
                "hacia" => $tras->hacia,
                "observaciones" => $tras->observaciones,
                "tipo_traslado" => $tras->tipo_traslado,
                "num_bien" => $tras->num_bien,
                "descripcion" => $tras->descripcion,
                "cantidad" => $tras->cantidad,
                "estatus_uso_bien" => $tras->estatus_uso_bien,
                "origen" => $tras->origen,
                "unidad_trabajo" => $tras->unidad_trabajo
            );

            if($traslados->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($traslados->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$tras){
            $modificar=Traslados::find($id);
            if(count($modificar)>0){
                $data=array(
                "nombresApellidos" => $tras->nombresApellidos,
                "ci_personal" => $tras->ci_personal,
                "institucion" => $tras->institucion,
                "cargo" => $tras->cargo,
                "unidad" => $tras->unidad,
                "fecha_solicitud" => $tras->fecha_solicitud,
                "fecha_salida" => $tras->fecha_salida,
                "entregado" => $tras->entregado,
                "motivo" => $tras->motivo,
                "nControl" => $tras->nControl,
                "hacia" => $tras->hacia,
                "observaciones" => $tras->observaciones,
                "tipo_traslado" => $tras->tipo_traslado,
                "num_bien" => $tras->num_bien,
                "descripcion" => $tras->descripcion,
                "cantidad" => $tras->cantidad,
                "estatus_uso_bien" => $tras->estatus_uso_bien,
                "origen" => $tras->origen,
                "unidad_trabajo" => $tras->unidad_trabajo,
                );

                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($traslados->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $traslados=Traslados::find($id);
            if(count($traslados)){
                $traslados->delete();
                return array("status" => 200, "mensaje" => 'traslados Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
           }
     }

}
?>
