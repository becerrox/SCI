// Controlador de la vista de registro de equipo

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

        $("#btnBuscar").click(function(){
            idBien = $
            numero = $("#descripcion").val();
            getEquiposBy("?descripcion="+numero).then(function(data){
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

        getEquiposBy("?descripcion=CELULAR").then(function(data){
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

