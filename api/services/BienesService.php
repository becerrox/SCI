<?php

class BienesService{

    public function listar(){

      $bienes=Bienes::find("status=1");

      if(count($bienes->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de bienes");
      }else{
            return array("status" => 200, "mensaje" =>$bienes->toArray());
      }
    }

        public function nuevo($bie){
            $bienes=new Bienes();

            $data=array(
                "item" => $bie->item,
                "cod_general" => $bie->cod_general,
                "cod_subcat" => $bie->cod_subcat,
                "cod_catespf" => $bie->cod_catespf,
                "descripcion" => $bie->descripcion,
                "estatus_uso_bien" => $bie->estatus_uso_bien,
                "marca" => $bie->marca,
                "modelo" => $bie->modelo,
                "serial" => $bie->serial,
                "tipo_comp" => $bie->tipo_comp,
                "colores" => $bie->colores,
                "num_bien" => $bie->num_bien,
                "estado_bien" => $bie->estado_bien,
                "status" => $bie->status,
                "fecha_modif" => $bie->fecha_modif,
                "cat_unid_admin" => $bie->cat_unid_admin,
                "fecha_elab" => $bie->fecha_elab,
                "per_ini" => $bie->per_ini,
                "per_culm" => $bie->per_culm,
                "uni_trabajo" => $bie->uni_trabajo,
                "componentes" => $bie->componentes,
                "responsable_pa" => $bie->responsable_pa,
                "responsable_ad" => $bie->responsable_ad,
                "responsable_uso" => $bie->responsable_uso
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

        public function modificar($id,$us){
            $modificar=Bienes::find($id);
            if(count($modificar)>0){
                if(isset($us->pass) && $us->pass !== '' && $us->pass !== null && $us->pass !== 'undefined'){
                    $pass = sha1($us->pass);
                }else{
                    $pass = $modificar[0]->pass;
                }
                $data=array(
                    "item" => $bie->item,
                    "cod_general" => $bie->cod_general,
                    "cod_subcat" => $bie->cod_subcat,
                    "cod_catespf" => $bie->cod_catespf,
                    "descripcion" => $bie->descripcion,
                    "estatus_uso_bien" => $bie->estatus_uso_bien,
                    "marca" => $bie->marca,
                    "modelo" => $bie->modelo,
                    "serial" => $bie->serial,
                    "tipo_comp" => $bie->tipo_comp,
                    "colores" => $bie->colores,
                    "num_bien" => $bie->num_bien,
                    "estado_bien" => $bie->estado_bien,
                    "status" => $bie->status,
                    "fecha_modif" => $bie->fecha_modif,
                    "cat_unid_admin" => $bie->cat_unid_admin,
                    "fecha_elab" => $bie->fecha_elab,
                    "per_ini" => $bie->per_ini,
                    "per_culm" => $bie->per_culm,
                    "uni_trabajo" => $bie->uni_trabajo,
                    "componentes" => $bie->componentes,
                    "responsable_pa" => $bie->responsable_pa,
                    "responsable_ad" => $bie->responsable_ad,
                    "responsable_uso" => $bie->responsable_uso
                );

                if($modificar->update($data)){
                        unset($data['pass']);
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