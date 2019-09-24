<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>안내관리인 메인 페이지</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<link rel="stylesheet" type="text/css" href="/project_ch4_pojo/Style/css/maxCss.css">
<style>
figure.snip1200 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 220px;
  max-width: 310px;
  max-height: 310px;
  width: 100%;
  background: #000000;
  color: #ffffff;
  text-align: center;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
  font-size: 16px;
}
figure.snip1200 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.45s ease-in-out;
  transition: all 0.45s ease-in-out;
}
figure.snip1200 img {
  max-width: 100%;
  position: relative;
  opacity: 0.9;
}
figure.snip1200 figcaption {
  position: absolute;
  top: 45%;
  left: 7%;
  right: 7%;
  bottom: 45%;
  border: 1px solid white;
  border-width: 1px 1px 0;
}
figure.snip1200 .heading {
  overflow: hidden;
  -webkit-transform: translateY(50%);
  transform: translateY(50%);
  position: absolute;
  bottom: 0;
  width: 100%;
}
figure.snip1200 h2 {
  display: table;
  margin: 0 auto;
  padding: 0 10px;
  position: relative;
  text-align: center;
  width: auto;
  text-transform: uppercase;
  font-weight: 400;
}
figure.snip1200 h2 span {
  font-weight: 800;
}
figure.snip1200 h2:before,
figure.snip1200 h2:after {
  position: absolute;
  display: block;
  width: 1000%;
  height: 1px;
  content: '';
  background: white;
  top: 50%;
}
figure.snip1200 h2:before {
  left: -1000%;
}
figure.snip1200 h2:after {
  right: -1000%;
}
figure.snip1200 p {
  top: 50%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  position: absolute;
  width: 100%;
  padding: 0 20px;
  margin: 0;
  opacity: 0;
  line-height: 1.6em;
  font-size: 0.9em;
}
figure.snip1200 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
  z-index: 1;
}
figure.snip1200:hover img,
figure.snip1200.hover img {
  opacity: 0.25;
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
figure.snip1200:hover figcaption,
figure.snip1200.hover figcaption {
  top: 7%;
  bottom: 7%;
}
figure.snip1200:hover p,
figure.snip1200.hover p {
  opacity: 1;
  -webkit-transition-delay: 0.35s;
  transition-delay: 0.35s;
}
</script>
<script type="text/javascript">
$(".hover").mouseleave(
	    function () {
	      $(this).removeClass("hover");
	    }
	  );
</style>
</head>
<body>

<%@ include file="../../CommonForm/Top.jsp"%>

<!-- Side Bar -->
<aside>
	<div class="panel-group" style="margin-top:90px">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/info/Info_Main.jsp">
					<i class="fa fa-home" aria-hidden="true"></i>메인페이지</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/info/Info_Notice.jsp">
					<i class="fa fa-search-plus" aria-hidden="true"></i>안내 공지</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/info/Info_ManageLog.jsp">
					<i class="fa fa-list-alt" aria-hidden="true"></i>방문자현황관리</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/info/Info_ManageKiosk.jsp">
					<i class="fa fa-search-plus" aria-hidden="true"></i>키오스크 공지</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/info/Info_ManageDesti.jsp">
					<i class="fa fa-list-alt" aria-hidden="true"></i>옥내 목적지 관리</a>
				</h4>
			</div>
		</div>
		
		
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse1">
					<i class="fa fa-users" aria-hidden="true"></i>안내</a>
				</h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse in">
				<div class="panel-body">
					<a  href="/project_ch4_pojo/View/company/info/Info_Notice.jsp">
					<i class="fa fa-search-plus" aria-hidden="true"></i>안내 공지</a><br> 
					<a  href="/project_ch4_pojo/View/company/info/Info_ManageLog.jsp">
					<i class="fa fa-list-alt" aria-hidden="true"></i>방문자현황관리</a><br> 
				</div>
			</div>
		</div>
		
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse2">
					<i class="fa fa-truck" aria-hidden="true"></i>시설관리</a>
				</h4>
			</div>
			<div id="collapse2" class="panel-collapse collapse in">
				<div class="panel-body">
					<a  href="/project_ch4_pojo/View/company/info/Info_ManageKiosk.jsp">
					<i class="fa fa-search-plus" aria-hidden="true"></i>키오스크 관리</a><br> 
					<a  href="/project_ch4_pojo/View/company/info/Info_ManageDesti.jsp">
					<i class="fa fa-list-alt" aria-hidden="true"></i>옥내 목적지 관리</a><br> 
				</div>
			</div>
		</div>
	</div>
</aside>

<!-- Content -->	<!-- https://blackrockdigital.github.io/startbootstrap-freelancer/ -->
	<!-- Masthead -->
  <header style="margin-left:15%;text-align: center;">
    <div class="container d-flex align-items-center flex-column">
	<div style="width: 70%; float: left;">
      <!-- Masthead Heading -->
      <h1>CH4 방문자 관리 시스템</h1>
    </div>
      <%@ include file="../../CommonForm/logout.jsp"%>

      <!-- Masthead Avatar Image -->
      <img src="/project_ch4_pojo/Style/images/crud/manager.jpg" alt="">

    </div>
  </header>

	<!-- 하단 : 3개로 분할 : 신청 / 방문/물류/ 인포 소개 -->

  <!-- Portfolio Section -->
  <section style="margin-left:5%">
    <div class="container">

        <!-- Portfolio Item 1 -->
        <div class="col-md-6 col-lg-3">
			<figure class="snip1200">
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
				<figcaption>
					<p>안쪽 내용 설명이 들어간 부분이지롱</p>
					<div class="heading">
						<h2> <span>안내 공지</span> </h2>
					</div>
				</figcaption>
				<a href="#"></a>
			</figure>
         </div>

        <!-- Portfolio Item 2 -->
       	<div class="col-md-6 col-lg-3">
			<figure class="snip1200">
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
				<figcaption>
					<p>안쪽 내용 설명이 들어간 부분이지롱</p>
					<div class="heading">
						<h2> <span>방문자 현황 관리</span> </h2>
					</div>
				</figcaption>
				<a href="#"></a>
			</figure>
        </div>

        <!-- Portfolio Item 3 -->
        <div class="col-md-6 col-lg-3">
			<figure class="snip1200">
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
				<figcaption>
					<p>안쪽 내용 설명이 들어간 부분이지롱</p>
					<div class="heading">
						<h2> <span>키오스크 관리</span> </h2>
					</div>
				</figcaption>
				<a href="#"></a>
			</figure>
          </div>
          
           <!-- Portfolio Item 4 -->
        <div class="col-md-6 col-lg-3">
			<figure class="snip1200">
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
				<figcaption>
					<p>안쪽 내용 설명이 들어간 부분이지롱</p>
					<div class="heading">
						<h2> <span>옥내 목적지 관리</span> </h2>
					</div>
				</figcaption>
				<a href="#"></a>
			</figure>
          </div>
          
        </div>
  </section>
  
 
<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
<!-- java script -->
<script type="text/javascript">
</script>
</body>
</html>