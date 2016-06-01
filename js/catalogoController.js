// Controlador de la vista de catalogo de configuraciones
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_configuracion_editar = "";

        $("#btnGuardarUniAdm").click(function()
        {
            frm = $("#formadmin");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarUnidadAdministrativa(dataForm).then(function(data){
             });
        });

        $("#btnGuardarUniTrab").click(function()
        {
            frm = $("#formtrabajo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarUnidadTrabajo(dataForm).then(function(data){
             });
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formCatConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarConfiguracionEquipo(dataForm,id_configuracion_editar).then(function(data){   
            });
        });   

        $("#btnEliminar").click(function()
        {
            frm = $("#formCatConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarConfiguracionEquipo(dataForm,id_configuracion_editar);
        });     

        $("#buscarConfiguracion").click(function(){
            idConfiguracion = $
            descripcion = $("#buscar").val();
            getNumeroBienBy("?descripcion="+descripcion).then(function(data){
                id_configuracion_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formCatConfig"
                });
            });
        });  


});

