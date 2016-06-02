// Controlador de la vista configuración de unidades administrativas-trabajo
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_unidad_editar = "";

        $("#btnGuardar").click(function()
        {
            frm = $("#formTrabajo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarUnidadTrabajo(dataForm).then(function(data){
             });
        });        

        $("#btnModificar").click(function()
        {
            frm = $("#formTrabajo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarUnidadTrabajo(dataForm,id_unidad_editar).then(function(data){   
            });
        });   

        $("#btnEliminar").click(function()
        {
            frm = $("#formTrabajo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarUnidadTrabajo(dataForm,id_unidad_editar);
        });     

        $("#buscarUnidad").click(function(){
            idConfiguracion = $
            descripcion = $("#buscar").val();
            getUnidadTrabajoBy("?descripcion="+descripcion).then(function(data){
                id_unidad_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formTrabajo"
                });
            });
        });  

        getUnidadTrabajoBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#buscar")
                });
        })    

});

