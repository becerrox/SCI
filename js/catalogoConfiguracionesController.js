// Controlador de la vista de catalogo de configuraciones
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        $("#header").load("header.html",function()
        {
            var datosUsuario = JSON.parse(sessionStorage.dataUsuario);
            $("#nombreUsuario").html(datosUsuario.data_personal.nombres + " " + datosUsuario.data_personal.apellidos);    

            $("#cerrarSesionButton").click(function(){
                sessionStorage.removeItem("dataUsuario");
                location.href="index.html";    
             });
        });        

        $("#btnGuardar").click(function()
        {
            frm = $("#formCatConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarBienes(dataForm);
        });
});
