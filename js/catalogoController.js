// Controloador de la vista de catalogo

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

