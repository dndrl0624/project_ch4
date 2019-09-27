<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<link rel="stylesheet" type="text/css" href="/project_ch4_pojo/Style/css/maxCss.css">
<meta charset="UTF-8">
<title>customAll</title>
</head>
<body>

<script>
//콤보상자 받아올 변수
var sel = "id";
//검색창 placeholder
  $(function() {
    $('#table').bootstrapTable({
      formatSearch: function () {
    	  //alert(sel);
        return 'Search '+sel
      }
    })
  })
//검색기능
  function customSearch(data, text) {
	    return data.filter(function (row) {
	    	if(sel=="id")
	      		return row.id.indexOf(text) > -1
	      	else if(sel=="name")
	      		return row.name.indexOf(text) > -1
	      	else if(sel=="price")
	      		return row.price.indexOf(text) > -1
	    })
	  }
//콤보상자 값 변경
	$(document).ready(function(){
		$("#cate").combobox({
			onChange:function(newValue){
				sel = newValue;
			}
		});
	});
</script>

<select class="form-control" id="cate">
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
      <th data-field="id">ID</th>
      <th data-field="name">Item Name</th>
      <th data-field="price">Item Price</th>
    </tr>
  </thead>
</table>


</body>
</html>