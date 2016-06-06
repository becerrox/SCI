// Controlador 

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{

    var id_equipo_editar = "";

        $("#buscarEquipo").click(function(){
            idEquipo = $
            numero = $("#serial").val();
            getEquiposBy("?serial="+numero).then(function(data){
                id_equipo_editar = data[0].id;
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
                id_equipo_editar = data[0].id;
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
            getResponsablesBy("?cedula="+numero).then(function(data){
                jsonToForm({
                    data : data[0],
                    form : "#formResponsable"
                });                
            });
        }); 

        $("#btnGuardar").click(function()
        {
            var responsb = document.getElementById("nombres").value.toUpperCase() + " " + document.getElementById("apellidos").value.toUpperCase();

            frm = $("#constanciaRetiro");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.responsable=responsb;
            retiroEquipos(dataForm,id_equipo_editar).then(function(data){   
            });
        });            

headers = [];





        /* Cargando datas de la api a los selects  */           
  

        getResponsablesBy("?status=1").then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
                data[personal].ci = data[personal].cedula;
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

