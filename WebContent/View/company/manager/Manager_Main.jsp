<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%-- <%@ include file="../../CommonForm/TapLogo.jsp"%> --%>
<!-- 경로 바꿈으로 인한 경로 재설정 -->
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 인터넷 상단 창 아이콘 -->
<link rel="icon" href="../../../Style/images/logo/logo_tap.png" type="image/png"> 
<!-- 경로 바꿈으로 인한 경로 재설정 -->
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="../../../Style/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../../../Style/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../../../Style/demo/demo.css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="../../../Style/js/jquery.easyui.min.js"></script>
<!-- Custom styles for this template -->
<!-- i Tag Font Image -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<!-- CSS Style Import --> 
<!-- CSS Style Import --> 
<style type="text/css"> 
<%@ include file="/Style/css/CssStyle.css"%>
/* 사이드바 설정 */
aside {
    width: 15%;
    height: 80%;
    position: fixed;
    background: #2f323a;
    overflow: auto;
}
/* 사이드바 overflow 시 스크롤바 안보이게 하기 */
aside::-webkit-scrollbar { 
    display: none; 
}
/* 테이블 제목 구간 가운데 정렬 */
th {
	text-align: center;
}

/* 메인 페이지 프레임 구간 설정 */
.mainContent {
	margin:30px 20px 10px 17%;
}

</style>
</head>
<body>		<!-- 경로 바꿈으로 인한 재설정 -->
<%-- <%@ include file="../../CommonForm/Top.jsp"%> --%>
<header class="header">
	<div class="main_menu">
		<nav class="navbar navbar-default navbar-fixed-top" style="padding-top:10px;padding-bottom:10px;">
			<div class="container">
				<!-- 대표 회사 아이콘 및 링크 -->	
				<a id="Main_log" href="/View/Index/Index_Choose.jsp">
					<img src="../../../Style/images/logo/logo_navi2.png" alt="">
				</a>
			</div>
		</nav>
	</div>
</header>

<!-- Side Bar -->
<aside>
	<div class="panel-group" style="margin-top:90px">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse1">방문 신청 조회</a>
				</h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse">
				<div class="panel-body">
					<a  href="#">방문 신청 조회</a><br> 
					<a  href="#">방문현황 조회</a><br> 
				</div>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse2">물품 반입 신청 조회</a>
				</h4>
			</div>
			<div id="collapse2" class="panel-collapse collapse">
				<div class="panel-body">
					<a  href="#">반입 신청 조회</a><br> 
					<a  href="#">반입 현황 조회</a><br> 
				</div>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse3">여분 목록</a>
				</h4>
			</div>
			<div id="collapse3" class="panel-collapse collapse">
				<div class="panel-body">
					<a  href="#">sub0</a><br> 
					<a  href="#">sub1</a><br> 
					<a  href="#">sub2</a><br> 
					<a  href="#">sub3</a><br>
				</div>
			</div>
		</div>
	</div>
</aside>

<!-- Content -->
<div class="mainContent">
	<div class="container">
		<h2>CH4 방문자 관리 시스템</h2>
		<h5>방문자 관리 시스템은 다양한 기관에서 사용하는 방문시스템을 자동화 하는 시스템입니다</h5>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<!-- 사진 바꾸기 =============================== -->
					<img src="../../../Style/images/banner/gate.gif" alt="방문자" style="width: 100%;">
					<div class="carousel-caption">
          				<h3>방문자</h3>
         	 			<p>귀하가 방문할 곳에 미리 방문을 알리세요</p>
        			</div>
				</div>

				<div class="item">
					<img src="../../../Style/images/banner/gate.gif" alt="승인자" style="width: 100%;">
					<div class="carousel-caption">
          				<h3>승인자</h3>
         	 			<p>방문 신청한 이들에게 방문 가능여부를 알리세요</p>
        			</div>
				</div>

				<div class="item">
					<img src="../../../Style/images/banner/gate.gif" alt="인포" style="width: 100%;">
					<div class="carousel-caption">
          				<h3>인포데스크</h3>
         	 			<p>방문한 이들의 출입을 관리하세요</p>
        			</div>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> 
				<span class="sr-only">Previous</span>
			</a> 
			<a class="right carousel-control" href="#myCarousel" data-slide="next"> 
			<span class="glyphicon glyphicon-chevron-right"></span> 
			<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</div>

 
<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
<!-- java script -->
<script type="text/javascript">
</script>
<!-- Bottom Link Import --> 
<%-- <%@ include file="/Style/common/BottomUI.jsp"%> --%>
</body>
</html>