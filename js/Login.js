
// Servicio de login
$(document).ready(function(){
	$("#Iniciar").click(function(){
		var Usuario=$('#username').val();
		var Contrasena=$("#contrasena").val();
		//Location='registrousuario.html';
		console.log(Usuario,Contrasena);
		$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/usuarios/token',
			data:JSON.stringify({usuario:Usuario,pass:Contrasena}),
			success:function(response){
				sessionStorage.dataUsuario = JSON.stringify(response);
				location.href='inicios.html';
			},error:function(response){
				console.log(response);
				$("#mensaje").html(response.responseJSON.data.error);
			}
		});
	});
});


//Servicio de listar equipos
