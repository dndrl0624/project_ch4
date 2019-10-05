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
	div .row{
		
	}

</style>
<script type="text/javascript">
	function join(){
		//모든 칸이 쓰였는지 확인
		if($("#cmng_id").val()==""){
			alert("아이디를 입력해주세요.");
			$("#cmng_id").textbox('textbox').focus();
			return;
		}
		if($("#cmng_pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#cmng_pw").passwordbox('textbox').focus();
			return;
		}
		if($("#re_cmng_pw").val()==""){
			alert("비밀번호를 확인 해주세요.");
			$("#re_cmng_pw").passwordbox('textbox').focus();
			return;
		}
		if($("#cmng_name").val()==""){
			alert("성함을 입력 해주세요.");
			$("#cmng_name").textbox('textbox').focus();
			return;
		}
		if($("#cmng_permit_hp1").val()==""){
			alert("핸드폰 번호를 입력 해주세요.");
			$("#cmng_permit_hp").textbox('textbox').focus();
			return;
		}
		if($("#cmng_permit_hp2").val()==""){
			alert("핸드폰 번호를 입력 해주세요.");
			$("#cmng_permit_hp").textbox('textbox').focus();
			return;
		}
		if($("#cmng_permit_hp3").val()==""){
			alert("핸드폰 번호를 입력 해주세요.");
			$("#cmng_permit_hp").textbox('textbox').focus();
			return;
		}
		if($("#cmng_grade").val()==""){
			alert("등급을 선택 해주세요.");
			$("#cmng_grade").combobox('textbox').focus();
			return;
		}
		else{
			var cmng_permit_hp = $("#cmng_permit_hp1").val()+'-'
								+$("#cmng_permit_hp2").val()+'-'
								+$("#cmng_permit_hp3").val();
			alert(cmng_permit_hp);
			$("#cmng_permit_hp").setValue(cmng_permit_hp);
			//$("#f_join").submit();
		} 
		//url 보내기
	}
	//아이디 중복 체크
	function checkid(){
		var id = $("#cmng_id").val();
		alert(id);
		$.ajax({
			method:'get'
			,url:url+id
			,success:function(data){
				alert(data);
				if(data=="성공"){
					alert("사용가능한 아이디입니다.");
				}else{
					alert("다른 아이디를입력해주세요.");
				}
			}
		});//////////end of ajax
	}
</script>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		//비밀번호와 비밀번호 확인 칸이 같은지 확인
		$("#re_cmng_pw").passwordbox('textbox').blur(function(){
            var pwd=$("#cmng_pw").val();
          	var rePwd=$("#re_cmng_pw").val();
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
		<div class="page-header" style="padding-top: 10px">
			<h1 class="text-center col-12 mb-0" style="padding-bottom: 20px;">JOIN</h1>
		</div>
		<div class="row" style="vertical-align: middle;">
			<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1" align="center">
				<div class="well col-lg-offset-1 col-lg-10 col-lg-offset-1" align="center">
					<form id="f_join">
						<div class="col-lg-offset-3 col-lg-7 col-lg-offset-2" align="left">
						<div class="row">
							<input id="cmng_id" name="cmng_id" class="easyui-textbox" label="아이디" 
								   prompt="아이디를 입력하세요."
								   style="width:400px;height: 40px;">
								   &ensp;
							<button id="id_check" class="btn btn-danger" style="width: 82px;height: 40px;"onClick="checkid()" >
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
							<input type="hidden" id="cmng_permit_hp" name="cmng_permit_hp" > 
							<input id="cmng_permit_hp1" name="cmng_permit_hp" class="easyui-textbox" label="연락처" 
								   style="width:220px;height: 40px;" prompt="010">
							<span>-</span>
							<input id="cmng_permit_hp2" class="easyui-textbox"
								   style="width:128px;height: 40px;">
							<span>-</span>
							<input id="cmng_permit_hp3" class="easyui-textbox"
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
					</form>
				</div>
			</div>
		</div>
		<div class="row" align="center" style="padding-top: 100px">
			<button type="submit" id="join-submit" class="btn btn-primary" 
				    style="width: 180px;height: 40px;" onClick="join()">
				        회원가입&emsp;<i class="fa fa-check spaceLeft"></i>
			</button>
		</div>
	</div>
</div>
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>