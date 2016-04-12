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

        $("#btnGuardar").click(function()
        {
            frm = $("#formBienes");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarBienes(dataForm);
        });

        /* Cargando datas de la api a los selects  */

        getConfiguracionBy("?tipo=Color").then(function(data){
            //Despuer del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#colores")
                });
        })

        //Estado del bien 
        getConfiguracionBy("?tipo=Estado del Bien").then(function(data){
            //Despuer del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#estado_bien")
                });
        })

        //Categoría de Unidades Administrativas 
        getConfiguracionBy("?tipo=Categoría de Unidades Administrativas").then(function(data){
            //Despuer del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#cat_unid_admin")
                });
        })

        //Estatus de Uso del Bien 
        getConfiguracionBy("?tipo=Estatus de Uso del Bien").then(function(data){
            //Despuer del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#estatus_uso_bien")
                });
        })


        getPersonalBy('').then(function(data){
            
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
            }
            console.log(data)
            jsonToSelect({        
                 data : data,
                 value : "id",
                 alias : "nombreApellido",
                 element : $("#responsable_pa")
                 });
         })              

});

