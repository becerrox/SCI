$(document).ready(function(){
	$("#Iniciar").click(function(){
		var Usuario=$('#username').val();
		var Contrasena=$("#contrasena").val();
		//Location='registrousuario.html';
		console.log(Usuario,Contrasena);
		$.ajax({
			type:"POST",
			dataType:'json',
			url:'includes/LoginAjax.php',
			data:{Usuario:Usuario,Contrasena:Contrasena},
			success:function(response){
				if(response.estatus=="success"){
					$("#mensaje").html(response.mensaje);
					location.href='inicio.html';
				}else{
					$("#mensaje").html(response.mensaje);
				}
			},error:function(){
				console.log('HHHHHH general en el sistema');
			}
		});
	});
});
