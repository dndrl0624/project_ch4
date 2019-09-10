<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<title>사이드 네비게이션바</title>
<!-- Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
<!-- CSS Style Import --> 
<style type="text/css"> 
<%@ include file="/Style/css/SideNav.css"%>
<%@ include file="/Style/css/CssStyle.css"%>
</style>
</head>
<body>
	<!-- 미결과제 :  -->
<!-- Top -->	<!-- 선택된 페이지 class : nav-item active // 나머지 페이지: nav-item -->
<header class="header">
	<div class="main_menu">
			<!-- 메뉴바 -->	<div class="container">
					<!-- 대표 회사 아이콘 및 링크 -->	<a class="Main_Log" href="Index_Main.jsp"> <img src="../../Style/images/logo/logo_navi.png" alt=""> </a> </div>
</div></header>
<!-- 네비게이션바 -->
	<div id="mysidenav" class="sidenav">
		<a href="#" class="closebtn" onclick='closeNav()'>x</a> 
		<a href="#">공지사항</a>
		<a href="#">메뉴1</a> 
		<a href="#">메뉴2</a> 
		<a href="#">메뉴3</a>
		<a href="#">메뉴4</a>
	</div>

	<span class="openmenu" onclick='openNav()'><i class="fa fa-angle-double-left fa-5" aria-hidden="true"></i> open</span>

	<script>
		function openNav() {
			document.getElementById('mysidenav').style.width = '250px';
		}
		function closeNav() {
			document.getElementById('mysidenav').style.width = '0';
		}
	</script>
</body>
</html>