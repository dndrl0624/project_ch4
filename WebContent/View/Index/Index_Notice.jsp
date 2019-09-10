<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8"> 
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<title>고객지원 페이지</title>
<!-- Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
<!-- CSS Style Import --> 
<style type="text/css"> 
<%@ include file="/Style/css/CssStyle.css"%>
</style>
</head>
<body>
	<!-- 미결과제 : 사진선택 디자인을 다시해야한다 게시판 형식 작성 -->
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
	

<!-- 공지사항 게시판 -->
<div align="center">
	<table border=1>
		<!-- 테이블 상단  -->
		<colgroup>
			<col width="50" />
			<col width="450" />
			<col width="100" />
			<col widht="100" />
			<col width="50" />
		</colgroup>
		<!-- 게시글 구분 -->
		<thead>
			<tr>
				<th>no</th>
				<th>title</th>
				<th>date</th>
				<th>writer</th>
				<th>count</th>
			</tr>
		</thead>

		<!-- 게시글 내용 -->
		<tbody>
			<tr>
				<td class="tdNo">001</td>
				<td class="tdTitle"><a href="">CH4 결성</a></td>
				<td class="tdDate">2019.08.21</td>
				<td class="tdName">Max</td>
				<td class="tdCount">821</td>
			</tr>
		</tbody>

		<!-- 페이지 이동 부분 -->
		<tfoot>
			<tr>
				<td colspan="5" class="tdFoot">[prev] <a href=""> 1</a> <a
					href=""> 2</a> <b>3</b> <a href=""> 4</a> <a href=""> 5</a> [next]
				
			</tr>
		</tfoot>
	</table>
</div>

<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
<!-- Bottom Link Import --> 
<%@ include file="/Style/common/BottomUI.jsp"%>
</body>
</html>
