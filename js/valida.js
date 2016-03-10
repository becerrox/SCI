function valida_login(){

    var nombre = document.getElementById("username").value;
    var contraseña = document.getElementById("contrasena").value;         

    if(nombre=="") {
    $('#alert').html('Debes Ingresar un usuario').slideDown(500);
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
//validación de resgistro de usuarios
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
// Solo permite ingresar numeros.
 function soloNumeros(e){

  var key = window.Event ? e.which : e.keyCode
return ((key >= 48 && key <= 57) || (key==8))

}

// Calendario
    $(function(){
      $("#fecha1").datepicker();
      $("#fecha2").datepicker({
        changeMonth:true,
        changeYear:true,
      });
      $("#fecha3").datepicker({
        changeMonth:true,
        changeYear:true,
        showOn: "button",
        buttonImage: "css/images/ico.png",
        buttonImageOnly: true,
        showButtonPanel: true,
      })
    })
// Habilita y deshabilita elementos de un formulario
    function habilita(){
        $(".inputText").removeAttr("disabled");
    }
    function deshabilita(){
        $(".inputText").attr("disabled","disabled");
    }
//validación de resgistro de equipos
    function Validar_req(){
          var equipo = document.getElementById('equipo').value;
          var marca= document.getElementById('marca').value;
          var serial = document.getElementById('serial').value;
          var color = document.getElementById('color').value;
          var caract = document.getElementById('caract').value;
          var obsv = document.getElementById('obsv').value;
          var ubica = document.getElementById('ubica').value;
          var encargado = document.getElementById('encargado').value;

          if(equipo==""){
            $('#alert').html('Debes ingresar un tipo de equipo').slideDown(500);
            $('#equipo').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(marca==""){
            $('#alert').html('Debes ingresar una marca').slideDown(500);
            $('#marca').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(serial==""){
            $('#alert').html('Debes ingresar un serial').slideDown(500);
            $('#serial').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }

          if(color==""){
            $('#alert').html('Debes ingresar un color').slideDown(500);
            $('#color').focus();
            return false;
          }

          else{
            $('#alert').html('').slideUp(300);
          }

        if(caract==""){
            $('#alert').html('Debes ingresar las características').slideDown(500);
            $('#caract').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
        if(obsv==""){
            $('#alert').html('Debes ingresar un Usuario').slideDown(500);
            $('#obsv').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
        if(ubica=="0"){
            $('#alert').html('Debes seleccionar una ubicación').slideDown(500);
            $('#ubica').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
        if(encargado=="0"){
            $('#alert').html('Debes seleccionar a un encargado').slideDown(500);
            $('#encargado').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }

 }
