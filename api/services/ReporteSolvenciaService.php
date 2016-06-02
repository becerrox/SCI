<?php

use Phalcon\Db\Adapter\Pdo;

class ReporteSolvenciaService{

    public function listar($query){

          if(empty($query))
             $reporteSolvencia=ReporteSolvencia::find();
          else
          {
            $reporteSolvencia=ReporteSolvencia::find(
                array(
                    arrayToSQLQuery($query),
                    "bind" => $query)
                );
          }

      if(count($reporteSolvencia->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de ReporteSolvencia");
      }else{
            return array("status" => 200, "mensaje" =>$reporteSolvencia->toArray());
      }
    }

        public function nuevo($reps){
            $reporteSolvencia=new ReporteSolvencia();

            $data=array(
                "fecha" => date("Y-m-d h:i:s")
            );
            if($reporteSolvencia->save($data)){
                    $return = ($reporteSolvencia->toArray());
                    return array("status" => 201, "mensaje" => $return);
            }else{
                $errors = array();
                foreach ($reporteSolvencia->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$reps){
            $modificar=ReporteSolvencia::find($id);
            if(count($modificar)>0){
                $data=array(
                    "fecha" => date("Y-m-d h:i:s")                    
                );

                if($modificar->update($data)){
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($reporteSolvencia->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $reporteSolvencia=ReporteSolvencia::find($id);
            if(count($reporteSolvencia)){
                $reporteSolvencia->delete();
                return array("status" => 200, "mensaje" => 'ReporteSolvencia Eliminado');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
           }
     }

}
?>
