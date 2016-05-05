// Controlador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_bien_buscar = "";
        var filtro_bien = "";

        $("#header").load("header.html",function()
        {
            var datosUsuario = JSON.parse(sessionStorage.dataUsuario);
            $("#nombreUsuario").html(datosUsuario.data_personal.nombres + " " + datosUsuario.data_personal.apellidos);    

            $("#cerrarSesionButton").click(function(){
                sessionStorage.removeItem("dataUsuario");
                location.href="index.html";    
             });
        });        

        $("#btnBuscar").click(function(){
            idBien = $
            numero = $("#responsable_ad").val();
            getBienesBy("?responsable_ad="+numero).then(function(data){
                id_bien_buscar = data[0].id;
                jsonToTable({
                    data : data,
                    headers : headers,
                    table : $("#tableReporteBienes"),
                    invisibleFields : ["id", "fecha_modif", "status", "responsable_pa", "responsable_ad", "responsable_uso",  "per_ini", "per_culm", "unidad_trabajo"]
                  });
                jsonToForm({
                    data : data[0],
                    form : "#reporte"
                });                
            });
/*            location.href='reporte1.html';
*/        }); 

        /* Cargando datas de la api a los selects  */     

        getPersonalBy('').then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
            }
            jsonToSelect({        
                 data : data,
                 value : "nombreApellido",
                 alias : "nombreApellido",
                 element : $("#responsable_ad")
                 });
         })  

        getPersonalBy('').then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
            }
            jsonToSelect({        
                 data : data,
                 value : "nombreApellido",
                 alias : "nombreApellido",
                 element : $("#responsable_uso")
                 });
         })       

        getBienesBy('').then(function(data){
            for(bienesgeneral in data){
                data[bienesgeneral].descripcion = data[bienesgeneral].descripcion;
            }
            jsonToSelect({        
                 data : data,
                 value : "descripcion",
                 alias : "descripcion",
                 element : $("#descripcion")
                 });
         })          

        getConfiguracionBy("?tipo=Unidad de Trabajo").then(function(data){
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#unidad_trabajo")
                });
        })          

headers = [ "Código General", "Código de Sub-categoría", "Código de Categoría Específica", "Descripción", "Estatus Uso Bien", "Marca", "Modelo", "Serial", "Tipo Componentes", "Colores", "Número de bien", "Estado bien", "Categoria de unidad administrativa"];

/*        getBienesBy('').then(function(data){
            for(bienesgeneral in data){
                data[bienesgeneral].unidad_trabajo = data[bienesgeneral].unidad_trabajo;
            }
            jsonToSelect({        
                 data : data,
                 value : "unidad_trabajo",
                 alias : "unidad_trabajo",
                 element : $("#unidad_trabajo")
                 });
         })*/          

                 
});

