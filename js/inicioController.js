// Controloador de la vista de inicio

console.log(sessionStorage.dataUsuario);
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

                    if (dataUsuario.nivel==1) 
                    {
                                $("#superuser").hide(); 
                                $(".superuser").hide();                     
                    }
            $("#cerrarSesionButton").click(function(){
                sessionStorage.removeItem("dataUsuario");
                location.href="index.html";    
             });
        });        
                    dataUsuario = JSON.parse(sessionStorage.dataUsuario);
});
