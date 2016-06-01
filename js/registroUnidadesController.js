// Controlador de la vista de catalogo de unidades
if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_unidad_editar = "";
        var id_dependencia_editar = "";

        $("#btnGuardarUnidad").click(function()
        {
            var descripcion = document.getElementById("unidad_admin").value.toUpperCase() + " de " +document.getElementById("unidad_trabajo").value.toUpperCase();

            frm = $("#formUnidades");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.descripcion=descripcion;
            registrarUnidades(dataForm).then(function(data){
             });
        });

        $("#btnGuardarDepend").click(function()
        {
            var descripcion = document.getElementById("unidad_admin2").value.toUpperCase() + " de " +document.getElementById("unidad_trabajo2").value.toUpperCase();

            frm = $("#formDependencias");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.descripcion=descripcion;            
            registrarDependencias(dataForm).then(function(data){
             });
        });        

/*        $("#btnModificar").click(function()
        {
            frm = $("#formNuevaConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarNumeroBien(dataForm,id_unidad_editar).then(function(data){   
            });
        });   

        $("#btnEliminar").click(function()
        {
            frm = $("#formNuevaConfig");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarNumeroBien(dataForm,id_unidad_editar);
        });     */

        $("#buscarUnidad").click(function(){
            idConfiguracion = $
            descripcion = $("#buscarUnidades").val();
            getUnidadesBy("?descripcion="+descripcion).then(function(data){
                id_unidad_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formUnidades"
                });
            });
        });          

        $("#buscarDependencia").click(function(){
            idConfiguracion = $
            descripcion = $("#buscarDependencias").val();
            getDependenciasBy("?descripcion="+descripcion).then(function(data){
                id_dependencia_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formDependencias"
                });
            });
        });                  


        //Categoría de Unidades Administrativas - Unidad
        getUnidadAdministrativaBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_admin") 
                });
        })

        //Unidad de Trabajo - Unidad
        getUnidadTrabajoBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_trabajo")
                });
        })        

        //Categoría de Unidades Administrativas - Dependencia
        getUnidadAdministrativaBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_admin2") 
                });
        })

        //Unidad de Trabajo  - Dependencia
        getUnidadTrabajoBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_trabajo2")
                });
        })        

        //Dependencia
        getUnidadesBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#pertenece")
                });
        })  

        //Unidad - Buscar
        getUnidadesBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#buscarUnidades")
                });
        })                

        //Depedencia - Buscar
        getDependenciasBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#buscarDependencias")
                });
        })                        

});

