// Controlador de la vista de registro de equipo

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

        $("#btnGuardarSubcat").click(function()
        {
            frm = $("#formSubcat");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarSubcat(dataForm);
        });

        $("#btnGuardarCatgen").click(function()
        {
            frm = $("#formCatgen");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarCatgen(dataForm);
        });

        $("#btnGuardarCatesp").click(function()
        {
            frm = $("#formCatesp");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarCatesp(dataForm);
        });

        getCatgenBy("?status=1").then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#catgen")
                });
        })        

        getSubcatBy("?status=1").then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#subcat")
                });
        }) 
        
});

