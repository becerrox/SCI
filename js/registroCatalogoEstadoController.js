// Controlador de la vista de catalogo de colores
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_configuracion_editar = "";

        $("#btnGuardar").click(function()
        {
            frm = $("#formEstadoUso");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.tipo="ESTADO DEL BIEN";
            registrarConfiguracion(dataForm).then(function(data){
             });
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formEstadoUso");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.tipo="ESTADO DEL BIEN";
            modificarConfiguracion(dataForm,id_configuracion_editar).then(function(data){   
            });
        });   

        $("#btnEliminar").click(function()
        {
            frm = $("#formEstadoUso");
            dataForm = getFormData(frm);
            dataForm.status=0;
            eliminarConfiguracion(dataForm,id_configuracion_editar).then(function(data){   
            });
        });   

        $("#buscarConfiguracion").click(function(){
            idConfiguracion = $
            descripcion = $("#buscar").val();
            getConfiguracionBy("?descripcion="+descripcion).then(function(data){
                id_configuracion_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formEstadoUso"
                });
            });
        });  


        getConfiguracionBy("?tipo=ESTADO DEL BIEN").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#buscar")
                });
        })              

});

