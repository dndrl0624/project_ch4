<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="../../../Style/common/HeadUI.jsp"%> 
<!-- CSS Style Import --> 
<style type="text/css"> 
<%@ include file="/Style/css/CssStyle.css"%>
</style>
<title>Kiosk_login</title>
<style type="text/css">
	#jumbo_Kiosklogin {
		margin-top : 0px;
		padding-top : 10px;
		height : 600px;
		background-image: url('/Style/images/banner/home_banner.png');
	}
</style>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container-fluid" style="text-align: center;">
	<div id="jumbo_Kiosklogin" class="jumbotron">
	</div>
</div>
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>