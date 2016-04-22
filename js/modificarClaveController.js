// Controlador de la vista de cambio de clave

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
                    if (dataUsuario.primer_inicio==0) 
                    {
                                $("#inicio").hide(); 
                                $("#inventario").hide(); 
                                $("#reportes").hide(); 
                                $("#administrador").hide(); 
                    }

            $("#cerrarSesionButton").click(function(){
                sessionStorage.removeItem("dataUsuario");
                location.href="index.html";    
             });
        });        
         dataUsuario = JSON.parse(sessionStorage.dataUsuario);

        $("#btnGuardar").click(function()
        {
            frm = $("#formCambioClave");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarBienes(dataForm);
        });
});

