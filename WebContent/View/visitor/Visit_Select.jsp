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
<!-- CSS Style Import --> 
<style type="text/css"> 
<%@ include file="/Style/css/CssStyle.css"%>
</style>
<title>방문/반입 - CH4 방문자 관리 시스템</title>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container-fluid">
	<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2" style="text-align:center;">
		<h1><b>방문/반입 선택</b></h1>
		<div class="row" style="padding-top:40px;">
			<div class="col-lg-offset-1 col-lg-5">
				<a href="/View/visitor/Visit_ApplyVisitor.jsp"><!-- 이동할 페이지 URL 설정 해야함 -->
					<img src="../../Style/images/crud/visitor_logo.png" class="img-thumbnail" style="background-color:#E8E8E8;">
				</a>
			</div>
			<div class="col-lg-5">
				<a href="/View/Visitor/Visit_ApplyGoods.jsp"><!-- 이동할 페이지 URL 설정 해야함 -->
					<img src="../../Style/images/crud/transport_logo.png" class="img-thumbnail" style="background-color:#E8E8E8;">
				</a>		
			</div>
		</div>
	</div>
</div>
</body>
</html>