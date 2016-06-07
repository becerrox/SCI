// Controlador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        /* Cargando datas de la api a los selects  */     

        getResponsablesBy("?status=1").then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
            }
            jsonToSelect({        
                 data : data,
                 value : "nombreApellido",
                 alias : "nombreApellido",
                 element : $("#descripcion")
                 });
         })                

});



        function cargarTabla(){
            idBien = $
            numero = $("#descripcion").val();
            getEquiposBy("?responsable="+numero+"&status=1").then(function(data){
                id_bien_buscar = data[0].id;
                jsonToTable({
                    data : data,
                    headers : headers,
                    table : $("#tableTipoEquipo"),
                    invisibleFields : ["unidad_admin","id","status","fecha_modif","serialSim","accesorios","planCelular","numeroCelular","estadoUsoEquipo","motivo", "serialTelefono"],
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
