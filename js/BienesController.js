// Controlador de la vista de registro de Bienes

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{

        $("#btnGuardar").click(function()
        {
        var cat = document.getElementById("categoriaBien").value;
        var num = document.getElementById("bien").value
            frm = $("#formBienes");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.num_bien=cat+"-"+num;
            registrarBienes(dataForm).then(function(data){ 
            });
        });

        $("#btnModificar").click(function()
        {
            frm = $("#formBienes");
            dataForm = getFormData(frm);
            dataForm.status=1;
            dataForm.num_bien=numeros;
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
            if (numero == ""){
                getBienesBy('').then(function(data){
                    jsonToSelect({        
                        data : data,
                        value : "num_bien",
                        alias : "num_bien",
                        element : $("#buscarNumero")
                        });
                });
            }
            else{
                getBienesBy("?num_bien="+numero).then(function(data){
                    id_bien_editar = data[0].id;
                    numeros = data[0].num_bien;
                    jsonToForm({
                        data : data[0],
                        form : "#formBienes"
                    });
                });
            }
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
            jsonToSelect({        
                data : data,
                value : "numero_bien",
                alias : "descripcion",
                element : $("#categoriaBien")
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
        var id_bien_editar = "";

        function cargarNumeroBien(){
            idBien = $
            numeros = $("#buscarNumero").val();
                getBienesBy("?num_bien="+numeros).then(function(data){
                    id_bien_editar = data[0].id;
                    console.log(id_bien_editar);
                    numeros = data[0].num_bien;
                    jsonToForm({
                        data : data[0],
                        form : "#formBienes"
                    });
                });            
        }
