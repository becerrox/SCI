// Controlador de la vista de catalogo de colores
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{

        $("#btnGuardar").click(function()
        {
            frm = $("#formEstatusUso");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.tipo="ESTATUS DE USO DEL BIEN";
            registrarConfiguracion(dataForm).then(function(data){
             });
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formEstatusUso");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.tipo="ESTATUS DE USO DEL BIEN";
            modificarConfiguracion(dataForm,id_configuracion_editar).then(function(data){   
            });
        });   

        $("#btnEliminar").click(function()
        {
            frm = $("#formEstatusUso");
            dataForm = getFormData(frm);
            dataForm.status=0;
            eliminarConfiguracion(dataForm,id_configuracion_editar).then(function(data){   
            });
        });   


        getConfiguracionBy("?tipo=ESTATUS DE USO DEL BIEN&status=1").then(function(data){
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
            getConfiguracionBy("?descripcion="+descripcion+"&status=1").then(function(data){
                id_configuracion_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formEstatusUso"
                });
            });
        }
