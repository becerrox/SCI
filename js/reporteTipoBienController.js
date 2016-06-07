
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
 

        /* Cargando datas de la api a los selects  */     

        getEquiposBy("?status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#descripcion")
                });
        })           

rows=["4"];
});



        function cargarTabla(){
            idBien = $
            numero = $("#descripcion").val();
            getBienesBy("?descripcion="+numero+"&status=1").then(function(data){
                id_bien_buscar = data[0].id;
                jsonToTable({
                    data : data,
                    headers : headers,
                    table : $("#tableReporteBienes"),
                    invisibleFields : ["id", "fecha_modif", "status", "responsable_pa", "responsable_ad", "responsable_uso",  "per_ini", "per_culm", "unidad_trabajo","sede"],
                    limit : data.length,
                    showCount : true                
                  });
                jsonToForm({
                    data : data[0],
                    form : "#reporte"
                });                
            });
        }

headers = [ "Código General", "Código de Sub-categoría", "Código de Categoría Específica", "Descripción", "Estatus Uso Bien", "Marca", "Modelo", "Serial", "Tipo Componentes", "Colores", "Número de bien", "Estado bien", "Categoria de unidad administrativa"];        
