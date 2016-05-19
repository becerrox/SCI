// Controloador de la vista de registro de usuario

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

            $("#cerrarSesionButton").click(function(){
                sessionStorage.removeItem("dataUsuario");
                location.href="index.html";    
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
                    }                
        });        

      $("#guardarUserPersonal").click(function()
        {
            frmUsuario = $("#formUsuario");
            dataForm = getFormData(frmUsuario);
            dataForm.status=1;
            registrarUsuario(dataForm).then(function(data){
              numero = data.id;              
              frm = $("#formPersonal");
              dataForm = getFormData(frm);
              dataForm.status=1;
              dataForm.id_usuario = numero;
                registrarPersonal(dataForm).then(function(data){
                  console.log("funciona");   
                });  
            });
        });

      $("#modificarUserPersonal").click(function()
        {              
            frm = $("#formPersonal");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarPersonal(dataForm,id_usuario_editar).then(function(data){   
                  console.log("funciona");
                });  
        });     

        $("#buscarUser").click(function(){
            idUsuario = $
            numero = $("#buscar").val();
            getPersonalBy("?ci_per="+numero).then(function(data){
                id_usuario_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formPersonal"
                });
            });
        });           

        //Categoría de Unidades Administrativas 
        getConfiguracionBy("?tipo=Categoría de Unidades Administrativas").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_admin")
                });
        })
        
        //Unidad de Trabajo
        getConfiguracionBy("?tipo=Unidad de Trabajo").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_trabajo")
                });
        })             

        //Nivel de usuario
        getNivelesBy().then(function(data){
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "nivel",
                element : $("#nivel")
                });
        })                  

        getPersonalBy('').then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
                data[personal].ci = data[personal].ci_per;
            }
            jsonToSelect({        
                 data : data,
                 value : "ci",
                 alias : "nombreApellido",
                 element : $("#buscar")              
                 });                         
         })                
});
