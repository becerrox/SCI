
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_bien_buscar = "";

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

            idBien = $
            getUsuariosBy('').then(function(data){
                jsonToTableUsuario({
                    data : data,
                    headers : headers,
                    table : $("#tableUsuarios"),
                    invisibleFields : ["id","pass","primer_inicio","fecha_modif","pregunta","respuesta","f_nac","unidad_admin","fecha_creacion"],
                    limit : data.length,
                    showCount : true
                  });
           
            });

        /* Cargando datas de la api a los selects  */     


headers = ["Usuario", "nivel", "Cédula", "Nombres", "Apellidos", "Cargo", "Teléfono", "Correo", "Estatus", "Unidad de Trabajo"];                 
});

