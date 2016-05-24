<?php
// Cargamos la librería dompdf que hemos instalado en la carpeta dompdf
require_once ('dompdf/dompdf_config.inc.php');
 
// Introducimos HTML de prueba
$html = '<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><!--<![endif]-->
<html lang="es">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8"/>
    <title>Reporte de Celulares</title>   
    <link rel="stylesheet" href="style.css" type="text/css" media="print">

   <script src="js/jquery.min.js"></script>

  </head>
  <!--                    CUERPO PRINCIPAL             -->
<body>

<section id="tipoequipo" class="inicio container-fluid">
  <h3>Reporte de Celulares</h3>
    <form>
      <article class="row">
        <div class="col-md-12 table-condensed">
         <table id="tableTipoEquipo" class="table table-bordered"><thead><tr><th>Item</th><th>Marca</th><th>Modelo</th><th>Serial</th><th>Estado</th><th>Responsable</th><th>Caracteristicas</th><th>Ubicación</th><th>Observaciones</th><th>Serial Sim</th><th>Accesorios</th><th>Plan</th><th>Número</th><th>Estado de Uso</th></tr></thead><tbody><tr><td>1</td><td>HUAWEI</td><td>EDX-443</td><td>dwadwa423</td><td>ÓPTIMO</td><td>LUIS LAVADO</td><td>OCTACORE</td><td>TELECOMUNICACIONES</td><td></td><td>2412421</td><td>AUDÍFONOS</td><td>FULL</td><td>04161112233</td><td>EN PROCESO DE DISPOCISIÓN</td></tr></tbody></table>
        </div>
      </article>      
    </form>
</section>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>  
    
</body>
</html>
';
 
// Instanciamos un objeto de la clase DOMPDF.
$pdf = new DOMPDF();
$pdf->page_text(765, 550, "Pagina {PAGE_NUM} de {PAGE_COUNT}", $font, 9, array(0, 0, 0));
 
// Definimos el tamaño y orientación del papel que queremos.
$pdf->set_paper("A4", "landscape");
 
// Cargamos el contenido HTML.
$pdf->load_html(utf8_decode($html));
 
// Renderizamos el documento PDF.
$pdf->render();
// Enviamos el fichero PDF al navegador.
$pdf->stream('ReporteCelular.pdf');
?>
