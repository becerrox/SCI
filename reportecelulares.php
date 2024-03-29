<?php 
require_once("../dompdf/dompdf_config.inc.php");
/*include("config.php");
*/

$html= '<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><!--<![endif]-->
<html lang="es">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8"/>
    <title>Reporte de Celulares</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0, minimun-scale=1.0">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" >
    <link rel="stylesheet" type="text/css" href="css/calendario.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css" type="text/css" media="screen">
    <link rel="stylesheet" media="print and (orientation:landscape)" href="landscape.css">
   <link rel="stylesheet" href="font-awesome/css/font-awesome.css" >
   <script src="js/jquery.min.js"></script>
   <script src="js/tooltips.js"></script>
    <script src="js/reporteCelularesController.js" type="text/javascript"></script>
   <script src="js/select.js" type="text/javascript"></script>
  </head>
  <!--                    CUERPO PRINCIPAL             -->
<div id="header"></div>
<body>
<div id="cabecera">
    <img src="images/generaltelecom.png">
  </div>
<section id="tipoequipo" class="inicio container-fluid">
  <h3>Reporte de Celulares</h3>
    <form>
      <article class="row">
        <div class="col-md-12 table-condensed">
          <table id="tableTipoEquipo" class="table table-bordered">
          </table>
        </div>
      </article>
      <article class="row">
        <div class="col-md-2 col-md-offset-5 col-sm-3 col-sm-offset-5">
          <button id="btnImprimir" type="button" class="btn hidden-print" onclick="window.print()">Imprimir</button>
        </div>
    </article>    
    </form>
</section>
   <script src="js/services.js" type="text/javascript"></script> 
    <script src="js/menu.js" type="text/javascript"></script>  
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>  
    <script src="js/valida.js"></script>
</body>
</html>';

$codigo=utf8_decode($html);
$dompdf=new DOMPDF();
$dompdf->load_html($html);
ini_set("memory_limit","128M");
$dompdf->render();
$dompdf->stream("reporte.pdf");
?>
