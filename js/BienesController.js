// Controlador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_bien_editar = "";

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
            frm = $("#formBienes");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarBienes(dataForm).then(function(data){ 
            });  
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formBienes");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarBien(dataForm,id_bien_editar);
        });

        $("#btnEliminar").click(function()
        {
            frm = $("#formBienes");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarBien(dataForm,id_bien_editar);
        });

        $("#buscarBien").click(function(){
            idBien = $
            numero = $("#buscar").val();
            getBienesBy("?serial="+numero).then(function(data){
                id_bien_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formBienes"
                });
            });
        }); 

        /* Cargando datas de la api a los selects  */

        getConfiguracionBy("?tipo=Color").then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#colores")
                });
        })

        //Estado del bien 
        getConfiguracionBy("?tipo=Estado del Bien").then(function(data){
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#estado_bien")
                });
        })

        //Categoría de Unidades Administrativas 
        getUnidadAdministrativaBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#cat_unid_admin")
                });
        })

        //Estatus de Uso del Bien 
        getConfiguracionBy("?tipo=Estatus de Uso del Bien").then(function(data){
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#estatus_uso_bien")
                });
        })

        //Tipo de Componente 
        getConfiguracionBy("?tipo=Tipo de Componente").then(function(data){
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#tipo_comp")
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

        //Descripción
        getConfiguracionEquipoBy("?tipo=Descripción").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#descripcion")
                });
        })    

        //Marca
        getConfiguracionEquipoBy("?tipo=Marca").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#marca")
                });
        }) 

        //Modelo
        getConfiguracionEquipoBy("?tipo=Modelo").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#modelo")
                });
        }) 

        //número de bien
        getConfiguracionEquipoBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "numero_bien",
                alias : "descripcion",
                element : $("#num_bien")
                });
        })     

        //Descripción
        getSedesBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "sede",
                alias : "sede",
                element : $("#sede")
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
                 element : $("#responsable_pa")
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
                 element : $("#responsable_ad")
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
                 element : $("#responsable_uso")
                 });
         })          

        getCatgenBy("?status=1").then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#catgen")
                });
        })        

        getSubcatBy("?status=1").then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#subcat")
                });
        })

        getCatespBy("?status=1").then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#catesp")
                });
        })                        
});

