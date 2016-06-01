
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_bien_buscar = "";

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

