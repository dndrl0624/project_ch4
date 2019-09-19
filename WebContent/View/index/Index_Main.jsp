<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--meta charset tags --> 
<meta charset="utf-8"> 
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<title>메인 페이지</title>
<!-- Head Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
</head>
<body>
	<!-- 미결과제 :  -->
<!-- Top -->	<!-- 선택된 페이지 class : nav-item active // 나머지 페이지: nav-item -->
<header class="header">
	<div class="main_menu">
		<nav class="navbar navbar-default navbar-fixed-top" style="padding-top:20px;"> <!-- 회사 안내 -->	<%-- <%@ include file="/View/CommonForm/Top.jsp"%> --%>
			<!-- 메뉴바 -->	<div class="container">
					<!-- 대표 회사 아이콘 및 링크 -->	<a class="Main_Log" href="Index_Main.jsp"> <img src="../../Style/images/logo/logo_navi.png" alt=""> </a>
			<!-- 메뉴 카테고리 -->
				<ul class="nav navbar-nav navbar-right">
					<li class="nav-item active"><a class="nav-link" href="Index_Main.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="Index_Notice.jsp">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="Index_Story.jsp">개발 스토리</a></li>
					<li class="nav-item submenu dropdown ">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">고객지원</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link" href="Index_QA.jsp">Q&A페이지</a></li>
							<li class="nav-item"><a class="nav-link " href="Index_AskJoin.jsp">가입문의</a></li>
						</ul></li>
					<li class="nav-item submenu dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원가입</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link" href="Join.jsp">회원가입</a></li>
							<li class="nav-item"><a class="nav-link" href="Login.jsp">로그인</a></li>
						</ul></li>
					<li class="nav-item submenu dropdown ">
						<a href="#" class="nav-link dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">방문관리</a>
						<ul class="dropdown-menu">
							<li class="nav-item">
							<a class="nav-link" href="Vist_ApplyVisit.jsp">방문 신청</a></li>
							<li class="nav-item">
							<a class="nav-link" href="Vist_LookupApply.jsp">방문 신청 조회</a></li>
							<li class="nav-item">
							<a class="nav-link" href="Vist_Navigation.jsp">오시는 길</a></li>
				</ul></li></ul>
	</div></nav></div>
</header>

<!-- Banner -->
	<section class="banner_Main">
		<div class="jumbotron_Main">
			<div> <div class="container_Banner_Main" style="color: white;">
					<h1 style="font-size:50px; text-shadow: 4px 2px 2px gray; ">CH4's Visitor Management System</h1>
					<p style="font-size:20px; text-shadow: 2px 2px 2px gray; ">Welcome to our ManageMent system.<br>We'll be providing extra time and new convenience.</p>
					<div class="page_link">
						<a href="Index_Main.jsp" style="font-size:20px;" >Home</a>
		</div></div></div></div> 
	</section>
<!-- Category Area -->
	<section class="content">
		<div>본문 내용</div>
	</section>


<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
<!-- Bottom Link Import --> 
<%@ include file="/Style/common/BottomUI.jsp"%>
</body>
</html>