<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
<style>
	button {
		border: 0px;
		background-color: white;
	}
</style>
<title>방문/반입 - CH4 방문자 관리 시스템</title>
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>
<script type="text/javascript">
	function applyVisitor(){
// 		var param = document.createElement('input');
// 		param.setAttribute('type','hidden');
// 		param.setAttribute('name','pp');
// 		param.setAttribute('value','visitor');
// 		var form = document.createElement('form');
// 		form.appendChild(param);
// 		form.setAttribute('method','POST');
// 		form.setAttribute('action','/visitor/visitPurpose.ch4');
// 		document.body.appendChild(form);
// 		form.submit();
		location.href = "/visitor/visitPurpose.ch4?pp=visitor";
	}
	function applyGoods(){
// 		var param = document.createElement('input');
// 		param.setAttribute('type','hidden');
// 		param.setAttribute('name','pp');
// 		param.setAttribute('value','goods');
// 		var form = document.createElement('form');
// 		form.appendChild(param);
// 		form.setAttribute('method','POST');
// 		form.setAttribute('action','/visitor/visitPurpose.ch4');
// 		document.body.appendChild(form);
// 		form.submit();
		location.href = "/visitor/visitPurpose.ch4?pp=goods";
	}
</script>
<div class="container-fluid">
	<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2" style="text-align:center;">
		<h1><b>방문/반입 선택</b></h1>
		<div class="row" style="padding-top:40px;">
			<div class="col-lg-offset-1 col-lg-5">
				<button onClick="applyVisitor()">
					<img src="../../Style/images/crud/visitor_logo.png" class="img-thumbnail" style="background-color:#E8E8E8;">
				</button>
			</div>
			<div class="col-lg-5">
				<button onClick="applyGoods()">
					<img src="../../Style/images/crud/transport_logo.png" class="img-thumbnail" style="background-color:#E8E8E8;">
				</button>		
			</div>
		</div>
	</div>
</div>
</body>
</html>