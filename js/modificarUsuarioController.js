// Controloador de la vista de modificación de equipo

console.log(sessionStorage.dataUsuario);
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
    var datosUsuario = JSON.parse(sessionStorage.dataUsuario);
    $("#nombreUsuario").html(datosUsuario.data_personal.nombres + " " + datosUsuario.data_personal.apellidos);    

    $("#cerrarSesionButton").click(function(){
        sessionStorage.removeItem("dataUsuario");
        location.href="index.html";    
    });

});

