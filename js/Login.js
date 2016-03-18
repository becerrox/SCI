
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

/*// Servicio de Registro Personal
$(document).ready(function(){
	$("#RegistroUsuario").click(function(){
		var =$('#').val();
		var =$("#").val();
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
				location.href='registrousuario.html';
			},error:function(response){
				console.log(response);
				$("#mensaje").html(response.responseJSON.data.error);
			}
		});
	});
});

// Servicio de Registro Usuario
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
				location.href='registrousuario.html';
			},error:function(response){
				console.log(response);
				$("#mensaje").html(response.responseJSON.data.error);
			}
		});
	});
});

//Servicio de Categoria general 

$(document).ready(function(){
	$("#RegistrarCatalogo").click(function(){
		var Catgen=$('#cod_cg').val();
		var Descripcion=$("#descripcion").val();

		//Location='registrousuario.html';
		console.log(Catgen,Descripcion);
		$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/services/token',
			data:JSON.stringify({cod_cg:Catgen,descripcion:Descripcion}),
			success:function(response){
				location.href='catalogo.html';
			},error:function(response){
				console.log(response);
				$("#mensaje").html(response.responseJSON.data.error);
			}
		});
	});
});

//Servicio de codigo de subcategoria

$(document).ready(function(){
	$("#RegistrarCatalogo").click(function(){
		var Subcat=$('#cod_sc').val();
		var Descripcion=$("#descripcion").val();

		//Location='registrousuario.html';
		console.log(Subcat,Descripcion);
		$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/services/token',
			data:JSON.stringify({codigo:Subcat,descripcion:Descripcion}),
			success:function(response){
				location.href='catalogo.html';
			},error:function(response){
				console.log(response);
				$("#mensaje").html(response.responseJSON.data.error);
			}
		});
	});
});

//Servicio de codigo de categoria especifica 

$(document).ready(function(){
	$("#RegistrarCatalogo").click(function(){
		var Catesp=$('#cod_ce').val();
		var Descripcion=$("#descripcion").val();

		//Location='registrousuario.html';
		console.log(Catesp,Descripcion);
		$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/services/token',
			data:JSON.stringify({codigo:Catesp,descripcion:Descripcion}),
			success:function(response){
				location.href='catalogo.html';
			},error:function(response){
				console.log(response);
				$("#mensaje").html(response.responseJSON.data.error);
			}
		});
	});
});
*/
