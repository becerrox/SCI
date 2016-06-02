$(document).ready(function()
{
        var id_usuario_recuperar = "";
        var id_usuario_editar = "";

        document.getElementById("formRecuperar").style.display = "none";
        document.getElementById("btnSolicitar").style.display = "none";
        

        $("#btnBuscar").click(function(){
            idUsuario = $
            numero = $("#usuario").val().toUpperCase();
            getUsuariosRecuperarBy("?usuario="+numero).then(function(data){
                id_usuario_recuperar = data[0];
                id_usuario_editar = data[0].id
                console.log(id_usuario_recuperar.usuario);
                if (numero == id_usuario_recuperar.usuario) 
                    {
                        document.getElementById("formRecuperar").style.display = "inline";
                        document.getElementById("btnSolicitar").style.display = "inline";
                    }
            });
        });

        $("#btnSolicitar").click(function(){
            var preguntas = document.getElementById("pregunta").value.toUpperCase();
            var respuestas = document.getElementById("respuesta").value.toUpperCase();

                if (preguntas == id_usuario_recuperar.pregunta && respuestas == id_usuario_recuperar.respuesta) {
                    frm = $("#formRecuperar");
                    dataForm = getFormData(frm);
                    dataForm.status=1;
                    dataForm.pass=12345
                    dataForm.primer_inicio=0
                    recuperarUsuario(dataForm,id_usuario_editar,id_usuario_recuperar).then(function(data){
                    });
                }
                else (
                    swal({
                    title: 'Aviso',
                    text: 'Pregunta o respuesta no coinciden',
                    type: 'info',
                    confirmButtonText: 'Aceptar',
                    confirmButtonColor: '#D85852'
                })
                    )
        });
});        
