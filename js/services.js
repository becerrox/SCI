
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
				if(response.id!=undefined)
				{
					sessionStorage.dataUsuario = JSON.stringify(response);
					location.href='inicio.html';
				}
			},error:function(response){
				console.log(response);
				$("#mensaje").html(response.responseJSON.data.error);
			}
		});
	});
});


function registrarEquipo(data)
{
	$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/equipos',
			data:JSON.stringify(data),
			success:function(response){
				alert("Registrado");
			},error:function(response){
				alert("Error");
			}
		});
}

function registrarUsuario(data)
{
	$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/usuarios',
			data:JSON.stringify(data),
			success:function(response){
				alert("Registrado");
			},error:function(response){
				alert("Error");
			}
		});
}


// Función que convierte los datos de un form a un plain json listo para enviar

function getFormData($form){
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function(n, i){
        indexed_array[n['name']] = n['value'];
    });

    return indexed_array;
}
