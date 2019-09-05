<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/BootstrapCommon.jsp" %>
<script type="text/javascript">
	var inputnum = 1;
</script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn1").on('click',function(e){
			inputnum = inputnum + 1;
			var tag = "<div id='form"+inputnum+"' class='form-group'>"
					+"<label for='usr"+inputnum+"'>Name:</label>"
					+"<input type='text' class='form-control' id='usr"+inputnum+"'></div>";
			$("#form"+(inputnum-1)).after(tag);
		});
		$("#btn2").on('click',function(e){
			if(inputnum>1){
				$("#form"+inputnum).remove();
				inputnum = inputnum - 1;
			}
		})
	});
</script>
<button id="btn1" type="button" class="btn">추가</button>
<button id="btn2" type="button" class="btn">삭제</button>
<div id="form1" class="form-group">
  <label for="usr1">Name:</label>
  <input type="text" class="form-control" id="usr1">
</div>
</body>
</html>