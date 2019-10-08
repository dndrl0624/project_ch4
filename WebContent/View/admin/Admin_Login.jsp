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
<title>시스템 관리- CH4 방문자 관리 시스템</title>
<style type="text/css">
	#jumbo_adminlogin {
		margin-top : 30px;
		padding-top : 10px;
		height : 700px;
		background-image: url('../../Style/images/banner/banner_admin.jpg');
	}
	#login_background{
		background-color:rgba(223,223,223,0.7);
		height: 100%;
		padding-bottom: 50px;
		padding-top: 30px;
	}
	#admin {
		padding-left: 3%;
		margin-left: 8%;
		border-left: solid 7px;
		color: white;
		margin-top: 100px;
		font-family: unset;
    	font-weight: 800;
	}
	#login_title{
		color: white;
		margin-bottom : 30px;
		font-family: unset;
    	font-weight: 700;
    	font-family: -webkit-pictograph;
	
	}
	#admin_id,#admin_pw,#btn_login {
		width: 300px; 
	}
	#_easyui_textbox_input1,#_easyui_textbox_input2 {
		height: 40px;
	}
	#btn_login{
		margin-top: 30px;
	}
	
	.checkbox{
		border: 0px;
	}

}

</style>
<script type="text/javascript">
	function login(){
		//아이디와 비번이 쓰였는지에대한 체크
		if($('#admin_id').val()==""){
            $('#admin_id').focus();
            alert("아이디를 입력해주세요");
            return;
        }
		if($('#admin_pw').val()==""){
            $('#admin_pw').focus();
            alert("비밀번호를 입력해주세요");
            return;
        }
        else{
			//전송
        	$('#f_adminlogin').attr("method","post");
    		$('#f_adminlogin').attr("action","company/login.ch4"); //전송을 하는 곳.
    		$('#f_adminlogin').submit(); 
        }
	} 
</script>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container">
	<div id="jumbo_adminlogin" class="jumbotron">
		<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
			<div class="row" align="left" >
				<h2 id="admin">ADMIN</h2>
			</div>
			<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
				<div id="login_background" class="row" align="center" >
					<h1 id="login_title">Please sign in</h1>
					<div class="row">
						<div class="col-lg-offset-3 col-lg-6 col-lg-offset-3">
							<form class="f_adminlogin">
								<div class="row">
									<input id="admin_id" class="easyui-textbox"  prompt="id" data-options="iconCls:'icon-man'" >
								</div>
								<div class="row"> 
									<input id="admin_pw" class="easyui-passwordbox" prompt="Password" iconWidth="28">
								</div>
								<div class="row">
									<button id="btn_login" type="button" class="btn btn-lg btn-primary btn-block" onClick="javascript:login()">Sign in</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>