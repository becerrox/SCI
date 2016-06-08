// Controlador 

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

        var id_equipo_editar = "";


$(document).ready(function()
{


        $("#btnGuardar").click(function()
        {
            frm = $("#solvencia");
            dataForm = getFormData(frm);
            dataForm.status=1;
            solventarEquipos(dataForm,id_equipo_editar).then(function(data){   
            });
        });   


headers = [];

/*            frm = $("#solvencia");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarReporteSolvencia(dataForm).then(function(data){   
                console.log(data.id);
                $("#id_solvencia").html(data.id);
            });*/



        /* Cargando datas de la api a los selects  */         

        var nomb = "";
        var apell = "";

        getResponsablesBy("?status=1").then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " " +data[personal].apellidos;
                data[personal].ci = data[personal].cedula;
            }
            jsonToSelect({        
                 data : data,
                 value : "nombreApellido",
                 alias : "nombreApellido",
                 element : $("#responsable")
                 }); 
         })  


});

        function cargarPersonal(){
            idBien = $
            numero = $("#responsable").val();
            res = numero.split(" ");
            resnom1 = res[0];
            resnom2 = res[1];
            resapll1 = res[2];
            resapll2 = res[3];
            console.log(res[0,1]);
            getResponsablesBy("?nombres="+resnom1+" "+resnom2+"&apellidos="+resapll1+" "+resapll2+"&status=1").then(function(data){
                id_personal_buscar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#solvencia"
                });
            });
        } 

        var equipos = "";
        var modelos = "";
        var responsableq = "";

        function cargarEquipos(){
            responsableq = document.getElementById("responsable").value;
            getEquiposBy("?responsable="+responsableq+"&status=1").then(function(data){
                jsonToSelect({
                    data : data,
                    value : "descripcion",
                    alias : "descripcion",
                    element : $("#descripcion")
                    });
            })
        }

        function cargarModelos(){
            equipos = document.getElementById("descripcion").value;
            getEquiposBy("?responsable="+responsableq+"&descripcion="+equipos+"&status=1").then(function(data){
                jsonToSelect({
                    data : data,
                    value : "modelo",
                    alias : "modelo",
                    element : $("#modelo")
                    });
            })
        }

        function cargarSerial(){
            modelos = document.getElementById("modelo").value;
            getEquiposBy("?responsable="+responsableq+"&descripcion="+equipos+"&modelo="+modelos+"&status=1").then(function(data){
                jsonToSelect({
                    data : data,
                    value : "serial",
                    alias : "serial",
                    element : $("#serial")
                    });
            })
        }

        function buscarEquipo(){
            idEquipo = $
            numero = $("#serial").val();
            getEquiposBy("?serial="+numero).then(function(data){
                id_equipo_editar = data[0].id;
                console.log(data[0].descripcion);
                if (data[0].descripcion == "CELULAR")
                {
                jsonToTableTraspuesto({
                    data : data,
                    headers : headers,
                    table : $("#tableTipoEquipo"),
                    invisibleFields : ["id","estado","unidad_admin","status","responsable","fecha_modif","unidad_trabajo","estadoUsoEquipo","motivo"]
                  });              
                }
                else
                jsonToTableTraspuesto({
                    data : data,
                    headers : headers,
                    table : $("#tableTipoEquipo"),
                    invisibleFields : ["id","color","unidad_admin","status","responsable","fecha_modif","unidad_trabajo","serialSim","accesorios","planCelular","numeroCelular","motivo","serialTelefono"]
                  });                    
            });
        }          
