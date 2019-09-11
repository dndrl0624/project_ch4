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
	<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
		<div class="row" style="padding-top:100px;">
			<div class="col-lg-offset-1 col-lg-4">
				<a href="/View/Visitor/Visit_Main.jsp"><!-- 이동할 페이지 URL 설정 해야함 -->
					<img src="../../Style/images/crud/visit_logo.png" class="img-thumbnail">
				</a>
			</div>
			<div class="col-lg-4 col-lg-offset-2">
				<a href="/View/Visitor/Visit_Main.jsp"><!-- 이동할 페이지 URL 설정 해야함 -->
					<img src="../../Style/images/crud/visit_logo.png" class="img-thumbnail">
				</a>		
			</div>
		</div>
	</div>
</div>
</body>
</html>