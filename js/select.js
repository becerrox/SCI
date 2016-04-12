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
    obj.element.html(selectString);
}

function jsonToForm(config){
    for(key in config.data){    
        element = $(config.form+" [name="+key+"]");
        element.val(config.data[key]);    
  }
}

