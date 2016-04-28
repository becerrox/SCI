// Controlador de la vista de cambio de clave

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_usuario_editar = "";

        $("#header").load("header.html",function()
        {
            var datosUsuario = JSON.parse(sessionStorage.dataUsuario);
            $("#nombreUsuario").html(datosUsuario.data_personal.nombres + " " + datosUsuario.data_personal.apellidos);    
                    if (dataUsuarios.primer_inicio==0)
                    {
                        idUsuario = $
                        numero = datosUsuario.data_personal.id;
                        getUsuariosBy("?id="+numero).then(function(data){
                            id_usuario_editar = data[0].id;
                        });                                  
                        $("#inicio").hide(); 
                        $("#inventario").hide(); 
                        $("#reportes").hide(); 
                        $("#administrador").hide();
                    }
                    if (dataUsuarios.primer_inicio==1)
                    {
                        idUsuario = $
                        numero = datosUsuario.data_personal.id;
                        getUsuariosBy("?id="+numero).then(function(data){
                            id_usuario_editar = data[0].id;
                        });                               
                    }                    

            $("#cerrarSesionButton").click(function(){
                sessionStorage.removeItem("dataUsuario");
                location.href="index.html";    
             });
        });        
         dataUsuarios = JSON.parse(sessionStorage.dataUsuario);

        $("#btnGuardar").click(function()
        {
            frm = $("#formCambioClave");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarUsuario(dataForm,id_usuario_editar);    
        });

});


