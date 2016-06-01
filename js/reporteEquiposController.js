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
            getEquiposBy("?descripcion="+numero).then(function(data){
                id_bien_buscar = data[0].id;
                jsonToTable({
                    data : data,
                    headers : headers,
                    table : $("#tableTipoEquipo"),
                    invisibleFields : ["descripcion","unidad_admin","id","status","fecha_modif","serialSim","accesorios","planCelular","numeroCelular","motivo"],
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

        getEquiposBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#descripcion")
                });
        })              

headers = [ "Marca","Modelo","Serial","Color","Estado","Responsable","Características","Ubicación","Observaciones","Estado Uso"];

});

