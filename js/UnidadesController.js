// Controlador de la vista configuración de unidades administrativas-trabajo
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_numerobien_editar = "";

        $("#btnGuardarUniAdm").click(function()
        {
            frm = $("#formAdmin");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarUnidadAdministrativa(dataForm).then(function(data){
             });
        });

        $("#btnGuardarUniTrab").click(function()
        {
            frm = $("#formTrabajo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarUnidadTrabajo(dataForm).then(function(data){
             });
        });        

        $("#btnModificar").click(function()
        {
            frm = $("#formNuevaConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarNumeroBien(dataForm,id_numerobien_editar).then(function(data){   
            });
        });   

        $("#btnEliminar").click(function()
        {
            frm = $("#formNuevaConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarNumeroBien(dataForm,id_numerobien_editar);
        });     

        $("#buscarConfiguracion").click(function(){
            idConfiguracion = $
            descripcion = $("#buscar").val();
            getNumeroBienBy("?descripcion="+descripcion).then(function(data){
                id_numerobien_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formNuevaConfig"
                });
            });
        });  



});

