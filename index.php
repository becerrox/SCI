<?php
  session_start();
?>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><!--<![endif]-->
<html lang="es">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8"/>
    <title>SISTEMA DE CONTROL DE INVENTARIO</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0, minimun-scale=1.0">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" >
    <script type="text/javascript" src="js/jquery.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css" type="text/css" media="screen">
   <link rel="stylesheet" href="font-awesome/css/font-awesome.css" >
     <link href='https://fonts.googleapis.com/css?family=Dosis' rel='stylesheet' type='text/css'>
   <script src="js/jquery.min.js"></script>
   <script type="text/javascript" src="js/Login.js"></script>
</head>
  </head>

  <header>
     <section class="main">
     <div class="barra">
        <img src="images/barra.jpg">
     </div>
    <div class="mainWrap">
     <a id="touch-menu" class="movil-menu" href="#"><i class="icon-reorder"></i>Menu</a>
      <nav style="height: 45px;">
      <script src="js/valida.js" type="text/javascript"></script>
      </nav>
     </div><!--fin mainWrap-->
     <section>
  </header>
  <!--                 CUERPO PRINCIPAL          -->
  <body>
    <section class="inicio">
        <h1>SISTEMA DE CONTROL DE INVENTARIO</h1>
       <article id="sesion">
          <div class="login-form" id="form">
             <h2>Acceso</h2>
             <div class="form-group ">
               <input type="text" value="" class="form-control" placeholder="Nombre de Usuario" id="username"><br>
               <input type="password" value="" class="form-control" placeholder="Contraseña" id="contrasena" >
             </div>
             <button id="Iniciar" class="btn">Iniciar Sesión</button>
             <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="mensaje">
         </div>
         <div hidden id="alert" class="alert-danger" role="alert"></div>
       </article>
    </section>
   <footer class="pie_de_pagina col-xs-12 col-sm-12 col-md-12">
      <p>
             Barquisimeto, Municipio Iribarren Edo Lara.<br>
             República Bolivariana de Venezuela<br>
             Basados en Software Libre. <strong>LEY INFOGOBIERNO</strong>.<br>
             Desarrollado por el Departamento de Telecomunicaciones de TRANSBAR,C.A.
            <br>
      </p>
   </footer>
    <script src="js/menu.js" type="text/javascript"></script>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/valida.js" type="text/javascript"></script>
  </body>
</html>
