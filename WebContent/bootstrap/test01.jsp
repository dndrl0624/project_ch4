<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/BootstrapCommon.jsp" %>
<style>
	.datepicker{
		pointer-event:none;
	}
	label.calendar-icon{
		position:absolute;
		display:inline-block;
		top:7px;
		right:10px;
		width:30px;
		height:25px;
		border:none;
		background: url("../images/calendar_icon.png");
		background-size: 23px 23px;
		cursor: pointer;
	}
</style>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function (){
		$('#visitDate').datepicker({
			format: "yyyy-mm-dd(D)",
			calenderWeeks: "false",
			autoclose: "true",
			language: "kr"
		}).on('changeDate',function(e){
			
		});
		$(".calendar-icon").click(function(){
			var target = $(this).attr("target");
			$("#"+target).datepicker.focus();
		});
	});
</script>

<div class="container">
	<input type="text" id="visitDate" name="visitDate" class="form-control datePicker" readonly>
		<label class="calendar-icon" target="visitDate"></label>
	</input>
</div>  
</body>
</html>