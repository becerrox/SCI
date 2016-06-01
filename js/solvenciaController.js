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
            getResponsablesBy("?cedula="+numero).then(function(data){
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

        getResponsablesBy('').then(function(data){
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

});

