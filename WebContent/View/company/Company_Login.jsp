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
	margin-top: 0px;
	padding-top: 10px;
	height: 600px;
	background-image: url('../../Style/images/banner/speedGate (2).jpg');
}

#login_background {
	background-color: rgba(223, 223, 223, 0.7);
	height: 100%;
	padding-bottom: 30px;
}

#blank {
	height: 100px;
}

div.row {
	padding-top: 20px;
}

#btn_login {
	width: 50%;
	height: 80px;
}

.checkbox {
	border: 0px;
}

h2 {
	padding-left: 3%;
	margin-left: 8%;
	border-left: solid 7px;
	color: white;
}
</style>
<script type="text/javascript">
	function login(){
		alert("로그인");
		if($('#cmng_id').val()==""){
            $('#cmng_id').focus();
            alert("아이디를 입력해주세요");
            return;
        }
		if($('#cmng_pw').val()==""){
            $('#cmng_pw').focus();
            alert("비밀번호를 입력해주세요");
            return;
        }
        else{
           // $('#fsignin').submit();
        }
	}
</script>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container-fluid" style="text-align: center;">
	<div id="jumbo_companylogin" class="jumbotron">
		<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
			<div class="row">
			<!-- 로그인//kiosk 버튼 -->
				<div class="col-lg-offset-8 col-lg-4">
					<button class="btn btn-light" id="com_join" style="width: 80px;" onClick="location.href='Company_Join.jsp'">JOIN</button>
					<button class="btn btn-danger" id="kiosk" style="width: 80px;">KIOSK</button>
				</div>
			</div>
			<div class="row" align="left">
				<h2>COMPANY</h2>
			<div>
			<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
				<div id="login_background" class="row" align="center">
				<!-- 로그인화면 -->
					<form class="fsignin" id="fsignin">
						&nbsp;
						<h1 style="font-size: 50px;">Please sign in</h1>
						&nbsp;
						<div class="row">
							<div class="row">
								<div class="col-lg-7" align="right">
									<div class="col-lg-offset-4 col-lg-8 ">
										<input id="cmng_id" class="easyui-textbox"  prompt="id" data-options="iconCls:'icon-man'" style="width:80%; height: 40px; margin-bottom: 10px">
										<input id="cmng_pw" class="easyui-passwordbox" prompt="Password" iconWidth="28" style="width:80%; height: 40px">
									</div>
								</div> 
								<div class="col-lg-3" align="left">
									<button id="btn_login"  class="btn btn-lg btn-primary btn-block" onClick="login()" type="submit">Sign in</button>
								</div>
								<div class="col-lg-2">
								
								</div>
							</div>
							<div class="row">
								<div class="checkbox">
    								<label>
										<input type="checkbox" value="remember-me"> Remember me
							    	</label>
							    </div>
  							</div>
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
