// Controlador de la vista de catalogo de configuraciones
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_configuracion_editar = "";

        $("#btnGuardar").click(function()
        {
            frm = $("#formCargos");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.tipo="CARGO";
            registrarConfiguracionAdmin(dataForm).then(function(data){
             });
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formCargos");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.tipo="CARGO";
            modificarConfiguracionAdmin(dataForm,id_configuracion_editar).then(function(data){   
            });
        });   

        $("#btnEliminar").click(function()
        {
            frm = $("#formCargos");
            dataForm = getFormData(frm);
            dataForm.status=0;
            eliminarConfiguracionAdmin(dataForm,id_configuracion_editar);
        });     

        $("#buscarCargo").click(function(){
            idConfiguracion = $
            descripcion = $("#buscar").val();
            getConfiguracionAdminBy("?descripcion="+descripcion+"&status=1").then(function(data){
                id_configuracion_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formCargos"
                });
            });
        });  

        getConfiguracionAdminBy("?tipo=CARGO&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#buscar")
                });
        })               

});

