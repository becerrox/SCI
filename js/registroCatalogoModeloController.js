// Controlador de la vista de catalogo de descripciones
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{

        $("#btnGuardar").click(function()
        {
            frm = $("#formModelos");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.tipo="MODELO";
            registrarConfiguracionEquipo(dataForm).then(function(data){
             });
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formModelos");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.tipo="MODELO";
            modificarConfiguracionEquipo(dataForm,id_configuracion_editar).then(function(data){   
            });
        });   

        $("#btnEliminar").click(function()
        {
            frm = $("#formModelos");
            dataForm = getFormData(frm);
            dataForm.status=0;
            eliminarConfiguracionEquipo(dataForm,id_configuracion_editar);
        });     

        getConfiguracionEquipoBy("?tipo=MODELO&status=1").then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#buscar")
                });
        })          

});

        var id_configuracion_editar = "";

        function cargarConfiguracion(){
            idConfiguracion = $
            descripcion = $("#buscar").val();
            getConfiguracionEquipoBy("?descripcion="+descripcion+"&status=1").then(function(data){
                id_configuracion_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formModelos"
                });
            });
        }  
