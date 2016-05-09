// Controlador de la vista de cambio de clave
console.log(sessionStorage.dataUsuario);
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
                        numero = datosUsuario.data_personal.id_usuario;
                        getUsuariosBy("?id="+numero).then(function(data){
                            id_usuario_editar = data[0].id;
                        });                                  
                        document.getElementById("inicio").style.visibility = "hidden";
                        document.getElementById("inventario").style.visibility = "hidden";
                        document.getElementById("reportes").style.visibility = "hidden";
                        document.getElementById("administrador").style.visibility = "hidden";
                    }
                    if (dataUsuarios.primer_inicio==1)
                    {
                        idUsuario = $
                        numero = datosUsuario.data_personal.id_usuario;
                        getUsuariosBy("?id="+numero).then(function(data){
                            id_usuario_editar = data[0].id;
                        });                               
                if (datosUsuario.nivel==1) //Nivel Administrador de Bienes
                    {
                        document.getElementById("equipos").style.display = "none";
                        document.getElementById("reporte_equipos").style.display = "none";     
                        document.getElementById("registro_usuarios").style.display = "none";  
                    }
                if (datosUsuario.nivel==2) //Nivel Regular Usuario de Bienes
                    {
                        document.getElementById("equipos").style.display = "none";
                        document.getElementById("reporte_equipos").style.display = "none";
                        document.getElementById("registro_usuarios").style.display = "none";
                        document.getElementById("reporte_equipos").style.display = "none";
                        document.getElementById("btnEliminar").style.display = "none";
                    }                                    }                    

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
            modificarUsuarioPass(dataForm,id_usuario_editar).then(function(data){ 
             });
        });

});


