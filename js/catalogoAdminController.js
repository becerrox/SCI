// Controlador de la vista de catalogo de configuraciones
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_configuracion_editar = "";

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
            registrarDetallesConfiguracionAdmin(dataForm).then(function(data){
             });
        });

        $("#btnGuardarTipoConfig").click(function()
        {
            frm = $("#formCatConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarConfiguracionAdmin(dataForm).then(function(data){
             });
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formCatConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarConfiguracionAdmin(dataForm,id_configuracion_editar).then(function(data){   
            });
        });   

        $("#btnEliminar").click(function()
        {
            frm = $("#formCatConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarConfiguracionAdmin(dataForm,id_configuracion_editar);
        });     

        $("#buscarConfiguracion").click(function(){
            idConfiguracion = $
            descripcion = $("#buscar").val();
            getConfiguracionAdminBy("?descripcion="+descripcion).then(function(data){
                id_configuracion_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formCatConfig"
                });
            });
        });  

        getDetallesConfiguracionAdminBy('').then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#tipo")
                });
        })  

        getConfiguracionAdminBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#buscar")
                });
        })               

});

