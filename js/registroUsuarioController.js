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

      $("#guardarUserPersonal").click(function()
        {
            frmUsuario = $("#formUsuario");
            dataForm = getFormData(frmUsuario);
            dataForm.status=1;
            registrarUsuario(dataForm).then(function(data){
              numero = data.id;              
              frm = $("#formPersonal");
              dataForm = getFormData(frm);
              dataForm.status=1;
              dataForm.id_usuario = numero;
                registrarPersonal(dataForm).then(function(data){
                  console.log("funciona");   
                });  

            });
        });
});
