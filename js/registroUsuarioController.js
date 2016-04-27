// Controloador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
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
            registrarUsuario(dataForm);          
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
            frm = $("#formPersonal");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarUsuario(dataForm);
        });       

        getUsuariosBy('').then(function(data){
            for(usuarios in data){
                data[usuarios].nombreApellido = data[usuarios].nombres + " "+data[personal].apellidos;
            }
/*            jsonToSelect({        
                 data : data,
                 value : "nombreApellido",
                 alias : "nombreApellido",
                 element : $("#responsable_pa")
                 });*/
         })    

        // ($("#inputID").val()==jsonTraido.valorComparar)

});

