<?php
	include_once('conexion.php');

	if(isset($_REQUEST['Usuario']) && isset($_REQUEST['Contrasena'])){
		$usuario = $_REQUEST['Usuario'];
		$password = $_REQUEST['Contrasena'];
	}else{
		echo json_encode(["estatus" => "error","mensaje" => "Debe introducir el usuario y contraseña"]);
	}

	$consulta=pg_query($conexion,("SELECT * from usuario where usuario='$usuario' and pass='$password' and status='1'"));

	if(pg_num_rows($consulta)==1){
			$respuesta = array(
										"status" => "success",
										"mensaje" => "Te has autenticado exitosamente"
 			);
			echo json_encode($respuesta);
	}else{
		$respuesta = array(
									"status" => "error",
									"mensaje" => "Error en usuario o contraseña"
		);
		echo json_encode($respuesta);
	}
?>
