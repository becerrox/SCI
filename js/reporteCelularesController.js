// Controlador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_bien_buscar = "";

        $("#btnBuscar").click(function(){
            idBien = $
            numero = $("#descripcion").val();
            getEquiposBy("?descripcion="+numero+"&status=1").then(function(data){
                id_bien_buscar = data[0].id;
                jsonToTable({
                    data : data,
                    headers : headers,
                    table : $("#tableTipoEquipo"),
                    invisibleFields : ["id","status","fecha_modif","descripcion","color","unidad_admin","estadoUsoEquipo","motivo"],
                    limit : data.length,
                    showCount : true            
                  });
                jsonToForm({
                    data : data[0],
                    form : "#reporte"
                });                
            });
        }); 

        /* Cargando datas de la api a los selects  */     

        getEquiposBy("?descripcion=CELULAR&status=1").then(function(data){
            jsonToTable({
                data : data,
                headers : headers,
                table : $("#tableTipoEquipo"),
                invisibleFields : ["id","status","fecha_modif","descripcion","color","unidad_admin","motivo"],
                limit : data.length,
                showCount : true            
              });            
        })              

headers = [ "Marca","Modelo","Serial","Estado","Responsable","Caracteristicas","Ubicación","Observaciones","Serial Sim","Accesorios","Plan","Número","Estado de Uso"];

});

