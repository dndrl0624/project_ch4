<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
<!-- CSS Style Import --> 
<style type="text/css"> 
<%@ include file="/Style/css/CssStyle.css"%>
</style>
<title>방문/반입 관리 - CH4 방문자 관리 시스템</title>
<style type="text/css">
	#jumbo_companylogin {
		margin-top : 0px;
		padding-top : 10px;
		height : 600px;
		background-image: url('../../Style/images/banner/speedGate (2).jpg');
	}
	#login_background{
		background-color: gray;
		opacity:inherit;
		margin-left: 20px;
		margin-right: 20px;
		margin-bottom: 20px;
		height: 100%;
	}
	#blank{
		height: 100px;
	}
</style>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container-fluid" style="text-align: center;">
	<div id="jumbo_companylogin" class="jumbotron">
		<div >
			<div class="row">
			<!-- 로그인//kiosk 버튼 -->
				<div class="col-lg-offset-10 col-lg-2">
					<button class="btn btn-light">JOIN</button>
					<button class="btn btn-primary">KIOSK</button>
				</div>
			</div>
			<div class="row" id="blank">
			</div>
			<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
				<div id="login_background" class="row">
				<!-- 로그인화면 -->
					<form class="fsignin">
						<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
						<div class="col-lg-8">
							<div class="col-lg-offset-4 col-lg-8 ">
								<label for="inputEmail" class="sr-only">Email address</label>
								<input id="id" class="form-control"	placeholder="id" style="width: 70%" required autofocus> 
								<label for="inputPassword" class="sr-only">Password</label>
								<input type="password" id="password" class="form-control" placeholder="Password" required>
							</div>
						</div>
						<div class="col-lg-4">
							<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>