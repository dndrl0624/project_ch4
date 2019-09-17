<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--meta charset tags --> 
<meta charset="utf-8"> 
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
<!-- CSS Style Import --> 
<style type="text/css"> 
<%@ include file="/Style/css/CssStyle.css"%>
</style>
<title>메인 - CH4 방문자 관리 시스템</title>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
	<!-- 미결과제 : 이동할 페이지 URL 설정 해야함 ( 먼저 각 페이지를 만들어야함 ) // 사진 크기 설정-->
<!-- 방문 유형 선택 옵션 -->	
		<div class="container" style="text-align: center;">
<!-- 글머리 --><div style="display: inline-block;">
				<div class="col-lg-12">
					<h1>방문을 환영합니다</h1>
					<p> 방문 신청, 방문자 승인, 방문자 인증, 방문 시스템 관리 페이지 중  <br>필요한 기능을 선택하여 사용해보세요 </p>
				</div>
			</div>
			
<!-- 페이지 --><div class="row">
				<div class="col-lg-4">
					<a href="/service/visitor.ch4"><!-- 이동할 페이지 URL 설정 해야함 -->
						<img src="../../Style/images/crud/visit_logo.png" class="img-thumbnail">
					</a>
				</div>
				<div class="col-lg-4">
					<a href="/service/company.ch4"><!-- 이동할 페이지 URL 설정 해야함 -->
						<img src="../../Style/images/crud/company_logo.png"  class="img-thumbnail">
					</a>
				</div>
				<div class="col-lg-4">
					<a href="/service/admin/ch4"><!-- 이동할 페이지 URL 설정 해야함 -->
						<img src="../../Style/images/crud/admin_logo.png"  class="img-thumbnail">
					</a>
				</div>
			</div>
		</div>
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>