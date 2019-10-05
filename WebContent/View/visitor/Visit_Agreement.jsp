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
<title>약관동의 - CH4 방문자 관리 시스템</title>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container-fluid">
	<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
		<h3><b>방문/반입 약관</b></h3><br>
		<div class="checkbox" style="border:0px; margin-bottom:10px;">
			<label>
				<input type="checkbox" value="agree"><b style="font-size:16px;">방문/반입 약관 동의</b>
			</label>
		</div>
		<div style="height:120px;border:1px solid #ACACAC;">
		</div><br>
		<div class="checkbox" style="border:0px; margin-bottom:10px;">
			<label>
				<input type="checkbox" value="agree"><b style="font-size:16px;">개인정보 수집 및 이용 동의</b>
			</label>
		</div>
		<div style="height:120px;border:1px solid #ACACAC;">
		</div><br>
		<div class="checkbox" style="border:0px; margin-bottom:10px;">
			<label>
				<input type="checkbox" value="agree"><b style="font-size:16px;">개인정보 제3자 제공에 대한 동의</b>
			</label>
		</div>
		<div style="height:120px;border:1px solid #ACACAC;">
		</div><br>
		<div class="checkbox" style="border:0px; margin-bottom:10px;">
			<label>
				<input type="checkbox" value="agree"><b style="font-size:16px;">규정준수 이행 동의</b>
			</label>
		</div>
		<div style="height:120px;border:1px solid #ACACAC;">
		</div><br>
		<div style="height:70px;background:#DEDEDE;text-align:center; padding-top:25px;">
			<label>
				<input type="checkbox" value="agree"><b style="font-size:16px;">위 약관에 전체 동의합니다.</b>
			</label>
		</div><br>
		<div style="text-align:center;">
			<button class="btn btn-primary" onclick="location.href='/View/Visitor/Visit_Select.jsp'">동의합니다.</button>
			<button class="btn" onclick="location.href='/View/Visitor/Visit_Main.jsp'">동의하지 않습니다.</button>
		</div>
	</div>
</div>
</body>
</html>