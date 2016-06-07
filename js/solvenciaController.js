// Controlador 

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{

        var id_equipo_editar = "";

                $("#fecha1").html(today);
        $("#buscarEquipo").click(function(){
            idEquipo = $
            numero = $("#serial").val();
            getEquiposBy("?serial="+numero).then(function(data){
                id_equipo_editar = data[0].id;
                jsonToTableTraspuesto({
                    data : data,
                    headers : headers,
                    table : $("#tableTipoEquipo"),
                    invisibleFields : ["id","color","unidad_admin","status","responsable","fecha_modif","unidad_trabajo","serialSim","accesorios","planCelular","numeroCelular","estadoUsoEquipo","estadoUsoEquipo","motivo"]
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
                    table : $("#tableTipoEquipo"),
                    invisibleFields : ["id","color","unidad_admin","status","responsable","fecha_modif","unidad_trabajo","estadoUsoEquipo","motivo"]
                  });          
            });
        });  

        $("#btnGuardar").click(function()
        {
            frm = $("#solvencia");
            dataForm = getFormData(frm);
            dataForm.status=1;
            solventarEquipos(dataForm,id_equipo_editar).then(function(data){   
            });
        });   

        $("#buscarResp").click(function(){
            idBien = $
            numero = $("#responsable").val();
            getResponsablesBy("?cedula="+numero+"&status=1").then(function(data){
                id_personal_buscar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#solvencia"
                });
            });
        }); 


headers = [];

            frm = $("#solvencia");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarReporteSolvencia(dataForm).then(function(data){   
/*                var idReporte = data.id;
*/                console.log(data.id);
                $("#id_solvencia").html(data.id);

            });



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
         })  

var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();

if(dd<10) {
    dd='0'+dd
} 

if(mm<10) {
    mm='0'+mm
} 

today = yyyy+'/'+mm+'/'+dd;


});

