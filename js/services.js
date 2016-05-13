
// Servicio de login
$(document).ready(function(){
	$("#Iniciar").click(function(){
		var Usuario=$('#username').val();
		var Contrasena=$("#contrasena").val();
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
							location.href='modificarClave.html';							
					}
					else{
						location.href='inicio.html';
					}

				}
			},error:function(response){
				$("#mensaje").html(response.responseJSON.data.error);
			}
		});
	});
});

function registrarEquipo(data)
{
return new Promise(function(resolver, rechazar) {	
	$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/equipos',
			data:JSON.stringify(data),
			success:function(response){
				resolver(response);
				swal({
				title: 'Registrado',
				text: 'Se ha registrado el equipo',
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
					rechazar(response);
				}
			});
	 });	
}

function modificarEquipos(data,id)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"PUT",
				processData: false,
	    		contentType: 'application/json',
				url:'api/equipos/'+id,
				data:JSON.stringify(data),
				success:function(response){
				resolver(response);
				swal({
				title: 'Modificado',
				text: 'Se ha modificado el equipo',
				type: 'success',
				confirmButtonText: 'Aceptar',
				confirmButtonColor: '#D85852'
			})
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

function solventarEquipos(data,id)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"PUT",
				processData: false,
	    		contentType: 'application/json',
				url:'api/equipos/'+id,
				data:JSON.stringify(data),
				success:function(response){
				resolver(response);
				swal({
				title: 'Modificado',
				text: 'Se ha solventado el equipo',
				type: 'success',
				confirmButtonText: 'Aceptar',
				confirmButtonColor: '#D85852'
			})
				},error:function(response){
					swal({
				title: 'Error',
				text: 'No se pudo solventar',
				type: 'error',
				confirmButtonText: 'Aceptar',
				confirmButtonColor: '#D85852'
				})
					rechazar(response);
				}
			});
	 });	
}

function eliminarEquipos(data,id)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"DELETE",
				processData: false,
	    		contentType: 'application/json',
				url:'api/equipos/'+id,
				data:JSON.stringify(data),
				success:function(response){
				resolver(response);
				swal({
				title: 'Eliminado',
				text: 'Se ha eliminado el equipo',
				type: 'success',
				confirmButtonText: 'Aceptar',
				confirmButtonColor: '#D85852'
			})				
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

function registrarUsuario(data)
{
return new Promise(function(resolver, rechazar) {	
	$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/usuarios',
			data:JSON.stringify(data),
			success:function(response){
				resolver(response);
				swal({
				title: 'Registrado',
				text: 'Se ha registrado el usuario',
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
					rechazar(response);
				}
			});
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

function modificarUsuarioPass(data,id)
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
				swal({
				title: 'Cambiado',
				text: 'Contraseña cambiada satisfactoriamente',
				type: 'success',
				confirmButtonText: 'Aceptar',
				confirmButtonColor: '#D85852'
			},
			function(){
			location.href='inicio.html';
				})
			},error:function(response){
				swal({
				title: 'Error',
				text: 'Error al registrar',
				type: 'error',
				confirmButtonText: 'Aceptar',
				confirmButtonColor: '#D85852'
				})
					rechazar(response);
				}
			});
	 });	
}

function registrarPersonal(data)
{
return new Promise(function(resolver, rechazar) {	
	$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/personal',
			data:JSON.stringify(data),
			success:function(response){
				resolver(response);
				swal({
				title: 'Registrado',
				text: 'Se ha registrado el personal',
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
					rechazar(response);
				}
			});
	 });	
}

function registrarBienes(data)
{
return new Promise(function(resolver, rechazar) {	
	$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/bienes',
			data:JSON.stringify(data),
			success:function(response){
				resolver(response);
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
					rechazar(response);
				}
			});
	 });	
}

function modificarBien(data,id)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"PUT",
				processData: false,
	    		contentType: 'application/json',
				url:'api/bienes/'+id,
				data:JSON.stringify(data),
				success:function(response){
				resolver(response);
				swal({
				title: 'Modificado',
				text: 'Se ha modificado el bien',
				type: 'success',
				confirmButtonText: 'Aceptar',
				confirmButtonColor: '#D85852'
			})				
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

function eliminarBien(data,id)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"DELETE",
				processData: false,
	    		contentType: 'application/json',
				url:'api/bienes/'+id,
				data:JSON.stringify(data),
				success:function(response){
				resolver(response);
				swal({
				title: 'Eliminado',
				text: 'Se ha eliminado el bien',
				type: 'success',
				confirmButtonText: 'Aceptar',
				confirmButtonColor: '#D85852'
			})				
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

function registrarCatgen(data)
{
return new Promise(function(resolver, rechazar) {	
	$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/catgen',
			data:JSON.stringify(data),
			success:function(response){
				resolver(response);
				swal({
				title: 'Registrado',
				text: 'Se ha registrado el código',
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
					rechazar(response);
				}
			});
	 });	
}

function registrarSubcat(data)
{
return new Promise(function(resolver, rechazar) {	
	$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/subcat',
			data:JSON.stringify(data),
			success:function(response){
				resolver(response);
				swal({
				title: 'Registrado',
				text: 'Se ha registrado el código',
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
					rechazar(response);
				}
			});
	 });	
}

function registrarCatesp(data)
{
return new Promise(function(resolver, rechazar) {	
	$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/catesp',
			data:JSON.stringify(data),
			success:function(response){
				resolver(response);
				swal({
				title: 'Registrado',
				text: 'Se ha registrado el código',
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
					rechazar(response);
				}
			});
	 });	
}

function registrarConfiguracion(data)
{
return new Promise(function(resolver, rechazar) {	
	$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/configuracion',
			data:JSON.stringify(data),
			success:function(response){
				resolver(response);
				swal({
				title: 'Registrado',
				text: 'Se ha registrado la configuracion',
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
					rechazar(response);
				}
			});
	 });	
}

function modificarConfiguracion(data,id)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"PUT",
				processData: false,
	    		contentType: 'application/json',
				url:'api/configuracion/'+id,
				data:JSON.stringify(data),
				success:function(response){
				resolver(response);
				swal({
				title: 'Modificado',
				text: 'Se ha modificado la configuracion',
				type: 'success',
				confirmButtonText: 'Aceptar',
				confirmButtonColor: '#D85852'
			})				
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

function getCatgenBy(filtros)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"GET",
	    		contentType: 'application/json',
				url:'api/catgen/'+filtros,
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

function getSubcatBy(filtros)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"GET",
	    		contentType: 'application/json',
				url:'api/subcat/'+filtros,
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

function getCatespBy(filtros)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"GET",
	    		contentType: 'application/json',
				url:'api/catesp/'+filtros,
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

function getUsuariosBy(filtros)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"GET",
	    		contentType: 'application/json',
				url:'api/usuarios/'+filtros,
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

function getBienesGeneralBy(data)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"GET",
	    		contentType: 'application/json',
				url:'api/bienes',
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

function getNivelesBy(data)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"GET",
	    		contentType: 'application/json',
				url:'api/niveles',
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

