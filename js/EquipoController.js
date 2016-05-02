// Controloador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_equipo_editar = "";

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

        $("#btnModificar").click(function()
        {
            frm = $("#formEquipo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarEquipos(dataForm,id_equipo_editar).then(function(data){   
            });
        });     

        $("#btnEliminar").click(function()
        {
            frm = $("#formEquipo");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarEquipos(dataForm,id_equipo_editar);
        });     

        $("#buscarEquipo").click(function(){
            idEquipo = $
            numero = $("#buscar").val();
            getEquiposBy("?serial="+numero).then(function(data){
                id_equipo_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formEquipo"
                });
            });
        });            

        //Unidad de Trabajo
        getConfiguracionBy("?tipo=Color").then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#color")
                });
        })     

        //Estado del bien 
        getConfiguracionBy("?tipo=Estado del Bien").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#estado")
                });
        })

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

        getPersonalBy('').then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
            }
            jsonToSelect({        
                 data : data,
                 value : "nombreApellido",
                 alias : "nombreApellido",
                 element : $("#responsable")
                 });
         })   

});

