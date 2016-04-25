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


function jsonToTable(config){
    tableHeaders = "<thead><tr>";
        tableContent = "<tbody>";
    for(key in config.headers){     
      tableHeaders += "<th>"+config.headers[key]+"</th>";
      tableContent += "<tr>";
      for (var i in config.data[key]){
            tableContent += "<td>"+config.data[key][i]+"</td>";      
      }
    }
    tableHeaders += "</tr></thead>";
    tableContent += "</tr>";
    content = tableHeaders + tableContent;
    $(config.table).html(content)
}

/*headers = ["ID","NOMBRE","CAMPO"];
                        
data = [
{id: 1,nombre : "prueba", campo : "campo"},
{id: 1,nombre : "prueba", campo : "campo"},
{id: 1,nombre : "prueba", campo : "campo"}
];

jsonToTable(
  {
     data : data,
   headers : headers,
   table : $("#tableTest")
  }
);

*/