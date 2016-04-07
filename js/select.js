function mostrarConfiguracion(data)
{
    $.ajax({
            type:"GET",
            processData: false,
            contentType: 'application/json',
            url:'api/configuracion',
            data:JSON.stringify(data),
            success:function(response){
                alert("Registrado");
            },error:function(response){
                alert("Error");
            }
        });
}


function jsonToSelect(obj)
{
    var selectString="";
    for(var i=0; i<obj.data.length;i++){
        selectString += '<option value="'+obj.data[i][obj.value]+'">'+obj.data[i][obj.alias]+'</option>';
    }
}

dataPrueba =  [{id:"1", name:"elemento1"};
        
jsonToSelect({        
        data : dataPrueba,
        value : "id",
        alias : "name",
        element : $("#colores")
        });
