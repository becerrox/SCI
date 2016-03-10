function valida(){

    var nombre = document.getElementById("username").value;
    var contraseña = document.getElementById("contraseña").value;         

    if(nombre=="") {
    $('#alert').html('Debes Ingresar un Usuario').slideDown(500);
    $('#username').focus();
    return false;
              }
    else{
      $('#alert').html('').slideUp(300);
        }
    if(contraseña=="") {
    $('#alert').html('Debes Ingresar una contraseña').slideDown(500);
    $('#contraseña').focus();
    return false;
              }
      else{
      $('#alert').html('').slideUp(300);
      
        }
 }

function Validador(email){
          var tester = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-]+)\.)+([a-zA-Z0-9]{2,4})+$/;
          return tester.test(email);
        }

function Validar_re(){
          var cedula = document.getElementById('cedula').value;
          var nombres = document.getElementById('nombres').value;
          var email = document.getElementById('email').value;
          var telefono = document.getElementById('telefono').value;
          var pass1 = document.getElementById('pass1').value;
          var pass2 = document.getElementById('pass2').value;
          var usuario = document.getElementById('usuario').value;

          if(cedula==""){
            $('#alert').html('Debes ingresar una Cédula').slideDown(500);
            $('#cedula').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(nombres==""){
            $('#alert').html('Debes ingresar un nombre').slideDown(500);
            $('#nombre').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(email==""){
            $('#alert').html('Debes ingresar un email').slideDown(500);
            $('#email').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }

          if(Validador(email)==false){
            $('#alert').html('Ingresa un email válido').slideDown(500);
            $('#email').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }

          if(telefono==""){
            $('#alert').html('Debes ingresar un Teléfono').slideDown(500);
            $('#telefono').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }

          if(pass1==""){
            $('#alert').html('Debes ingresar una contraseña').slideDown(500);
            $('#pass1').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(pass2==""){
            $('#alert').html('Debes comprobar tu contraseña').slideDown(500);
            $('#pass2').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(pass2!=pass1){
            $('#alert').html('Las contraseñas no coinciden').slideDown(500);
            $('#pass1').val('');
            $('#pass2').val('');
            $('#pass1').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(usuario==""){
            $('#alert').html('Debes ingresar un Usuario').slideDown(500);
            $('#usuario').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
        }
 }