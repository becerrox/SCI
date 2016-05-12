// Controlador 

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

        $("#buscarEquipo").click(function(){
            idEquipo = $
            numero = $("#serial").val();
            getEquiposBy("?serial="+numero).then(function(data){
                id_equipo_editar = data[0].id;
                jsonToTableTraspuesto({
                    data : data,
                    headers : headers,
                    table : $("#tableEquipos"),
                    invisibleFields : ["id","color","unidad_admin","status","responsable","fecha_modif","unidad_trabajo","serialSim","accesorios","planCelular","numeroCelular"]
                  });
                jsonToForm({
                    data : data[0],
                    form : "#formBienes"
                });                
            });
        });  

headers = [];


        $("#btnGuardar").click(function()
        {
            frm = $("#formBienes");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarBienes(dataForm).then(function(data){ 
            });  
        });


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
            }
            jsonToSelect({        
                 data : data,
                 value : "nombreApellido",
                 alias : "nombreApellido",
                 element : $("#responsable_usos")                          
                 });             
                jsonToForm({
                    data : data,
                    form : "#constancia"
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
               
});

