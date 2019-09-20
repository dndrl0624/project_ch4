<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>관리자 메인 페이지</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<link rel="stylesheet" type="text/css" href="/project_ch4_pojo/Style/css/maxCss.css">
</head>
<body>
<%@ include file="../../CommonForm/Top.jsp"%>

<!-- Side Bar -->
<aside>
	<div class="panel-group" style="margin-top:90px">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/manager/Manager_Main.jsp">
					<i class="fa fa-home" aria-hidden="true"></i>메인페이지</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse1">
					<i class="fa fa-users" aria-hidden="true"></i>방문 신청 조회</a>
				</h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse">
				<div class="panel-body">
					<a  href="/project_ch4_pojo/View/company/manager/Manager_SearchVisitor.jsp">
					<i class="fa fa-search-plus" aria-hidden="true"></i>방문 신청 조회</a><br> 
					<a  href="/project_ch4_pojo/View/company/manager/Manager_LogVisitor.jsp">
					<i class="fa fa-list-alt" aria-hidden="true"></i>방문현황 조회</a><br> 
				</div>
			</div>
		</div>
		
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse2">
					<i class="fa fa-truck" aria-hidden="true"></i>물품 반입 신청 조회</a>
				</h4>
			</div>
			<div id="collapse2" class="panel-collapse collapse">
				<div class="panel-body">
					<a  href="/project_ch4_pojo/View/company/manager/Manager_SearchGoods.jsp">
					<i class="fa fa-search-plus" aria-hidden="true"></i>반입 신청 조회</a><br> 
					<a  href="/project_ch4_pojo/View/company/manager/Manager_LogGoods.jsp">
					<i class="fa fa-list-alt" aria-hidden="true"></i>반입 현황 조회</a><br> 
				</div>
			</div>
		</div>
		<!-- 
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse3">안내데스크</a>
				</h4>
			</div>
			<div id="collapse3" class="panel-collapse collapse">
				<div class="panel-body">
					<a  href="/project_ch4_pojo/View/company/info/Info_Main.jsp">안내데스크 메인</a><br> 
					<a  href="/project_ch4_pojo/View/company/info/Info_Notice.jsp">안내데스크 공지</a><br> 
					<a  href="/project_ch4_pojo/View/company/info/Info_ManageLog.jsp">방문자 현황 관리</a><br> 
				</div>
			</div>
		</div>
		-->
	</div>
</aside>

<!-- Content -->
<div class="mainContent">
	<div class="container">
	<!-- 상단 : 점보트론 : 사진 + 방문/반입 시스템 소개 -->
	
	<!-- 하단 : 4개로 분할 :신청 / 방문/물류/ 인포 소개 -->
	
	<div style="width: 50%; float: left;">
		<h2>CH4 방문자 관리 시스템</h2>
		<h5>방문자 관리 시스템은 다양한 기관에서 사용하는 방문시스템을 자동화 하는 시스템입니다</h5>
	</div>
	<%@ include file="../../CommonForm/logout.jsp"%>
	</div>
	<div class="container">
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
					<img src="../../../Style/images/banner/gate.gif" alt="visitor" style="width: 100%;">
					<div class="carousel-caption">
          				<h3>방문자</h3>
         	 			<p>	방문 전에 미리 인터넷으로 방문신청이 가능한 방문자 관리시스템을 이용하세요.<br>
         	 				담당자가 PC 또는 모바일로 승인했다면 시간약속 역시 되어 있는 거지요. <br>
         	 				방문 장소 입구에서 키오스크를 통해 빠르게 방문하세요.
						</p>
        			</div>
				</div>

				<div class="item">
					<img src="../../../Style/images/banner/gate.gif" alt="manager" style="width: 100%;">
					<div class="carousel-caption">
          				<h3>승인자</h3>
         	 			<p>	방문을 원하는 인원을 체계적으로 관리해 보세요.<br>
         	 				방문자 관리시스템을 통하여 귀사의 보안관리와<br>
         	 				응급상황에 대비할 수 있습니다</p>
        			</div>
				</div>

				<div class="item">
					<img src="../../../Style/images/banner/gate.gif" alt="info" style="width: 100%;">
					<div class="carousel-caption">
          				<h3>인포데스크</h3>
         	 			<p>	방문한 이들의 출입을 관리하세요
         	 				방문자 관리시스템에서 제공하는 키오스크를<br>
         	 				이용하여 귀사의 업무효율성을 늘려보세요.</p>
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
</body>
</html>