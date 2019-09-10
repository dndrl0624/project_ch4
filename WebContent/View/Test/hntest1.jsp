<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style type="text/css">

	</style>
</head>
<body>
<header class="header">
	<div class="main_menu">
		<nav class="navbar navbar-default navbar-fixed-top" style="padding-top:20px;"> <!-- 회사 안내 -->	<%-- <%@ include file="/View/CommonForm/Top.jsp"%> --%>
			<!-- 메뉴바 -->	
			<div class="container">
					<!-- 대표 회사 아이콘 및 링크 -->	
					<a class="Main_Log" href="Index_Main.jsp"> 
					<img src="../../Style/images/logo/logo_navi.png" alt=""> 
					</a>
			</div>
		</nav>
	</div>
</header>
<section class="about_myself pad_bottom">
	<div class=container>
		<h1>여기</h1>
	</div>
	
</section>	
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>