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
                                $("#inicio").hide(); 
                                $("#inventario").hide(); 
                                $("#reportes").hide(); 
                                $("#administrador").hide();
                    }

            $("#cerrarSesionButton").click(function(){
                sessionStorage.removeItem("dataUsuario");
                location.href="index.html";    
             });
        });        
         dataUsuarios = JSON.parse(sessionStorage.dataUsuario);

        $("#btnGuardar").click(function()
        {
            idUsuario = $
            numero = $datosUsuarios.data_personal.id;
            console.log(numero);
            getUsuariosBy("?id="+numero).then(function(data){
                id_usuario_editar = data[0].id;
            });            
            frm = $("#formCambioClave");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarUsuario(dataForm,id_bien_editar).then(function(data){usuario.id_usuario = data.id
            });    
        });

});


