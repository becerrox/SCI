// Controlador de la vista de catalogo de configuraciones
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{

        $("#btnGuardarNuevaCongif").click(function()
        {
            frm = $("#formNuevaConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarNumeroBien(dataForm).then(function(data){
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

        //número de bien
        getNumeroBienBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#buscar")
                });
        })     

});

        var id_numerobien_editar = "";

        function cargarCodigo(){
            idConfiguracion = $
            descripcion = $("#buscar").val();
            getNumeroBienBy("?descripcion="+descripcion).then(function(data){
                id_numerobien_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formNuevaConfig"
                });
            });
        }  
