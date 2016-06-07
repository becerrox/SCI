
// Servicio de login
$(document).ready(function(){
	$("#Iniciar").click(function(){
		var Usuario=$('#username').val().toUpperCase();
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

function registrarReporteSolvencia(data)
{
return new Promise(function(resolver, rechazar) {	
	$.ajax({
			type:"POST",
			processData: false,
    		contentType: 'application/json',
			url:'api/reportesolvencias',
			data:JSON.stringify(data),
			success:function(response){
				resolver(response);
			},error:function(response){
					rechazar(response);
				}
			});
	 });	
}

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
      },
      function(){
      location.reload();
        })
      },error:function(response){
					rechazar(response);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });               
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
      },
      function(){
      location.reload();
        })
      },error:function(response){
					rechazar(response);
				}
			});
	 });	
}

function retiroEquipos(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"PUT",
        processData: false,
          contentType: 'application/json',
        url:'api/equiposss/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Asignado',
        text: 'Se ha asignado el equipo',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      })
        },error:function(response){
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
				url:'api/equiposs/'+id,
				data:JSON.stringify(data),
				success:function(response){
				resolver(response);
				swal({
				title: 'Solventado',
				text: 'Se ha solventado el equipo',
				type: 'success',
				confirmButtonText: 'Aceptar',
				confirmButtonColor: '#D85852'
        })
      },error:function(response){
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
      },
      function(){
      location.reload();
        })
      },error:function(response){
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
      },
      function(){
      location.reload();
        })
      },error:function(response){
					rechazar(response);
					var error_campos = response.responseJSON; 
						swal({
				          title: 'AVISO',
					     	  text: "Verifique siguientes campos: " + error_campos,
				          type: 'info',
				          confirmButtonText: 'Aceptar',
				          confirmButtonColor: '#D85852'
						});					
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
				url:'api/usuariosss/'+id,
				data:JSON.stringify(data),
				success:function(response){
				resolver(response);
				swal({
				title: 'Modificado',
				text: 'Se ha modificado el usuario',
				type: 'success',
				confirmButtonText: 'Aceptar',
				confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
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
					rechazar(response);
				}
			});
	 });	
}

function modificarPregunta(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"PUT",
        processData: false,
          contentType: 'application/json',
        url:'api/usuariosos/'+id,
        data:JSON.stringify(data),
      success:function(response){
        resolver(response);
        swal({
        title: 'Cambiada',
        text: 'Pregunta y respuestas cambiadas',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.href='inicio.html';
        })
      },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function recuperarUsuario(data,id)
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
				title: 'Recuperado',
				text: 'Usuario recuperado satisfactoriamente. Su nueva contraseña generada es: 12345',
				type: 'success',
				confirmButtonText: 'Aceptar',
				confirmButtonColor: '#D85852'
			},
      function(){
    			location.href='index.html';
        })
      },error:function(response){
					rechazar(response);
          swal({
          title: 'Error',
          text: 'La pregunta o la respuesta no coinciden',
          type: 'info',
          confirmButtonText: 'Aceptar',
          confirmButtonColor: '#D85852'
        })                      
				}
			});
	 });	
}

function eliminarUsuario(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"DELETE",
        processData: false,
          contentType: 'application/json',
        url:'api/usuarios/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Eliminado',
        text: 'Se ha eliminado el usuario',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
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
      },
      function(){
      location.reload();
        })
      },error:function(response){
					rechazar(response);
					console.log(response);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });     
				}
			});
	 });	
}

function modificarPersonal(data,id)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"PUT",
				processData: false,
	    		contentType: 'application/json',
				url:'api/personal/'+id,
				data:JSON.stringify(data),
				success:function(response){
				resolver(response);
				swal({
				title: 'Modificado',
				text: 'Se ha modificado el personal',
				type: 'success',
				confirmButtonText: 'Aceptar',
				confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
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
      },
      function(){
      location.reload();
        })
      },error:function(response){
					rechazar(response);
					var error_campos = response.responseJSON; 
						swal({
				          title: 'AVISO',
						      text: "Verifique siguientes campos: " + error_campos,
				          type: 'info',
				          confirmButtonText: 'Aceptar',
				          confirmButtonColor: '#D85852'
						});					
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
      },
      function(){
      location.reload();
        })
      },error:function(response){
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
      },
      function(){
      location.reload();
        })
      },error:function(response){
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
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });    				}
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
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
					console.log(response.responseText);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });    				}
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
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });    				}
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
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });    				}
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
      },
      function(){
      location.reload();
        })
      },error:function(response){
					rechazar(response);
				}
			});
	 });	
}

function eliminarConfiguracion(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"DELETE",
        processData: false,
          contentType: 'application/json',
        url:'api/configuracion/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Eliminado',
        text: 'Se ha eliminado la configuración',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function registrarConfiguracionAdmin(data)
{
return new Promise(function(resolver, rechazar) { 
  $.ajax({
      type:"POST",
      processData: false,
        contentType: 'application/json',
      url:'api/configadmin',
      data:JSON.stringify(data),
      success:function(response){
        resolver(response);
        swal({
        title: 'Registrado',
        text: 'Se ha registrado la configuración',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });     
        }
      });
   });  
}

function modificarConfiguracionAdmin(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"PUT",
        processData: false,
          contentType: 'application/json',
        url:'api/configadmin/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Modificado',
        text: 'Se ha modificado la configuración',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function eliminarConfiguracionAdmin(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"DELETE",
        processData: false,
          contentType: 'application/json',
        url:'api/configadmin/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Eliminado',
        text: 'Se ha eliminado la configuración',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function registrarResponsables(data)
{
return new Promise(function(resolver, rechazar) { 
  $.ajax({
      type:"POST",
      processData: false,
        contentType: 'application/json',
      url:'api/responsables',
      data:JSON.stringify(data),
      success:function(response){
        resolver(response);
        swal({
        title: 'Registrado',
        text: 'Se ha registrado el responsable',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });               
        }
      });
   });  
}

function modificarResponsables(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"PUT",
        processData: false,
          contentType: 'application/json',
        url:'api/responsables/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Modificado',
        text: 'Se ha modificado el responsable',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function eliminarResponsables(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"DELETE",
        processData: false,
          contentType: 'application/json',
        url:'api/responsables/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Eliminado',
        text: 'Se ha eliminado el responsable',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function registrarConfiguracionEquipo(data)
{
return new Promise(function(resolver, rechazar) { 
  $.ajax({
      type:"POST",
      processData: false,
        contentType: 'application/json',
      url:'api/confequipo',
      data:JSON.stringify(data),
      success:function(response){
        resolver(response);
        swal({
        title: 'Registrado',
        text: 'Se ha registrado la configuracion',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });            }
      });
   });  
}

function modificarConfiguracionEquipo(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"PUT",
        processData: false,
          contentType: 'application/json',
        url:'api/confequipo/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Modificado',
        text: 'Se ha modificado la configuracion',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function eliminarConfiguracionEquipo(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"DELETE",
        processData: false,
          contentType: 'application/json',
        url:'api/confequipo/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Eliminado',
        text: 'Se ha eliminado la configuracion',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
        }
      });
   });  
}


function registrarNumeroBien(data)
{
return new Promise(function(resolver, rechazar) { 
  $.ajax({
      type:"POST",
      processData: false,
        contentType: 'application/json',
      url:'api/numerobien',
      data:JSON.stringify(data),
      success:function(response){
        resolver(response);
        swal({
        title: 'Registrado',
        text: 'Se ha registrado el número de bien',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });     
        }
      });
   });  
}

function modificarNumeroBien(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"PUT",
        processData: false,
          contentType: 'application/json',
        url:'api/numerobien/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Modificado',
        text: 'Se ha modificado el número de bien',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){

          rechazar(response);
        }
      });
   });  
}

function eliminarNumeroBien(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"DELETE",
        processData: false,
          contentType: 'application/json',
        url:'api/numerobien/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Eliminado',
        text: 'Se ha eliminado el número de bien',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function registrarDependencias(data)
{
return new Promise(function(resolver, rechazar) { 
  $.ajax({
      type:"POST",
      processData: false,
        contentType: 'application/json',
      url:'api/dependencias',
      data:JSON.stringify(data),
      success:function(response){
        resolver(response);
        swal({
        title: 'Registrado',
        text: 'Se ha registrado la unidad',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });            }
      });
   });  
}

function modificarDependencias(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"PUT",
        processData: false,
          contentType: 'application/json',
        url:'api/dependencias/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Modificado',
        text: 'Se ha modificado la unidad',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){

          rechazar(response);
        }
      });
   });  
}

function eliminarDependencias(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"DELETE",
        processData: false,
          contentType: 'application/json',
        url:'api/dependencias/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Eliminado',
        text: 'Se ha eliminado la unidad',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function registrarUnidades(data)
{
return new Promise(function(resolver, rechazar) { 
  $.ajax({
      type:"POST",
      processData: false,
        contentType: 'application/json',
      url:'api/unidades',
      data:JSON.stringify(data),
      success:function(response){
        resolver(response);
        swal({
        title: 'Registrado',
        text: 'Se ha registrado la unidad',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });            }
      });
   });  
}

function modificarUnidades(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"PUT",
        processData: false,
          contentType: 'application/json',
        url:'api/unidades/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Modificado',
        text: 'Se ha modificado la unidad',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){

          rechazar(response);
        }
      });
   });  
}

function eliminarUnidades(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"DELETE",
        processData: false,
          contentType: 'application/json',
        url:'api/unidades/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Eliminado',
        text: 'Se ha eliminado la unidad',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function registrarUnidadAdministrativa(data)
{
return new Promise(function(resolver, rechazar) { 
  $.ajax({
      type:"POST",
      processData: false,
        contentType: 'application/json',
      url:'api/unidadadministrativa',
      data:JSON.stringify(data),
      success:function(response){
        resolver(response);
        swal({
        title: 'Registrado',
        text: 'Se ha registrado la unidad administrativa',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });            }
      });
   });  
}

function modificarUnidadAdministrativa(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"PUT",
        processData: false,
          contentType: 'application/json',
        url:'api/unidadadministrativa/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Modificado',
        text: 'Se ha modificado la unidad administrativa',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){

          rechazar(response);
        }
      });
   });  
}

function eliminarUnidadAdministrativa(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"DELETE",
        processData: false,
          contentType: 'application/json',
        url:'api/unidadadministrativa/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Eliminado',
        text: 'Se ha eliminado la unidad administrativa',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function registrarUnidadTrabajo(data)
{
return new Promise(function(resolver, rechazar) { 
  $.ajax({
      type:"POST",
      processData: false,
        contentType: 'application/json',
      url:'api/unidadtrabajo',
      data:JSON.stringify(data),
      success:function(response){
        resolver(response);
        swal({
        title: 'Registrado',
        text: 'Se ha registrado la unidad de trabajo',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
          rechazar(response);
          var error_campos = response.responseJSON; 
            swal({
                  title: 'AVISO',
                  text: "Verifique siguientes campos: " + error_campos,
                  type: 'info',
                  confirmButtonText: 'Aceptar',
                  confirmButtonColor: '#D85852'
            });            }
      });
   });  
}

function modificarUnidadTrabajo(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"PUT",
        processData: false,
          contentType: 'application/json',
        url:'api/unidadtrabajo/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Modificado',
        text: 'Se ha modificado la unidad de trabajo',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){

          rechazar(response);
        }
      });
   });  
}

function eliminarUnidadTrabajo(data,id)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"DELETE",
        processData: false,
          contentType: 'application/json',
        url:'api/unidadtrabajo/'+id,
        data:JSON.stringify(data),
        success:function(response){
        resolver(response);
        swal({
        title: 'Eliminado',
        text: 'Se ha eliminado la unidad de trabajo',
        type: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#D85852'
      },
      function(){
      location.reload();
        })
      },error:function(response){
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
					rechazar(response);
				}
			});
	 });	
}

function getUsuariosNombreBy(filtros)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"GET",
	    		contentType: 'application/json',
				url:'api/usuarios/'+filtros,
				success:function(response){
					resolver(response);
					var nombreUsuario = response[0].usuario;
					swal({
					title: 'Encontrado',
					text: 'Correo coindice en la base de datos.'+'    Su nombre de usuario es: ' + '"' + nombreUsuario + '"' + '. ' ,
					type: 'success',
					confirmButtonText: 'Aceptar',
					confirmButtonColor: '#D85852'
				},
			    function(){
    			location.href='inicio.html';
        			})					
				},error:function(response){
					rechazar(response);
					swal({
					title: 'No Encontrado',
					text: 'El correo no coindice en la base de datos',
					type: 'error',
					confirmButtonText: 'Aceptar',
					confirmButtonColor: '#D85852'
				})										
				}
			});
	 });	
}

function getUsuariosRecuperarBy(filtros)
{
	return new Promise(function(resolver, rechazar) { 
		$.ajax({
				type:"GET",
	    		contentType: 'application/json',
				url:'api/usuarios/'+filtros,
				success:function(response){
					resolver(response);
					var nombreUsuario = response[0].usuario;
					swal({
					title: 'Encontrado',
					text: 'Usuario encontrado.  ' + 'Ingrese su pregunta y respuesta para recuperar la contraseña',
					type: 'success',
					confirmButtonText: 'Aceptar',
					confirmButtonColor: '#D85852'
				})					
				},error:function(response){
					rechazar(response);
					swal({
					title: 'No Encontrado',
					text: 'El usuario se escribió de forma incorrecta o no existe',
					type: 'info',
					confirmButtonText: 'Aceptar',
					confirmButtonColor: '#D85852'
				})										
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
					rechazar(response);
				}
			});
	 });	
}


function getSedesBy(filtros)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"GET",
          contentType: 'application/json',
        url:'api/sedes/'+filtros,
        success:function(response){
          resolver(response);
        },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function getConfiguracionAdminBy(filtros)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"GET",
          contentType: 'application/json',
        url:'api/configadmin/'+filtros,
        success:function(response){
          resolver(response);
        },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function getResponsablesBy(filtros)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"GET",
          contentType: 'application/json',
        url:'api/responsables/'+filtros,
        success:function(response){
          resolver(response);
        },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function getConfiguracionEquipoBy(filtros)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"GET",
          contentType: 'application/json',
        url:'api/confequipo/'+filtros,
        success:function(response){
          resolver(response);
        },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function getNumeroBienBy(filtros)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"GET",
          contentType: 'application/json',
        url:'api/numerobien/'+filtros,
        success:function(response){
          resolver(response);
        },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function getUnidadAdministrativaBy(filtros)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"GET",
          contentType: 'application/json',
        url:'api/unidadadministrativa/'+filtros,
        success:function(response){
          resolver(response);
        },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function getUnidadTrabajoBy(filtros)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"GET",
          contentType: 'application/json',
        url:'api/unidadtrabajo/'+filtros,
        success:function(response){
          resolver(response);
        },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function getUnidadesBy(filtros)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"GET",
          contentType: 'application/json',
        url:'api/unidades/'+filtros,
        success:function(response){
          resolver(response);
        },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function getDependenciasBy(filtros)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"GET",
          contentType: 'application/json',
        url:'api/dependencias/'+filtros,
        success:function(response){
          resolver(response);
        },error:function(response){
          rechazar(response);
        }
      });
   });  
}

function getReporteSolvenciaBy(filtros)
{
  return new Promise(function(resolver, rechazar) { 
    $.ajax({
        type:"GET",
          contentType: 'application/json',
        url:'api/reportesolvencia/'+filtros,
        success:function(response){
          resolver(response);
        },error:function(response){
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

