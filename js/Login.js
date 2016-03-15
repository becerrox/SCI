
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
				location.href='inicio.html';
			},error:function(response){
				console.log(response);
				$("#mensaje").html(response.responseJSON.data.error);
			}
		});
	});
});


//Servicio de Catalogo de bienes

$(document).ready(function(){
	$("#RegistrarCatalogo").click(function(){
		var Codigo=$('#codigo').val();
		var Descripcion=$("#descripcion").val();
		var Tipo=$('#tipo').val();
		//Location='registrousuario.html';
		console.log(Codigo,Descripcion,Tipo);
		$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/services/token',
			data:JSON.stringify({codigo:Codigo,descripcion:Descripcion,tipo:Tipo}),
			success:function(response){
				location.href='inicio.html';
			},error:function(response){
				console.log(response);
				$("#mensaje").html(response.responseJSON.data.error);
			}
		});
	});
});

//Servicio de lis

/*$(document).ready(function(){
	$("#RegistrarEquipo").click(function(){
		var Codigo=$('#codigo').val();
		var Descripcion=$("#descripcion").val();
		var Tipo=$('#tipo').val();
		//Location='registrousuario.html';
		console.log(Codigo,Descripcion,Tipo);
		$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/services/token',
			data:JSON.stringify({codigo:Codigo,descripcion:Descripcion,tipo:Tipo}),
			success:function(response){
				location.href='inicio.html';
			},error:function(response){
				console.log(response);
				$("#mensaje").html(response.responseJSON.data.error);
			}
		});
	});
});
