<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<link rel="stylesheet" type="text/css" href="/project_ch4_pojo/Style/css/maxCss.css">
<meta charset="UTF-8">
<title>customSearch2</title>
</head>
<body>

<select class="form-control" id="combo">
	<option value="id">id</option>
	<option value="price">price</option>
	<option value="name">name</option>
</select>

<table
  id="table"
  data-search="true"
  data-custom-search="customSearch"
  data-url="/project_ch4_pojo/View/Test/bt_tb_search.json">
  <thead>
    <tr>
      <th data-field="idz">ID</th>
      <th data-field="name">Item Name</th>
      <th data-field="price">Item Price</th>
    </tr>
  </thead>
</table>

<script>
var sel ="id";
$(document).ready(function(){
	$("#combo").combobox({
		onChange:function(newValue){
			sel = newValue;
			//alert(sel);
		}
	});
});

  $(function() {
    $('#table').bootstrapTable({
      formatSearch: function () {
        return 'Search '+sel
      }
    })
  })

  function customSearch(data, text) {
    return data.filter(function (row) {
    	if(sel=="price"){
    		return row.price.indexOf(text) > -1
    	}
    	else if(sel=="name"){
    		return row.name.indexOf(text) > -1
    	}
    	else if(sel=="idz"){
      		return row.idz.indexOf(String) > -1
  		}
    })
  }
</script>


</body>
</html>


