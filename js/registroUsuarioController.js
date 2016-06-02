// Controloador de la vista de registro de usuario

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_usuario_editar = "";

      $("#guardarUserPersonal").click(function()
        {
            frmUsuario = $("#formUsuario");
            dataForm = getFormData(frmUsuario);
            dataForm.status=1;
            registrarUsuario(dataForm).then(function(data){
                  console.log("funciona");   
            });
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formUsuario");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarUsuario(dataForm,id_usuario_editar).then(function(data){   
            });
        });     

        $("#btnEliminar").click(function()
        {
            frm = $("#formUsuario");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarUsuario(dataForm,id_usuario_editar);
        });     

        $("#buscarUser").click(function(){
            idUsuario = $
            numero = $("#buscar").val();
            getUsuariosBy("?ci_per="+numero).then(function(data){
                id_usuario_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formUsuario"
                });
            });
        });           

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

        //Nivel de usuario
        getNivelesBy().then(function(data){
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "nivel",
                element : $("#nivel")
                });
        })                  
          
        getUsuariosBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "ci_per",
                alias : "usuario",
                element : $("#buscar")
                });
        })          

});
