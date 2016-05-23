<?php

class BienesService{

    public function listar($query){

          if(empty($query))
             $bienes=Bienes::find("status = 1");
          else
          {
            $bienes = Bienes::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($bienes->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de bienes");
      }else{
            return array("status" => 200, "mensaje" =>$bienes->toArray());
      }
    }

        public function nuevo($bie){
            $bienes=new Bienes();
            $data=array(
                "cod_general" => mb_strtoupper($bie->cod_general, "UTF-8"),
                "cod_subcat" => mb_strtoupper($bie->cod_subcat, "UTF-8"),
                "cod_catespf" => mb_strtoupper($bie->cod_catespf, "UTF-8"),
                "descripcion" => mb_strtoupper($bie->descripcion, "UTF-8"),
                "estatus_uso_bien" => mb_strtoupper($bie->estatus_uso_bien, "UTF-8"),
                "marca" => mb_strtoupper($bie->marca, "UTF-8"),
                "modelo" => mb_strtoupper($bie->modelo, "UTF-8"),
                "serial" => mb_strtoupper($bie->serial, "UTF-8"),
                "tipo_comp" => mb_strtoupper($bie->tipo_comp, "UTF-8"),
                "colores" => mb_strtoupper($bie->colores, "UTF-8"),
                "num_bien" => mb_strtoupper($bie->num_bien, "UTF-8"),
                "estado_bien" => mb_strtoupper($bie->estado_bien, "UTF-8"),
                "status" => mb_strtoupper($bie->status, "UTF-8"),
                "fecha_modif" => date("Y-m-d h:i:s"),
                "cat_unid_admin" => mb_strtoupper($bie->cat_unid_admin, "UTF-8"),
                "per_ini" => mb_strtoupper($bie->per_ini, "UTF-8"),
                "per_culm" => mb_strtoupper($bie->per_culm, "UTF-8"),
                "unidad_trabajo" => mb_strtoupper($bie->unidad_trabajo, "UTF-8"),
                "responsable_pa" => mb_strtoupper($bie->responsable_pa, "UTF-8"),
                "responsable_ad" => mb_strtoupper($bie->responsable_ad, "UTF-8"),
                "responsable_uso" => mb_strtoupper($bie->responsable_uso, "UTF-8"),
                "sede" => mb_strtoupper($bie->sede, "UTF-8"),  
            );

            if($bienes->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($bienes->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$bie){
            $modificar=Bienes::find($id);
            if(count($modificar)>0){
                $data=array(
                    "cod_general" => mb_strtoupper($bie->cod_general, "UTF-8"),
                    "cod_subcat" => mb_strtoupper($bie->cod_subcat, "UTF-8"),
                    "cod_catespf" => mb_strtoupper($bie->cod_catespf, "UTF-8"),
                    "descripcion" => mb_strtoupper($bie->descripcion, "UTF-8"),
                    "estatus_uso_bien" => mb_strtoupper($bie->estatus_uso_bien, "UTF-8"),
                    "marca" => mb_strtoupper($bie->marca, "UTF-8"),
                    "modelo" => mb_strtoupper($bie->modelo, "UTF-8"),
                    "serial" => mb_strtoupper($bie->serial, "UTF-8"),
                    "tipo_comp" => mb_strtoupper($bie->tipo_comp, "UTF-8"),
                    "colores" => mb_strtoupper($bie->colores, "UTF-8"),
                    "num_bien" => mb_strtoupper($bie->num_bien, "UTF-8"),
                    "estado_bien" => mb_strtoupper($bie->estado_bien, "UTF-8"),
                    "status" => mb_strtoupper($bie->status, "UTF-8"),
                    "fecha_modif" => date("Y-m-d h:i:s"),
                    "cat_unid_admin" => mb_strtoupper($bie->cat_unid_admin, "UTF-8"),
                    "per_ini" => mb_strtoupper($bie->per_ini, "UTF-8"),
                    "per_culm" => mb_strtoupper($bie->per_culm, "UTF-8"),
                    "unidad_trabajo" => mb_strtoupper($bie->unidad_trabajo, "UTF-8"),
                    "responsable_pa" => mb_strtoupper($bie->responsable_pa, "UTF-8"),
                    "responsable_ad" => mb_strtoupper($bie->responsable_ad, "UTF-8"),
                    "responsable_uso" => mb_strtoupper($bie->responsable_uso, "UTF-8"),
                    "sede" => mb_strtoupper($bie->sede, "UTF-8"),  
                );

                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($bienes->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $bienes=Bienes::find($id);
            if(count($bienes)){
                $bienes->delete();
                return array("status" => 200, "mensaje" => 'bienes Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
           }
     }

}
?>
