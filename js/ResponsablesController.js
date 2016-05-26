// Controlador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_responsable_editar = "";

        $("#guardarUserPersonal").click(function()
        {
            frm = $("#formPersonal");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarResponsables(dataForm).then(function(data){ 
            });  
        });

        $("#modificarUserPersonal").click(function()
        {
            frm = $("#formPersonal");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarResponsables(dataForm,id_responsable_editar);
        });

        $("#eliminarUserPersonal").click(function()
        {
            frm = $("#formPersonal");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarResponsables(dataForm,id_responsable_editar);
        });

        $("#buscarPersonal").click(function(){
            idBien = $
            numero = $("#buscar").val();
            getBienesBy("?cedula="+numero).then(function(data){
                id_responsable_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formPersonal"
                });
            });
        }); 

        /* Cargando datas de la api a los selects  */

        //Categoría de Unidades Administrativas 
        getUnidadAdministrativaBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_admin")
                });
        })
        
        //Unidad de Trabajo
        getUnidadTrabajoBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_trabajo")
                });
        })             

        //Cargo
        getConfiguracionAdminBy("?tipo=CARGO").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#cargo")
                });
        })             


});

