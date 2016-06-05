// Controlador de la vista de registro de Bienes

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{
        var id_bien_editar = "";

        $("#btnGuardar").click(function()
        {
            frm = $("#formBienes");
            dataForm = getFormData(frm);
            dataForm.status=1;
            registrarBienes(dataForm).then(function(data){ 
            });  
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formBienes");
            dataForm = getFormData(frm);
            dataForm.status=1;
            modificarBien(dataForm,id_bien_editar);
        });

        $("#btnEliminar").click(function()
        {
            frm = $("#formBienes");
            dataForm = getFormData(frm);
            dataForm.status=1;
            eliminarBien(dataForm,id_bien_editar);
        });

        $("#buscarBien").click(function(){
            idBien = $
            numero = $("#buscar").val();
            getBienesBy("?serial="+numero).then(function(data){
                id_bien_editar = data[0].id;
                jsonToForm({
                    data : data[0],
                    form : "#formBienes"
                });
            });
        }); 

        /* Cargando datas de la api a los selects  */

        getConfiguracionBy("?tipo=COLOR&status=1").then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#colores")
                });
        })

        //Estado del bien 
        getConfiguracionBy("?tipo=ESTADO DEL BIEN&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#estado_bien")
                });
        })

        //Categoría de Unidades Administrativas 
        getUnidadAdministrativaBy("?status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "id",
                alias : "descripcion",
                element : $("#cat_unid_admin")
                });
        })

        //Estatus de Uso del Bien 
        getConfiguracionBy("?tipo=ESTATUS DE USO DEL BIEN&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#estatus_uso_bien")
                });
        })

        //Tipo de Componente 
        getConfiguracionBy("?tipo=TIPO DE COMPONENTE&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#tipo_comp")
                });
        })

        //Unidad de Trabajo
        getUnidadTrabajoBy("?status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#unidad_trabajo")
                });
        })        

        //Descripción
        getConfiguracionEquipoBy("?tipo=DESCRIPCIÓN&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#descripcion")
                });
        })    

        //Marca
        getConfiguracionEquipoBy("?tipo=MARCA&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#marca")
                });
        }) 

        //Modelo
        getConfiguracionEquipoBy("?tipo=MODELO&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#modelo")
                });
        }) 

        //número de bien
        getNumeroBienBy("?status=1").then(function(data){
        var contador = data;
        console.log(data.length);
            jsonToSelect({        
                data : data,
                value : "numero_bien",
                alias : "descripcion",
                element : $("#num_bien")
                });
        })     

        //Descripción
        getConfiguracionAdminBy("?tipo=SEDE&status=1").then(function(data){
            jsonToSelect({        
                data : data,
                value : "descripcion",
                alias : "descripcion",
                element : $("#sede")
                });
        })   

        getResponsablesBy("?status=1").then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
            }
            jsonToSelect({        
                 data : data,
                 value : "nombreApellido",
                 alias : "nombreApellido",
                 element : $("#responsable_pa")
                 });
         })              

        getResponsablesBy("?status=1").then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
            }
            jsonToSelect({        
                 data : data,
                 value : "nombreApellido",
                 alias : "nombreApellido",
                 element : $("#responsable_ad")
                 });
         })  

        getResponsablesBy("?status=1").then(function(data){
            for(personal in data){
                data[personal].nombreApellido = data[personal].nombres + " "+data[personal].apellidos;
            }
            jsonToSelect({        
                 data : data,
                 value : "nombreApellido",
                 alias : "nombreApellido",
                 element : $("#responsable_uso")
                 });
         })          

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

        getCatespBy("?status=1").then(function(data){
            //Despues del retorno del promise, se cargan en el select con jsonToSelect
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#catesp")
                });
        })                        
});

