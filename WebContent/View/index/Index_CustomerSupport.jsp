<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8"> 
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<title>고객지원 페이지</title>
<!-- Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
</head>
<body>
	<!-- 미결과제 : 사진선택 디자인을 다시해야한다 -->
<!-- Top -->	<!-- 선택된 페이지 class : nav-item active // 나머지 페이지: nav-item -->
<header class="header">
	<div class="main_menu">
		<nav class="navbar navbar-default navbar-fixed-top" style="padding-top:20px;"> <!-- 회사 안내 -->	<%-- <%@ include file="/View/CommonForm/Top.jsp"%> --%>
			<!-- 메뉴바 -->	<div class="container">
					<!-- 대표 회사 아이콘 및 링크 -->	<a class="Main_Log" href="Index_Main.jsp"> <img src="../../Style/images/logo/logo_navi.png" alt=""> </a>
			<!-- 메뉴 카테고리 -->
				<ul class="nav navbar-nav navbar-right">
					<li class="nav-item"><a class="nav-link" href="Index_Main.jsp">Home</a></li>
					<li class="nav-item "><a class="nav-link" href="Index_Notice.jsp">공지사항</a></li>
					<li class="nav-item "><a class="nav-link" href="Index_Story.jsp">개발 스토리</a></li>
					<li class="nav-item submenu dropdown ">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">고객지원</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link" href="Index_QA.jsp">Q&A페이지</a></li>
							<li class="nav-item "><a class="nav-link " href="Index_AskJoin.jsp">가입문의</a></li>
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
				</ul></li></ul>
	</div></nav></div>
</header>

<!-- Banner -->
	<section class="banner_Content">
		<div class="jumbotron_Content">
			<div> <div class="container_Banner_Content" style="color: white;">
					<h1 style="font-size:50px; text-shadow: 4px 2px 2px gray;">점보트론 - 배너</h1><br>
					<p style="font-size:20px; text-shadow: 2px 2px 2px gray; ">이부분에 사진을 넣어보자구</p>
					<div class="page_link">
						<a href="Index_Main.jsp">Home</a> → <a href="Index_Notice.jsp">Notice</a>
		</div></div></div></div> 
	</section>
	
<!-- 고객지원 내용 -->
	<section class="about_myself pad_bottom" style="margin-bottom:20px">
	<br><br><br>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 pr-0">
					<div class="about_img">
						<img class="img-fluid w-100" src="../../Style/images/about-me.jpg" alt="">
					</div>
				</div>

				<div class="col-lg-6 pl-0" style="margin-top:20px">
					<div class="about_box">
						<div class="section-title-wrap text-left">
							<h1 style="margin-bottom:30px">About Ourself</h1>
							<p>
								우리 CH4에서는 당 기관들에 방문하는 방문자들을 체계화된 <br>
								시스템으로 관리할 수 있는 플랫폼을 구성하여 제공합니다. <br>
								다양한 기관들이 있는 만큼 우리는 다양한 옵션을 제공합니다.
							</p>
						</div>

						<div class="activity">
							<div class="row">
								<div class="col-lg-6 col-md-6">
									<div class="activity_box">
										<div>
											<i class="fas fa-user-friends"></i>
										</div>
										<h3><span class="counter">2.5</span> M명</h3>
										<p>이용 고객 현황</p>
									</div>
								</div>

								<div class="col-lg-6 col-md-6">
									<div class="activity_box">
										<div>
											<i class="lnr far fa-building"></i>
										</div>
										<h3 class="counter">1465</h3>
										<p>이용 기관 현황</p>
									</div>
								</div>
								<div class="col-lg-6 col-md-6">
									<div class="activity_box">
										<div>
											<i class="far fa-handshake"></i>
										</div>
										<h3 class="counter">3965</h3>
										<p>관련 기관 현황</p>
									</div>
								</div>
								<div class="col-lg-6 col-md-6">
									<div class="activity_box">
										<div>
											<i class="lnr lnr-users"></i>
										</div>
										<h3 class="counter">7145</h3>
										<p>기관 부서 현황</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
<!-- Bottom Link Import --> 
<%@ include file="/Style/common/BottomUI.jsp"%>
</body>
</html>
