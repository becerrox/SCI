// Controlador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{

        $("#btnGuardarSubcat").click(function()
        {
            frm = $("#formSubcat");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarSubcat(dataForm).then(function(data){
            });          
        });

        $("#btnGuardarCatgen").click(function()
        {
            frm = $("#formCatgen");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarCatgen(dataForm).then(function(data){
            });
        });

        $("#btnGuardarCatesp").click(function()
        {
            frm = $("#formCatesp");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarCatesp(dataForm).then(function(data){
            });
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

