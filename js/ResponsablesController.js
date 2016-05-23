// Controlador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_responsable_editar = "";

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

        $("#guardarUserPersonal").click(function()
        {
            frm = $("#formPersonal");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarResponsables(dataForm).then(function(data){ 
            });  
        });

        $("#modificarUserPersonal").click(function()
        {
            frm = $("#formPersonal");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarResponsables(dataForm,id_responsable_editar);
        });

        $("#eliminarUserPersonal").click(function()
        {
            frm = $("#formPersonal");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarResponsables(dataForm,id_responsable_editar);
        });

        $("#buscarPersonal").click(function(){
            idBien = $
            numero = $("#buscar").val();
            getBienesBy("?cedula="+numero).then(function(data){
                id_responsable_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formPersonal"
                });
            });
        }); 

        /* Cargando datas de la api a los selects  */

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

        //Cargo
        getConfiguracionAdminBy("?tipo=CARGO").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#cargo")
                });
        })             


});

