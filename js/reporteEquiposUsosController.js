// Controlador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{

        /* Cargando datas de la api a los selects  */     

        getConfiguracionBy("?tipo=ESTATUS DE USO DEL BIEN&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#descripcion")
                });
        })        

});



        function cargarTabla(){
            idBien = $
            valor = $("#descripcion").val();
            getEquiposBy("?estadoUsoEquipo="+valor+"&status=1").then(function(data){
                id_bien_buscar = data[0].id;
                jsonToTable({
                    data : data,
                    headers : headers,
                    table : $("#tableTipoEquipo"),
                    invisibleFields : ["unidad_admin","id","status","fecha_modif","serialSim","accesorios","planCelular","numeroCelular","motivo","imei","estadoUsoEquipo"],
                    limit : data.length,
                    showCount : true            
                  });
                jsonToForm({
                    data : data[0],
                    form : "#reporte"
                });                
            });
        }

headers = ["Descripción","Marca","Modelo","Serial","Color","Estado","Responsable","Características","Ubicación","Observaciones"];
