// Controloador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{

        $("#btnGuardar").click(function()
        {
            frm = $("#formEquipo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarEquipo(dataForm).then(function(data){
                  console.log("funciona");   
                });  ;
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formEquipo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarEquipos(dataForm,id_equipo_editar).then(function(data){   
            });
        });     

        $("#btnEliminar").click(function()
        {
            frm = $("#formEquipo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarEquipos(dataForm,id_equipo_editar);
        });     

        $("#buscarEquipo").click(function(){
            idEquipo = $
            numero = $("#buscar").val();
            if (numero == ""){
                getEquiposBy('').then(function(data){
                    jsonToSelect({        
                        data : data,
                        value : "serial",
                        alias : "serial",
                        element : $("#buscarSerial")
                        });
                });
            }
            else{
                getEquiposBy("?serial="+numero).then(function(data){
                    id_equipo_editar = data[0].id;
                    jsonToForm({
                        data : data[0],
                        form : "#formEquipo"
                    });
                });
            }
        });            

        getConfiguracionBy("?tipo=COLOR&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#color")
                });
        })     

        //Estado del bien 
        getConfiguracionBy("?tipo=ESTADO DEL BIEN&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#estado")
                });
        })

        //Categoría de Unidades Administrativas 
        getUnidadAdministrativaBy("?status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_admin")
                });
        })
        //Unidad de Trabajo
        getUnidadTrabajoBy("?status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_trabajo")
                });
        })                

        //Estatus de Uso del Bien 
        getConfiguracionBy("?tipo=ESTATUS DE USO DEL BIEN&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#estadoUsoEquipo")
                });
        })           
        
        //Descripción
        getConfiguracionEquipoBy("?tipo=DESCRIPCIÓN&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#descripcion")
                });
        })    

        //Marca
        getConfiguracionEquipoBy("?tipo=MARCA&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#marca")
                });
        }) 


        //Modelo
        getConfiguracionEquipoBy("?tipo=MODELO&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#modelo")
                });
        }) 

        getResponsablesBy("?status=1").then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
            }
            jsonToSelect({        
                 data : data,
                 value : "nombreApellido",
                 alias : "nombreApellido",
                 element : $("#responsable")
                 });
         })    

});

        var id_equipo_editar = "";

        function cargarEquipos(){
            idEquipo = $
            numeros = $("#buscarSerial").val();
                getEquiposBy("?serial="+numeros).then(function(data){
                    id_equipo_editar = data[0].id;
                    jsonToForm({
                        data : data[0],
                        form : "#formEquipo"
                    });
                });            
        }
