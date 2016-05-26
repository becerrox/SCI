// Controlador 

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{

        $("#buscarEquipo").click(function(){
            idEquipo = $
            numero = $("#serial").val();
            getEquiposBy("?serial="+numero).then(function(data){
                jsonToTableTraspuesto({
                    data : data,
                    headers : headers,
                    table : $("#tableEquipos"),
                    invisibleFields : ["id","color","unidad_admin","status","responsable","fecha_modif","unidad_trabajo","serialSim","accesorios","planCelular","numeroCelular","motivo"]
                  });              
            });
        });  

        $("#buscarCelular").click(function(){
            idEquipo = $
            numero = $("#serialCelular").val();
            getEquiposBy("?serial="+numero).then(function(data){
                jsonToTableTraspuesto({
                    data : data,
                    headers : headers,
                    table : $("#tableEquipos"),
                    invisibleFields : ["id","estado","unidad_admin","status","responsable","fecha_modif","unidad_trabajo","estadoUsoEquipo","motivo"]
                  });              
            });
        });  

        $("#buscarResp").click(function(){
            idEquipo = $
            numero = $("#responsable").val();
            getPersonalBy("?ci_per="+numero).then(function(data){
                jsonToForm({
                    data : data[0],
                    form : "#formResponsable"
                });                
            });
        });  

headers = [];





        /* Cargando datas de la api a los selects  */

        getConfiguracionBy("?tipo=Unidad de Trabajo").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_adm")
                });
        })                
  

        getPersonalBy('').then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
                data[personal].ci = data[personal].ci_per;
            }
            jsonToSelect({        
                 data : data,
                 value : "ci",
                 alias : "nombreApellido",
                 element : $("#responsable")                          
                 });             
                jsonToForm({
                    data : data,
                    form : "#constancia"
                });                 
         })  

               
});

