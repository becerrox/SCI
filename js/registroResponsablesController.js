// Controloador de la vista de registro de usuario

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_responsable_editar = "";

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
            frmUsuario = $("#formPersonal");
            dataForm = getFormData(frmUsuario);
            dataForm.status=1;
            registrarResponsables(dataForm).then(function(data){
                  console.log("funciona");   
                });  
            });

      $("#modificarUserPersonal").click(function()
        {              
            frm = $("#formPersonal");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarResponsables(dataForm,id_responsable_editar).then(function(data){   
                  console.log("funciona");
                });  
        });     

        $("#buscarUser").click(function(){
            idUsuario = $
            numero = $("#buscar").val();
            getResponsableslBy("?ci_per="+numero).then(function(data){
                id_responsable_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formPersonal"
                });
            });
        });           

        //Categoría de Unidades Administrativas 
        getUnidadAdministrativaBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#unidad_admin")
                });
        })
        
        //Cargo
        getConfiguracionAdminBy("?tipo=cargo").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#cargo")
                });
        })

        //Unidad de Trabajo
        getUnidadTrabajoBy('').then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_trabajo")
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
