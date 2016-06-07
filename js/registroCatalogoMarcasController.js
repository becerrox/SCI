// Controlador de la vista de catalogo de descripciones
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_configuracion_editar = "";

        $("#btnGuardar").click(function()
        {
            frm = $("#formMarcas");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.tipo="MARCA";
            registrarConfiguracionEquipo(dataForm).then(function(data){
             });
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formMarcas");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.tipo="MARCA";
            modificarConfiguracionEquipo(dataForm,id_configuracion_editar).then(function(data){   
            });
        });   

        $("#btnEliminar").click(function()
        {
            frm = $("#formMarcas");
            dataForm = getFormData(frm);
            dataForm.status=0;
            eliminarConfiguracionEquipo(dataForm,id_configuracion_editar);
        });     

        getConfiguracionEquipoBy("?tipo=MARCA&status=1").then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#buscar")
                });
        })          

});


        function cargarConfiguracion(){
            idConfiguracion = $
            descripcion = $("#buscar").val();
            getConfiguracionEquipoBy("?descripcion="+descripcion+"&status=1").then(function(data){
                id_configuracion_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formMarcas"
                });
            });
        }
