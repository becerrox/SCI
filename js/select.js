function jsonToSelect(obj)
{
    var selectString="";
    selectString = '<option selected disabled>Seleccione</option>';
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

function jsonToTable(config){
    tableHeaders = "<thead><tr>";
    tableContent = "<tbody>";
  for(key in config.headers){     
      tableHeaders += "<th>"+config.headers[key]+"</th>";
      tableContent += "<tr>";
      for (var i in config.data[key]){
          if(config.invisibleFields.indexOf(i)==-1)
            tableContent += "<td>"+config.data[key][i]+"</td>"; 
            config.data.length;     
      }
    }
    tableHeaders += "</tr></thead>";
    tableContent += "</tr>";
    content = tableHeaders + tableContent;
    $(config.table).html(content)
    console.log(config.data.length);
}
