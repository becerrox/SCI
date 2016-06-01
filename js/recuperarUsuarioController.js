$(document).ready(function()
{
        var id_usuario_recuperar = "";
        var id_usuario_editar = "";


        $("#btnBuscar").click(function(){
            idUsuario = $
            numero = $("#correo").val().toUpperCase();
            getUsuariosRecuperarBy("?correo="+numero).then(function(data){
                id_usuario_recuperar = data[0];
                id_usuario_editar = data[0].id
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
