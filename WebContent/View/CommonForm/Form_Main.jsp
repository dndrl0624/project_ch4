<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<!-- Web icon 설정 -->
<%@ include file="../CommonForm/TapLog.jsp"%>
<title>메인 폼을 작성해보자</title>
<!-- Link Import -->
<%@ include file="/Style/common/HeadUI.jsp"%>
<style type="text/css">
.jumbotron{
	height:600px;
	background-image:url('../../Style/images/banner/home_banner.png');
	background-size: 100%;
	position: relative;
}
.container_banner{
	position: absolute;
	top: 50%;
	left: 35%;
	transform: translate( -50%, -50% );
}
ul li {
    list-style:none;
    padding-right:10px;
    float: left;
}
</style>

</head>
<body>
<!-- 미결과제 :  -->


<!-- Top -->
<!-- Header Menu -->
	<div class="main_menu">
		<nav class="navbar navbar-default navbar-fixed-top">
	<!-- 회사 안내 -->
		<%@ include file="/View/CommonForm/Top.jsp"%>
		<!-- 메뉴바 -->
			<div class="container">
				
			<!-- 메뉴 버튼 구성 -->
				<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
					<div class="row ml-0 w-100">
						<div class="col-lg-12 pr-0">
					<!-- 대표 회사 아이콘 및 링크 -->
							<a class="Main_Log" href="Index_Main.jsp"> 
								<img src="../../Style/images/logo/logo_navi.png" alt="">
							</a>
							<ul class="nav navbar-nav center_nav pull-right">
								<li class="nav-item active"><a class="nav-link" href="Index_Main.jsp">Home</a></li>
								
								<li class="nav-item "><a class="nav-link" href="Index_Notice.jsp">공지사항</a></li>
								
								<li class="nav-item "><a class="nav-link" href="Index_Story.jsp">개발 스토리</a></li>
								
								<li class="nav-item submenu dropdown ">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" 
									role="button" aria-haspopup="true" aria-expanded="false">고객지원</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link" href="Index_QA.jsp">Q&A페이지</a></li>
										<li class="nav-item "><a class="nav-link " href="Index_AskJoin.jsp">가입문의</a></li>
									</ul>
								</li>

								<li class="nav-item submenu dropdown"><a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false">회원가입</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link" href="Join.jsp">회원가입</a></li>
										<li class="nav-item"><a class="nav-link" href="Login.jsp">로그인</a></li>
									</ul>
								</li>

								<li class="nav-item submenu dropdown "><a href="#" class="nav-link dropdown-toggle " data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false">방문 관리</a>
									<ul class="dropdown-menu">
										<li class="nav-item active"><a class="nav-link" href="Vist_ApplyVisit.jsp">방문 신청</a></li>
										<li class="nav-item"><a class="nav-link" href="Vist_LookupApply.jsp">방문 신청 조회</a></li>
										<li class="nav-item"><a class="nav-link" href="Vist_Navigation.jsp">오시는 길</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</div>
<!-- Top.jsp 에서 header태그 열고 Menu 끝난 후, 닫음 -->
</header>

<!-- Banner -->
<section class="banner_area">
	<div class="jumbotron">
		<div class="banner_inner d-flex align-items-center">
			<div class="container_banner">
				<h1>점보트론 - 배너</h1>
				<p>이부분에 사진을 넣어보자구</p>
				<div class="page_link">
					<a href="Index_Main.jsp">Home</a> →
					<a href="Index_Notice.jsp">Notice</a>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Category Area -->
<section class="procedure_category section_gap">
	<div>본문 내용</div>
</section>
	

<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>

<!-- Link Import -->
<%@ include file="/Style/common/BottomUI.jsp"%>

</body>

</html>