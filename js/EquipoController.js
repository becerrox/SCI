// Controloador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_equipo_editar = "";

        $("#header").load("header.html",function()
        {
            var datosUsuario = JSON.parse(sessionStorage.dataUsuario);
            $("#nombreUsuario").html(datosUsuario.data_personal.nombres + " " + datosUsuario.data_personal.apellidos);    

            $("#cerrarSesionButton").click(function(){
                sessionStorage.removeItem("dataUsuario");
                location.href="index.html";    
             });
                if (datosUsuario.nivel==1) //Nivel Administrador de Bienes
                    {
                        document.getElementById("equipos").style.display = "none";
                        document.getElementById("reporte_equipos").style.display = "none";     
                        document.getElementById("registro_usuarios").style.display = "none";  
                    }
                if (datosUsuario.nivel==2) //Nivel Regular Usuario de Bienes
                    {
                        document.getElementById("equipos").style.display = "none";
                        document.getElementById("reporte_equipos").style.display = "none";
                        document.getElementById("registro_usuarios").style.display = "none";
                        document.getElementById("reporte_equipos").style.display = "none";
                        document.getElementById("btnEliminar").style.display = "none";
                    }                
        });        

        $("#btnGuardar").click(function()
        {
            frm = $("#formEquipo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarEquipo(dataForm).then(function(data){
                  console.log("funciona");   
                });  ;
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formEquipo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarEquipos(dataForm,id_equipo_editar).then(function(data){   
            });
        });     

        $("#btnEliminar").click(function()
        {
            frm = $("#formEquipo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarEquipos(dataForm,id_equipo_editar);
        });     

        $("#buscarEquipo").click(function(){
            idEquipo = $
            numero = $("#buscar").val();
            getEquiposBy("?serial="+numero).then(function(data){
                id_equipo_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formEquipo"
                });
            });
        });            

        getConfiguracionBy("?tipo=COLOR").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#color")
                });
        })     

        //Estado del bien 
        getConfiguracionBy("?tipo=ESTADO DEL BIEN").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#estado")
                });
        })

        //Categoría de Unidades Administrativas 
        getUnidadAdministrativaBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_admin")
                });
        })
        //Unidad de Trabajo
        getUnidadTrabajoBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_trabajo")
                });
        })                

        //Estatus de Uso del Bien 
        getConfiguracionBy("?tipo=ESTATUS DE USO DEL BIEN").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#estadoUsoEquipo")
                });
        })           
        
        //Descripción
        getConfiguracionEquipoBy("?tipo=DESCRIPCIÓN").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#descripcion")
                });
        })    

        //Marca
        getConfiguracionEquipoBy("?tipo=MARCA").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#marca")
                });
        }) 


        //Modelo
        getConfiguracionEquipoBy("?tipo=MODELO").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#modelo")
                });
        }) 

        getResponsablesBy('').then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
            }
            jsonToSelect({        
                 data : data,
                 value : "nombreApellido",
                 alias : "nombreApellido",
                 element : $("#responsable")
                 });
         })    

});

