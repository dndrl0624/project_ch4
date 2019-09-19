<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--meta charset tags --> 
<meta charset="utf-8"> 
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<title>11 좌측 네비게이션바 넣은 페이지 11</title>
<!-- Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
<!-- CSS Style Import --> 
<style type="text/css"> 
/*sidebar navigation*/
/* 사이드바 크기 지정 */ 
#sidebar {
    width: 10%;
    height: 100%;
    position: fixed;
    background: #2f323a;
}
/* 반응형 크기 지정 */
#sidebar ul li {
    position: relative;
}
/* 인라인 속성 설정 */
.nav-collapse.collapse {
    display: inline;
}
/* 마진 설정 */
ul.sidebar-menu , ul.sidebar-menu li ul.sub{
    margin: -2px 0 0;
    padding: 0;
}
ul.sidebar-menu {
    margin-top: 75px;
}
/* 메뉴 스타일 */
ul.sidebar-menu li a{
    color: #aeb2b7;
    text-decoration: none;
    display: block;
    padding: 15px 0 15px 10px;
    font-size: 15px;
    outline: none;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
/* active 스타일 지정 */
ul.sidebar-menu li a.active, ul.sidebar-menu li a:hover, ul.sidebar-menu li a:focus {
    background: #4ECDC4;
    color: #fff;
    display: block;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
ul.sidebar-sub li a.active, ul.sidebar-sub li a:hover, ul.sidebar-sub li a:focus {
    background: #4ECDC4;
    color: #fff;
    display: block;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
/* 메인메뉴 글씨 크기 조절 및 패딩 위치*/
ul.sidebar-menu li a i {
    font-size: 19px;
    padding-right: 6px;
}

/* 각 메뉴 크기 설정 + 블럭 크기 설정 */
#sidebar-menu{
	width: 105%;
	color: #aeb2b7;
}
#sidebar-menu ul li{
	width: 107%;
	color: #aeb2b7;
}
/* 하위메뉴 숨겨주는 부분 */
#sidebar ul ul {
	display: none;
	background-color: #5c5c5c;
}
/* 하위메뉴 > 블럭지정: 내부에 연장되도록 변경 */
#sidebar ul li:hover ul {
	display: block;
}
/* ///////////////////////////////////// */
#choose{
	width: 105%;
	color: #aeb2b7;
}
#choose ul li{
	width: 107%;
	color: #aeb2b7;
}

</style>
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>

<!-- Side Bar -->
	<aside>

		<div id="sidebar" class="nav-collapse ">
			<div style="padding:20px;"></div>
			
			<!-- side bar menu start-->s
			<ul class="sidebar-menu">
				
				<li id="choose">
					<a class="active" href="#"> 
						<i class="fa fa-dashboard">Main Menu 0</i>
					</a>
					<ul>
						<li class="sidebar-sub"><a class="active" href="#">Sub Menu 1</a></li>
						<li class="sidebar-sub"><a href="#">Sub Menu 2</a></li>
						<li class="sidebar-sub"><a href="#">Sub Menu 3</a></li>
					</ul>
				</li>
				
				<li id="sidebar-menu">
					<a href="#"> 
						<i class="fa fa-dashboard">Main Menu 1</i>
					</a>
					<ul>
						<li class="sidebar-sub"><a href="#">Sub Menu 1</a></li>
						<li class="sidebar-sub"><a href="#">Sub Menu 2</a></li>
						<li class="sidebar-sub"><a href="#">Sub Menu 3</a></li>
					</ul>
				</li>
				
				<li id="sidebar-menu">
					<a href="#"> 
						<i class="fa fa-dashboard">Main Menu 2</i>
					</a>
					<ul>
						<li class="sidebar-sub"><a href="#">Sub Menu 1</a></li>
						<li class="sidebar-sub"><a href="#">Sub Menu 2</a></li>
						<li class="sidebar-sub"><a href="#">Sub Menu 3</a></li>
					</ul>
				</li>
				
				<li id="sidebar-menu">
					<a href="#"> 
						<i class="fa fa-dashboard">Main Menu 3</i>
					</a>
					<ul>
						<li class="sidebar-sub"><a href="#">Sub Menu 1</a></li>
						<li class="sidebar-sub"><a href="#">Sub Menu 2</a></li>
						<li class="sidebar-sub"><a href="#">Sub Menu 3</a></li>
					</ul>
				</li>
				
			</ul>
		</div>

	</aside>





	<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%></div>
</body>
</html>