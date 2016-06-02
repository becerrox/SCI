$(document).ready(function()
{
        $("#btnBuscar").click(function(){
            idUsuario = $
            numero = $("#correo").val().toUpperCase();
            getUsuariosNombreBy("?correo="+numero).then(function(data){
            });
        });
});        
