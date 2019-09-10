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
<title>방문/반입 신청 - CH4 방문자 관리 시스템</title>

<style>
	#jumbo_visit {
		margin-top : 0px;
		padding-top : 10px;
		height : 400px;
		background-image: url('../../Style/images/banner/speedGate (2).jpg');
	}
	.panel-heading {
		padding-left: 40px;
		text-align:left;
	}
	#form1 {
		padding-left : 0px;
		padding-right : 0px;
	}
	
</style>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container-fluid" style="text-align:center;">
	<div id="jumbo_visit" class="jumbotron">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div style="text-align:left;">
				<h2>방문/반입 신청 시스템</h2>
			</div>
			<div id="form1" class="col-lg-6">
				<div class="panel panel-primary">
					<div class="panel-heading">1.방문지/목적지 선택</div>
					<div class="panel-body">
						로고+입력폼
					</div>
				</div>
			</div>
			<div id="form1" class="col-lg-6">
				<div class="panel panel-primary">
					<div class="panel-heading">2.신청자</div>
					<div class="panel-body">
						로고+입력폼
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-2"></div>
	</div>
</div>

</body>
</html>