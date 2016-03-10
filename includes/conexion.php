<?php
	$connectionString = "host=localhost dbname=sci user=postgres password=12345";
	$conexion=pg_connect($connectionString) or die("Lo sentimos pero no se pudo conectar a nuestra db");
?>
