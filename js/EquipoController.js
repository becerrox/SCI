// Controloador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        $("#header").load("header.html",function()
        {
            var datosUsuario = JSON.parse(sessionStorage.dataUsuario);
            $("#nombreUsuario").html(datosUsuario.data_personal.nombres + " " + datosUsuario.data_personal.apellidos);    

            $("#cerrarSesionButton").click(function(){
                sessionStorage.removeItem("dataUsuario");
                location.href="index.html";    
             });
        });        

        $("#btnGuardar").click(function()
        {
            frm = $("#formEquipo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarEquipo(dataForm);
        });

        //Unidad de Trabajo
        getConfiguracionBy("?tipo=Color").then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#colores")
                });
        })     


        getPersonalBy('').then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
            }
            jsonToSelect({        
                 data : data,
                 value : "id",
                 alias : "nombreApellido",
                 element : $("#responsable_pa")
                 });
         })   

});

