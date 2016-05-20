function jsonToSelect(obj)
{
    var selectString="";
    selectString = '<option selected disabled>Seleccione</option>' + '<option value="No aplica">No aplica</option>';
    // selectString = ;
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
      for (var i in config.data[key]){
            element.val(config.data[key]);    
            config.data.length;     
      }  
}

function jsonToTable(config){
    tableHeaders = "<thead><tr>";
    tableContent = "<tbody>";
    if(config.showCount)
if(config.headers.indexOf("Item")==-1)
    config.headers.unshift("Item");
  for(key in config.headers){     
      tableHeaders += "<th>"+config.headers[key]+"</th>";
  }
  for(var index=0;index<config.limit;index++)
  {
      tableContent += "<tr>";
      if(config.showCount)
        tableContent+="<td>"+(index+1)+"</td>";
    for (var i in config.data[index]){
            if(config.invisibleFields.indexOf(i)==-1)
              tableContent += "<td>"+config.data[index][i]+"</td>";      
    }  
          tableContent += "</tr>";
}
    tableHeaders += "</tr></thead>";
    tableContent += "</tr>";
    content = tableHeaders + tableContent;
    $(config.table).html(content)
}

function capitalize(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

function jsonToTableTraspuesto(config){
    tableHeaders = "<thead><tr>";
  for(key in config.headers){     
      tableHeaders += "<th>"+config.headers[key]+"</th>";
    }
    tableHeaders += "</tr>";
    tableContent = "<tbody>";
    for(key in config.data){
      for(attr in config.data[key])
      if(config.invisibleFields.indexOf(attr)==-1)
        tableContent+='<tr> <th>'+capitalize(attr)+'</th><td>'+config.data[key][attr]+'</td></tr>'
    }
     tableContent+="</tbody>";
    content = tableHeaders+tableContent;
    $(config.table).html(content)
}
