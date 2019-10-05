<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>00 : 정상작동!! </title>
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<link rel="stylesheet" type="text/css" href="/project_ch4_pojo/Style/css/maxCss.css">
</head>
<body>
<div id="toolbar">
  <div class="form-inline" role="form">
    <div class="form-group">
<!--       <input name="search" class="form-control" type="text" placeholder="Search"> -->
		<select class="form-control" id="search" name="search">
			<option value=1>1</option>	<!-- json data가 문자열이 아니기에 문자가아닌 상수로 설정해야 검색 가능 -->
			<option value="Item 1">Item 1</option>
			<option value="55">55</option>
		</select>
	</div>
    <button id="ok" type="submit" class="btn btn-primary">OK</button>
  </div>
</div>
<table
  id="table"
  data-toggle="table"
  data-height="460"
  data-toolbar="#toolbar"
  data-query-params="queryParams"
  data-url= "https://examples.wenzhixin.net.cn/examples/bootstrap_table/data"
  >
<!--   https://examples.wenzhixin.net.cn/examples/bootstrap_table/data -->
<!-- /project_ch4_pojo/View/Test/bt_tb_search.json -->
<!-- json오로 파일을 넣으면  total값이 다르기때문에? 작동이 안되는 것 같다 
	gson으로 json을 만들 때 이런 형식을 이용?!? 
{ "total": 233,
  "totalNotFiltered": 800,
  "rows": [ {} ] } : json 안의 json? List 넣기
	-->
  <thead>
    <tr>
      <th data-field="id">ID</th>
      <th data-field="name">Item Name</th>
      <th data-field="price">Item Price</th>
    </tr>
  </thead>
</table>

<script>
  var $table = $('#table')
  var $ok = $('#ok')

  $(function() {
    $ok.click(function () {
      $table.bootstrapTable('refresh')
    })
  })

  function queryParams() {
    var params = {}
//     	$('#toolbar').find('input[name]').each(function () {
//         	params[$(this).attr('name')] = $(this).val()
//       	})
    $('#toolbar').find('select[name]').each(function () {
      params[$(this).attr('name')] = $(this).val()
    })
    return params
  }

</script>
</body>
</html>