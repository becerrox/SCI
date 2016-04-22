// Controloador de la vista de inicio

console.log(sessionStorage.dataUsuario);

$(document).ready(function()
{
        $("#header").load("header.html",function()
        {
            dataUsuario = JSON.parse(sessionStorage.dataUsuario);
                    if (dataUsuario.primer_inicio==0) 
                    {
                                $("#superuser").hide(); 
                                $(".superuser").hide();        
                    }                    
             });
        });        
