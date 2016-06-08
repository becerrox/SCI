// Controlador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_bien_buscar = "";

            idBien = $
            getBienesGeneralBy().then(function(data){
                jsonToTable({
                    data : data,
                    headers : headers,
                    table : $("#tableReporteBienes"),
                    invisibleFields : ["id", "fecha_modif", "status", "responsable_pa", "responsable_ad", "responsable_uso",  "per_ini", "per_culm", "unidad_trabajo", "sede"],
                    limit : data.length,
                    showCount : true
                  });              
            });

        /* Cargando datas de la api a los selects  */     


headers = ["Código General", "Código de Sub-categoría", "Código de Categoría Específica", "Descripción", "Estatus Uso Bien", "Marca", "Modelo", "Serial", "Tipo Componentes", "Colores", "Número de bien", "Estado bien", "Categoria de unidad administrativa"];                 
});

