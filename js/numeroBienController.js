// Controlador de la vista de catalogo de configuraciones
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_numerobien_editar = "";

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

        $("#btnGuardarNuevaCongif").click(function()
        {
            frm = $("#formNuevaConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarNumeroBien(dataForm).then(function(data){
             });
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formNuevaConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarNumeroBien(dataForm,id_numerobien_editar).then(function(data){   
            });
        });   

        $("#btnEliminar").click(function()
        {
            frm = $("#formNuevaConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarNumeroBien(dataForm,id_numerobien_editar);
        });     

        $("#buscarConfiguracion").click(function(){
            idConfiguracion = $
            descripcion = $("#buscar").val();
            getNumeroBienBy("?descripcion="+descripcion).then(function(data){
                id_numerobien_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formNuevaConfig"
                });
            });
        });  



});

