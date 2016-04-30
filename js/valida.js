/*var fecha = new Date();
var año = fecha.getFullYear();
var mes= fecha.getMonth();
var dia= fecha.getDate();
var fechaActual= año+'-'+mes+'-'+dia;

 document.getElementById("reloj").innerHTML = año+'-'+mes+'-'+dia;*/
document.getElementById("celular").style.visibility = "hidden";

//Validacion Inicio Sesion, para campos vacios
function valida_login(){

    var nombre = document.getElementById("username").value;
    var contraseña = document.getElementById("contraseña").value;         

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
 function menuOculto()
{
   var equipo = document.getElementById("descripcion").value;
   if((equipo=="Celular") || (equipo=="celular")) {

     document.getElementById("celular").style.visibility = "visible";
     
   }
   else{
    document.getElementById("celular").style.visibility = "hidden";

   }
}

 // VALIDACIÓN SOLO LETRAS
 function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = "8-37-39-46";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }

// Solo permite ingresar numeros.
 function soloNumeros(e){

  var key = window.Event ? e.which : e.keyCode
return ((key >= 48 && key <= 57) || (key==8) || (key==118))  

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
          var fecha=document.getElementById("fecha1").value;
    
    if(fecha1)
    {  // calculamos la edad

        var values=fecha.split("-");
        var dia = values[2];
        var mes = values[1];
        var ano = values[0]; 

        // tomamos los valores actuales
        var fecha_hoy = new Date();
        var ahora_ano = fecha_hoy.getYear();
        var ahora_mes = fecha_hoy.getMonth()+1;
        var ahora_dia = fecha_hoy.getDate(); 

        // realizamos el calculo
        var edad = (ahora_ano + 1900) - ano;
        if ( ahora_mes < mes )
        { edad--; }
        if ((mes == ahora_mes) && (ahora_dia < dia))
        {  edad--;   }
        if (edad > 1900)
        {   edad -= 1900;     }

        // calculamos los meses
        var meses=0;
        if(ahora_mes>mes)
            meses=ahora_mes-mes;
        if(ahora_mes<mes)
            meses=12-(mes-ahora_mes);
        if(ahora_mes==mes && dia>ahora_dia)
            meses=11; 

        // calculamos los dias
        var dias=0;
        if(ahora_dia>dia)
            dias=ahora_dia-dia;
        if(ahora_dia<dia)
        {
            ultimoDiaMes=new Date(ahora_ano, ahora_mes, 0);
            dias=ultimoDiaMes.getDate()-(dia-ahora_dia);
        }
    }
    else{}

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
          if(edad < 18){
            $('#alert').html('Debe ser mayor de edad').slideDown(500);
            $('#fecha1').focus();
            return false;

          }
 }
 
//Validacion Registro de Usuario, para campos vacios
 function Validar_re_usu(){
          var pass1 = document.getElementById('pass1').value;
          var pass2 = document.getElementById('pass2').value;
          var usuario = document.getElementById('usuario').value;


          if(pass1==""){
            $('#alert2').html('Debes ingresar una contraseña').slideDown(500);
            $('#pass1').focus();
            return false;
          }
          else{
            $('#alert2').html('').slideUp(300);
          }
          if(pass2==""){
            $('#alert2').html('Debes comprobar tu contraseña').slideDown(500);
            $('#pass2').focus();
            return false;
          }
          else{
            $('#alert2').html('').slideUp(300);
          }
          if(pass2!=pass1){
            $('#alert2').html('Las contraseñas no coinciden').slideDown(500);
            $('#pass1').val('');
            $('#pass2').val('');
            $('#pass1').focus();
            return false;
          }
          else{
            $('#alert2').html('').slideUp(300);
          }
          if(usuario==""){
            $('#alert2').html('Debes ingresar un Usuario').slideDown(500);
            $('#usuario').focus();
            return false;
          }
          else{
            $('#alert2').html('').slideUp(300);
          }
        
 }

// Solo permite ingresar numeros.
 function soloNumerosCod(e){

  var key = window.Event ? e.which : e.keyCode
return ((key >= 48 && key <= 57) || (key==45) || (key==8)) 

}

// Permite enviar submit al presionar enter
//<![CDATA[
function Saltar(){
var clave   = document.getElementById("contrasena").value;
return false;
}

//]]>

// Calendario
    $(function(){
      $("#fecha1").datepicker({
        changeMonth:true,
        changeYear:true,
      });
      $("#fecha5").datepicker();
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
      $("#fecha4").datepicker({
        changeMonth:true,
        changeYear:true,
      });
    })
// Habilita y deshabilita elementos de un formulario
    function habilita(){
        $(".inputText").removeAttr("disabled");
    }
    function deshabilita(){
        $(".inputText").attr("disabled","disabled");
    }
//validación de resgistro de equipos,para campos vacios
    function Validar_req(){
          var descripcion = document.getElementById('descripcion').value;
          var marca= document.getElementById('marca').value;
          var serial = document.getElementById('serial').value;
          var modelo = document.getElementById('modelo').value;
          var color = document.getElementById('color').value;
          var estado = document.getElementById('estado').value;
          var unidad_admin = document.getElementById('unidad_admin').value;
          var unidad_trabajo = document.getElementById('unidad_trabajo').value;
          var responsable = document.getElementById('responsable').value;
          var caracteristicas = document.getElementById('caracteristicas').value;
          var observaciones = document.getElementById('observaciones').value;
          var serialSim = document.getElementById('serialSim').value;
          var numeroCelular = document.getElementById('numeroCelular').value;
          var accesorios = document.getElementById('accesorios').value;
          var planCelular = document.getElementById('planCelular').value;


          if(descripcion==""){
            $('#alert').html('Debes ingresar un tipo de equipo').slideDown(500);
            $('#descripcion').focus();
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
          if(modelo==""){
            $('#alert').html('Debes ingresar un modelo').slideDown(500);
            $('#modelo').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(color=="0"){
            $('#alert').html('Debes seleccionar un color').slideDown(500);
            $('#color_bien').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
        if(estado=="0"){
            $('#alert').html('Debes seleccionar un estado').slideDown(500);
            $('#estado').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }      
        if(unidad_admin=="0"){
            $('#alert').html('Debes seleccionar una opción').slideDown(500);
            $('#unidad_admin').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          } 
        if(unidad_trabajo=="0"){
            $('#alert').html('Debes seleccionar una opción').slideDown(500);
            $('#unidad_trabajo').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          } 
        if(responsable=="0"){
            $('#alert').html('Debes seleccionar a un encargado').slideDown(500);
            $('#responsable').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }     
        if(caracteristicas==""){
            $('#alert').html('Debes ingresar las características').slideDown(500);
            $('#caracteristicas').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
        if(observaciones==""){
            $('#alert').html('Debes ingresar las características').slideDown(500);
            $('#observaciones').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
if((equipo=="Celular") || (equipo=="celular")){

        if(serialSim==""){
            $('#alert').html('Debes ingresar un serial').slideDown(500);
            $('#serialSim').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
        if(numeroCelular==""){
            $('#alert').html('Debes ingresar un número').slideDown(500);
            $('#numeroCelular').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(accesorios==""){
            $('#alert').html('Debes ingresar los Accesorios').slideDown(500);
            $('#accesorios').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
        if(planCelular==""){
            $('#alert').html('Debes ingresar un Plan').slideDown(500);
            $('#planCelular').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          } 
      }
else{
        $('#alert').html('').slideUp(300);
      }      
 }
//Validacion Registro de Bienes, para campos vacios
 function Validar_rb(){
          var desc = document.getElementById('descripcion').value;
          var estatus= document.getElementById('estatus_uso_bien').value;
          var marca = document.getElementById('marca').value;
          var modelo = document.getElementById('modelo').value;
          var serial = document.getElementById('serial').value;
          var componentes = document.getElementById('tipo_comp').value;
          var color = document.getElementById('colores').value;
          var n_bien = document.getElementById('num_bien').value;
          var estado_bien = document.getElementById('estado_bien').value;
          var unidades = document.getElementById('cat_unid_admin').value;          
          var unidad_trabajo = document.getElementById('unidad_trab_bien').value;          
          var responsable_pa = document.getElementById('responsable_pa').value;
          var responsable_ad = document.getElementById('responsable_ad').value;
          var responsable_uso = document.getElementById('responsable_uso').value;
          var fecha1 = document.getElementById('fecha1').value;
          var fecha2 = document.getElementById('fecha2').value;


          if(desc=="0"){
            $('#alert').html('Debes seleccionar una descripción').slideDown(500);
            $('#descripcion').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }    
          if(estatus=="0"){
            $('#alert').html('Debes seleccionar un tipo de estatus').slideDown(500);
            $('#estatus_uso_bien').focus();
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
           if(modelo==""){
            $('#alert').html('Debes ingresar un modelo').slideDown(500);
            $('#modelo').focus();
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
        if(componentes=="0"){
            $('#alert').html('Debes seleccionar un componente').slideDown(500);
            $('#tipo_comp').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }        
        if(color=="0"){
            $('#alert').html('Debes seleccionar un color').slideDown(500);
            $('#colores').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }          
        if(n_bien==""){
            $('#alert').html('Debes ingresar un número de bien').slideDown(500);
            $('#num_bien').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          } 
        if(estado_bien=="0"){
            $('#alert').html('Debes seleccionar a un estado').slideDown(500);
            $('#estado_bien').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }   
        if(unidades=="0"){
            $('#alert').html('Debes seleccionar una Unidad Administrativa').slideDown(500);
            $('#cat_unid_admin').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          } 
         
          if(unidad_trabajo==""){
            $('#alert').html('Debes ingresar una unidad de trabajo').slideDown(500);
            $('#unidad_trab_bien').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }           
           if(responsable_pa==""){
            $('#alert').html('Debes ingresar un Responsable Patrimonial').slideDown(500);
            $('#responsable_pa').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
           if(responsable_ad==""){
            $('#alert').html('Debes ingresar un Responsable Administrativo').slideDown(500);
            $('#responsable_ad').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(responsable_uso==""){
            $('#alert').html('Debes ingresar un Responsable por Uso').slideDown(500);
            $('#responsable_uso').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }          
          if(fecha1==""){
            $('#alert').html('Debes ingresar una fecha de Inicio').slideDown(500);
            $('#fecha1').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(fecha2==""){
            $('#alert').html('Debes ingresar una fecha de Culminación').slideDown(500);
            $('#fecha2').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(f_elab==""){
            $('#alert').html('Debes ingresar una fecha de Elaboración').slideDown(500);
            $('#fecha4').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }     
          if(fecha1>fecha2){
            $('#alert').html('La fecha de Inicio no debe ser mayor que la de Culminación').slideDown(500);
            $('#fecha1').focus();
          }
          else{
            $('#alert').html('').slideUp(300);            
          }

 
 }
//Validaciones de Catalogo de Bienes,para campos vacios
  function Validar_cb_1(){
          var cod_general = document.getElementById('cod_cg').value;
          var desc_general =document.getElementById('desc_general').value;
          

          if(cod_general==""){
            $('#alert').html('Debes ingresar un Código General').slideDown(500);
            $('#cod_cg').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(desc_general==""){
            $('#alert').html('Debes ingresar una Descripción').slideDown(500);
            $('#desc_general').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
        }
 function Validar_cb_2(){
          
          var cod_sub = document.getElementById('cod_sub').value;
          var desc_sub = document.getElementById('desc_sub').value;
                 
         if(cod_sub==""){
            $('#alert').html('Debes ingresar una Sub-Categoría').slideDown(500);
            $('#cod_sub').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(desc_sub==""){
            $('#alert').html('Debes ingresar una descripción').slideDown(500);
            $('#desc_sub').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }

        } 
function Validar_cb_3(){
    var cod_ce = document.getElementById('cod_ce').value;
    var desc_ce = document.getElementById('desc_ce').value;

          
        if(cod_ce==""){
            $('#alert').html('Debes ingresar una Categoría').slideDown(500);
            $('#cod_ce').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(desc_ce==""){
            $('#alert').html('Debes ingresar una Descripción').slideDown(500);
            $('#desc_ce').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
        }
//Validacion Modificación de clave, para campos vacios
function Validar_m_clave(){
    var pass = document.getElementById('#pass').value;
    var pass2 = document.getElementById('#pass2').value;

          
        if(pass==""){
            $('#alert').html('Debes ingresar una Contraseña').slideDown(500);
            $('#pass').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
          if(pass2==""){
            $('#alert').html('Debes reingresar la Contraseña').slideDown(500);
            $('#pass2').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }
        }
//Validacion Catalogo de Configuraciones, para campos vacios
function Validar_cat_con(){
  var descrip = document.getElementById('descrip').value;
  if(descrip==""){
            $('#alert').html('Debes ingresar una Descripción').slideDown(500);
            $('#descrip').focus();
            return false;
          }
          else{
            $('#alert').html('').slideUp(300);
          }

}
