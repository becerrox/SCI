
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
					if(response.primer_inicio==0){
						/*response.primer_inicio = 1; response.pass = Contrasena;
						response.status = 1;
						modificarUsuario(response,response.id).then(function(data){*/
							location.href='modificarClave.html';							
						/*});*/
					}
					else{
						location.href='inicio.html';
					}

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
				swal("Registrado", "", "success");
			},error:function(response){
				swal({
			  title: 'No se registró el Equipo',
			  text: 'Verifique los campos ingresados',
			  type: 'error',
			  confirmButtonText: 'Aceptar',
			  confirmButtonColor: '#D85852'
})
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
				swal("Registrado", "", "success");
			},error:function(response){
				swal({
			  title: 'Error',
			  text: 'No se pudo registrar',
			  type: 'error',
			  confirmButtonText: 'Aceptar',
			  confirmButtonColor: '#D85852'
})
			}
		});
}

function modificarUsuario(data,id)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"PUT",
				processData: false,
	    		contentType: 'application/json',
				url:'api/usuarios/'+id,
				data:JSON.stringify(data),
				success:function(response){
					resolver(response);
				},error:function(response){
					swal({
			  title: 'Error',
			  text: 'No se pudo modificar',
			  type: 'error',
			  confirmButtonText: 'Aceptar',
			  confirmButtonColor: '#D85852'
})
					rechazar(response);
				}
			});
	 });	
}


function registrarBienes(data)
{
	$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/bienes',
			data:JSON.stringify(data),
			success:function(response){
				swal({
			  title: 'Registrado',
			  text: 'Se ha registrado el bien',
			  type: 'success',
			  confirmButtonText: 'Aceptar',
			  confirmButtonColor: '#D85852'
			})
			},error:function(response){
				swal({
			  title: 'Error',
			  text: 'No se pudo registrar',
			  type: 'error',
			  confirmButtonText: 'Aceptar',
			  confirmButtonColor: '#D85852'
			})
			}
		});
}

function modificarBien(data,id)
{
	$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/bienes/'+id,
			data:JSON.stringify(data),
			success:function(response){
				swal("Registrado", "", "success");
			},error:function(response){
				swal({
			  title: 'Error',
			  text: 'No se pudo registrar',
			  type: 'error',
			  confirmButtonText: 'Aceptar',
			  confirmButtonColor: '#D85852'
})
			}
		});
}

//Servicio para traer la data de configuracion, con filtro

function getConfiguracionBy(filtros)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"GET",
	    		contentType: 'application/json',
				url:'api/configuracion/'+filtros,
				success:function(response){
					resolver(response);
				},error:function(response){
					swal({
			  title: 'Error',
			  text: 'El registro no existe o hay un error',
			  type: 'error',
			  confirmButtonText: 'Aceptar',
			  confirmButtonColor: '#D85852'
})
					rechazar(response);
				}
			});
	 });	
}

function getPersonalBy(filtros)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"GET",
	    		contentType: 'application/json',
				url:'api/personal/'+filtros,
				success:function(response){
					resolver(response);
				},error:function(response){
					swal({
			  title: 'Error',
			  text: 'El registro no existe o hay un error',
			  type: 'error',
			  confirmButtonText: 'Aceptar',
			  confirmButtonColor: '#D85852'
})
					rechazar(response);
				}
			});
	 });	
}

function getBienesBy(filtros)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"GET",
	    		contentType: 'application/json',
				url:'api/bienes/'+filtros,
				success:function(response){
					resolver(response);
				},error:function(response){
					swal({
			  title: 'Error',
			  text: 'El registro no existe o hay un error',
			  type: 'error',
			  confirmButtonText: 'Aceptar',
			  confirmButtonColor: '#D85852'
})
					rechazar(response);
				}
			});
	 });	
}

function getEquiposBy(filtros)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"GET",
	    		contentType: 'application/json',
				url:'api/equipos/'+filtros,
				success:function(response){
					resolver(response);
				},error:function(response){
					swal({
			  title: 'Error',
			  text: 'El registro no existe o hay un error',
			  type: 'error',
			  confirmButtonText: 'Aceptar',
			  confirmButtonColor: '#D85852'
})
					rechazar(response);
				}
			});
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

