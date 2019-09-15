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
<title>회원가입 창!!!~~~!!!</title>
<style>
	div #label{
		vertical-align: middle;
	}
	span#help_block{
		display: none;
	}
	.textbox-label {
		width: 100px;
		height: 50px;
		line-height: 40px;
		vertical-align: middle;
		white-space: nowrap;
		margin: 10px;
		padding-right: 5px;
	}
	.easyui-textbox{
		height: 40px;
	}

</style>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#id_check").on('click', function(){
			alert("버튼");
			var id = $("#cmng_id").val();
			alert(id);
		});
		$("#re_cmng_pw").passwordbox('textbox').blur(function(){
			//alert("여기");
	      	var rePwd=$("#re_cmng_pw").val();
	        var pwd=$("#cmng_pw").val();
	        if(rePwd!=pwd){//비밀번호 다르다면
	        	
	        	alert("다시 입력하세요.");
	        	$("#cmng_pw").passwordbox('textbox').focus();
	        	return;
	        }
	    });
	});
</script>
<div class="container-fluid">
	<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
		<div class="row" style="padding-top: 10px">
			<h1 class="text-center col-12 mb-0" style="border-bottom-style: groove;padding-bottom: 10px;">JOIN</h1>
		</div>
		<div class="row" style="vertical-align: middle;">
			<div class="col-lg-offset-4 col-lg-8" align="left">
				<div class="row">
					<div class="row">
						<input id="cmng_id" name="cmng_id" class="easyui-textbox" label="아이디" 
							   prompt="아이디를 입력하세요."
							   style="width:400px;height: 40px;">
							   &ensp;
						<button type="submit" id="id_check" class="btn btn-danger" style="width: 82px;height: 40px;" >
							중복검사
						</button>
					</div>
					<div class="row">
						<input id="cmng_pw" name="cmng_pw" class="easyui-passwordbox" label="비밀번호" 
							   prompt="비밀번호를 입력하세요."
							   style="width:500px;height: 40px; ">
					</div>
					<div class="row">
						<input id="re_cmng_pw" name="re_cmng_pw" class="easyui-passwordbox" label="비밀번호 확인" 
							   prompt="비밀번호를 다시  입력 해 주세요"
						       style="width:500px; height: 40px;">
					</div>
					<div class="row">
						<input id="cmng_name" name="cmng_name" class="easyui-textbox" label="성명" 
							   prompt="이름을 입력해주세요"
							   style="width:500px;height: 40px;">
							   
					</div>
					<div class="row">
						<input id="cmng_permit_hp" name="cmng_permit_hp" class="easyui-textbox" label="연락처" 
							   style="width:220px;height: 40px;" prompt="010">
						<span>-</span>
						<input id="cmng_permit_hp" name="cmng_permit_hp" class="easyui-textbox"
							   style="width:128px;height: 40px;">
						<span>-</span>
						<input id="cmng_permit_hp" name="cmng_permit_hp" class="easyui-textbox"
							   style="width:128px;height: 40px;">
					</div>
					<div class="row">
						 <select class="easyui-combobox" name="cmng_grade" id="cmng_grade" label="등급" style="width:350px;height: 40px;">
			                <option value=""></option>
			                <option value="CMNG_GRADE_COMMIT">결제자</option>
			                <option value="CMNG_GRADE_INFO">안내데스크</option>
			             </select>
					</div>
				</div>
			</div>
		</div>
					<div class="row" align="center" style="padding-top: 200px">
						<button type="submit" id="join-submit" class="btn btn-primary" 
							    style="width: 200px;height: 40px;">
							        회원가입&emsp;<i class="fa fa-check spaceLeft"></i>
						</button>
					</div>
	</div>


</div>
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>