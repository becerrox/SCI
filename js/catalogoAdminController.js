// Controlador de la vista de catalogo de configuraciones
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_configuracion_editar = "";

        $("#btnGuardarNuevaCongif").click(function()
        {
            frm = $("#formNuevaConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarDetallesConfiguracionAdmin(dataForm).then(function(data){
             });
        });

        $("#btnGuardarTipoConfig").click(function()
        {
            frm = $("#formCatConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarConfiguracionAdmin(dataForm).then(function(data){
             });
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formCatConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarConfiguracionAdmin(dataForm,id_configuracion_editar).then(function(data){   
            });
        });   

        $("#btnEliminar").click(function()
        {
            frm = $("#formCatConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarConfiguracionAdmin(dataForm,id_configuracion_editar);
        });     

        $("#buscarConfiguracion").click(function(){
            idConfiguracion = $
            descripcion = $("#buscar").val();
            getConfiguracionAdminBy("?descripcion="+descripcion).then(function(data){
                id_configuracion_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formCatConfig"
                });
            });
        });  

        getDetallesConfiguracionAdminBy('').then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#tipo")
                });
        })  

        getConfiguracionAdminBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#buscar")
                });
        })               

});

