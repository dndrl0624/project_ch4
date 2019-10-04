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
<title>Insert title here</title>
<style type="text/css">
	.banner_Main {
		margin-top: 0px;
		margin-bottom:50px;
		padding-top: 0px;
		height: 200px;
		background-image: url('../../Style/images/banner/speedGate (1).jpg');
	}

</style>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container">
	<div id='content'>
		<div id='content_area'>
			<div id="sub_menu">
				<ul class="tabs">
				    <li class="tab-link current" data-tab="tab-1">회사소개</li>
				    <li class="tab-link" data-tab="tab-2"  style='border-left: none;'>CEO 인사말</li>
				    <li class="tab-link" data-tab="tab-3"  style='border-left: none;'>연혁</li>
				    <li class="tab-link" data-tab="tab-4"  style='border-left: none;'>오시는 길</li>
				</ul>
				<div id="tab-1" class="tab-content current">
					<img src="../img/sub/s0101.jpg" alt="" style='width: 100%;'>
				</div>
				<div id="tab-2" class="tab-content" style="overflow: hidden;">
					<img src="../img/sub/s0102.jpg" alt="" style='width: 100%;'>
				</div>
				<div id="tab-3" class="tab-content" style="overflow: hidden;">
					<img src="../img/sub/s0103.jpg" alt="" style='width: 100%;'>
				</div>
				<div id="tab-4" class="tab-content" style="overflow: hidden;">
					<img src="../img/sub/s0104.jpg" alt="" style='width: 100%;'>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>