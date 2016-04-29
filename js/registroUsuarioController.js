// Controloador de la vista de registro de usuario

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_usuario_registro = "";

        $("#header").load("header.html",function()
        {
            var datosUsuario = JSON.parse(sessionStorage.dataUsuario);
            $("#nombreUsuario").html(datosUsuario.data_personal.nombres + " " + datosUsuario.data_personal.apellidos);    

            $("#cerrarSesionButton").click(function(){
                sessionStorage.removeItem("dataUsuario");
                location.href="index.html";    
             });
        });        

        $("#guardarUser").click(function()
        {
            frm = $("#formUsuario");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarUsuario(dataForm).then(function(data){ numero = data.id;
            });          
        });

        $("#modificarUser").click(function()
        {
            frm = $("#formUsuario");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarUsuario(dataForm);
        });

        $("#guardarPersonal").click(function()
        {
            idUsuario = $
            getUsuariosBy("?id="+numero).then(function(data){
                id_usuario_registro = data[0].id;
            });
            frm = $("#formPersonal");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarPersonal(dataForm,id_usuario_registro).then(function(data){
            });  
        });       

});

