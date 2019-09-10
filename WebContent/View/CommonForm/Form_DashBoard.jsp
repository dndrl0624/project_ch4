<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--meta charset tags --> 
<meta charset="utf-8"> 
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<title>컨텐츠 폼을 작성해보자</title>
<!-- Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
<!-- CSS Style Import --> 
<style type="text/css"> 
<%@ include file="/Style/css/CssStyle.css"%>
</style>
</head>
<body>
	<!-- 미결과제 :  -->
<!-- Top -->	<!-- 선택된 페이지 class : nav-item active // 나머지 페이지: nav-item -->
<!-- <header class="header">
	<div class="main_menu">
			메뉴바	<div class="container">
					대표 회사 아이콘 및 링크	<a class="Main_Log" href="Index_Main.jsp"> <img src="../../Style/images/logo/logo_navi.png" alt=""> </a> </div>

 -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
  </div>
</nav>

 <div class="container-fluid">
      <div class="col">
        <div class="col-sm-2 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
        </div>
	</div>
</div>
  
<div class="container">
  <h3>Inverted Navbar</h3>
  <p>An inverted navbar is black instead of gray.</p>
</div>

</body>
</html>
<%-- 
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
<!-- Category Area -->
	<section class="content">
		<div>본문 내용</div>
	</section>


<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
<!-- Bottom Link Import --> 
<%@ include file="/Style/common/BottomUI.jsp"%>
 --%>