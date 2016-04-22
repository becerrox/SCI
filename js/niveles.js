
console.log(sessionStorage.dataUsuario);

$(document).ready(function()
{
        {
         dataUsuario = JSON.parse(sessionStorage.dataUsuario);
           
                    if (dataUsuario.nivel==1) 
                    {
                                $("#superuser").hide();         
                    }
                
        };        
           

});

