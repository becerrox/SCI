// Controlador de la vista configuración de unidades administrativas-trabajo
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{

        $("#btnGuardar").click(function()
        {
            frm = $("#formTrabajo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarUnidadAdministrativa(dataForm).then(function(data){
             });
        });        

        $("#btnModificar").click(function()
        {
            frm = $("#formTrabajo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarUnidadAdministrativa(dataForm,id_unidad_editar).then(function(data){   
            });
        });   

        $("#btnEliminar").click(function()
        {
            frm = $("#formTrabajo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarUnidadAdministrativa(dataForm,id_unidad_editar);
        });     

        getUnidadAdministrativaBy("?status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#buscar")
                });
        })    

});

        var id_unidad_editar = "";

        function cargarUnidad(){
            idConfiguracion = $
            descripcion = $("#buscar").val();
            getUnidadAdministrativaBy("?descripcion="+descripcion+"&status=1").then(function(data){
                id_unidad_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formTrabajo"
                });
            });
        }
