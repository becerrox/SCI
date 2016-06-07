// Controlador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{


        $("#btnGuardarCatgen").click(function()
        {
            var general = document.getElementById("codigo1").value;

            frm = $("#formCatgen");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.codigo=general+"00-00000";
            registrarCatgen(dataForm).then(function(data){
            });
        });

        $("#btnGuardarSubcat").click(function()
        {
            var primero = document.getElementById("catgen").value;
            var subs = document.getElementById("codigo2").value;
            var res = primero.slice(-12,-8);  
            frm = $("#formSubcat");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.codigo=res+subs+"-00000";
            registrarSubcat(dataForm).then(function(data){
            });          
        });

        $("#btnGuardarCatesp").click(function()
        {
            var segundo = document.getElementById("subcat").value;
            var subst = document.getElementById("codigo3").value;
            var ress = segundo.slice(-12,-6);  
            console.log(ress);
            frm = $("#formCatesp");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.codigo=ress+"-"+subst;
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

