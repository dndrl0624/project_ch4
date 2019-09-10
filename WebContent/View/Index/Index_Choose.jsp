<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--meta charset tags --> 
<meta charset="utf-8"> 
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<title>메인 폼을 작성해보자</title>
<!-- Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
<!-- CSS Style Import --> 
<style type="text/css"> 
<%@ include file="/Style/css/CssStyle.css"%>
</style>
</head>
<body>
	<!-- 미결과제 : 이동할 페이지 URL 설정 해야함 ( 먼저 각 페이지를 만들어야함 ) // 사진 크기 설정-->
<!-- 방문 유형 선택 옵션 -->	
	<section class="guestType">
		<div class="container" style="text-align: center;">
<!-- 글머리 --><div style="display: inline-block;">
				<div class="col-lg-12">
					<h1>방문을 환영합니다</h1>
					<p> 방문 신청, 방문자 승인, 방문자 인증, 방문 시스템 관리 페이지 중  <br>필요한 기능을 선택하여 사용해보세요 </p>
				</div>
			</div>
			
<!-- 페이지 --><div class="row">
				<div class="col-lg-6">
					<div class="categories">
						<img src="../../Style/images/crud/visitor.jpg">
						<div class="categories_details">
							<div class="categories_text">
								<div class="border_line"></div>
								<a href="#"><!-- 이동할 페이지 URL 설정 해야함 -->
									<h5>방문 신청</h5>
								</a>
								<div class="border_line"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="categories">
						<img src="../../Style/images/crud/manager.jpg" alt="">
						<div class="categories_details">
							<div class="categories_text">
								<div class="border_line"></div>
								<a href="#"><!-- 이동할 페이지 URL 설정 해야함 -->
									<h5>방문자 승인</h5>
								</a>
								<div class="border_line"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="margin-top:10px">
				<div class="col-lg-6">
					<div class="categories">
						<img src="../../Style/images/crud/info.jpg" alt="">
						<div class="categories_details">
							<div class="categories_text">
								<div class="border_block"></div>
								<a href="#"><!-- 이동할 페이지 URL 설정 해야함 -->
									<h5>방문자 신원 인증</h5>
								</a>
								<div class="border_line"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="categories">
						<img src="../../Style/images/crud/admin.png" alt="">
						<div class="categories_details">
							<div class="categories_text">
								<div class="border_block"></div>
								<a href="#"><!-- 이동할 페이지 URL 설정 해야함 -->
									<h5>시스템 관리</h5>
								</a>
								<div class="border_line"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
</body>
</html>