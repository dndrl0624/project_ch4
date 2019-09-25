<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2</title>
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<link rel="stylesheet" type="text/css" href="/project_ch4_pojo/Style/css/maxCss.css">
</head>
<body>
<script type="text/javascript">
//combobox 직접입력 방지
$.fn.combobox.defaults.editable = false
/* 테이블 데이터 */
$(document).ready(function(){
	$("#bt_table").bootstrapTable({
		height:'460'
		,toolbar:'#toolbar'
		,showRefresh:'true'
		,showToggle:'true'
		,showColumns:'true'
		,queryParams:'queryParams'
		,responseHandler:'responseHandler'
		,url:'/project_ch4_pojo/View/Test/bt_tb_search.json'
		,pagination:'true'
	    ,onClickRow:function(row,$element,field){
	       //$element.attr('data-index',10)
	       $element.toggleClass('single-select');//로우 클릭했을 때 색 변함.
	       //alert("mkm");
	     }
	    ,onDblClickRow:function(row,$element,field){
	       alert("상세조회 모달");
	     }
	});
});
var $table = $('#bt_table')
var $ok = $('#ok')

$(function() {
  $ok.click(function () {
    $table.bootstrapTable('refresh')
  })
})

function queryParams() {
  var params = {}
   $('#toolbar').find('input[name]').each(function () {
     params[$(this).attr('name')] = $(this).val()
   })
  $('#toolbar').find('select[name]').each(function () {
    params[$(this).attr('name')] = $(this).val()
  })
  return params
}

function responseHandler(res) {
  return res.rows
}
</script>

<div id="toolbar">
  <div class="form-inline" role="form">
    <div class="form-group">
      <span>Offset: </span>
      <input name="offset" class="form-control w70" type="number" value="0">
    </div>
    <div class="form-group">
      <span>Limit: </span>
      <input name="limit" class="form-control w70" type="number" value="10">
    </div>
    <div class="form-group">
      <input name="search" class="form-control" type="text" placeholder="Search">
    </div>
    <div class="form-group">
      <select class="form-control" name="search" style="width:100%;">
			<option value="Item" selected>Item</option>
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="56">56</option>
		</select>
    </div>
    <button id="ok" type="submit" class="btn btn-primary">OK</button>
  </div>
</div>

<table
  class="table table-bordered table-hover"
  id="bt_table"
  >
  <thead>
    <tr>
      <th data-field="id">ID</th>
      <th data-field="name">Item Name</th>
      <th data-field="price">Item Price</th>
    </tr>
  </thead>
</table>

<script>

</script>
</body>
</html>