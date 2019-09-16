<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="../../../Style/common/HeadUI.jsp"%> 
<!-- CSS Style Import --> 
<style type="text/css"> 
<%@ include file="/Style/css/CssStyle.css"%>
</style>
<title>KIOSK_JOIN</title>
<style>
	#cb_com{
		width: 350px;
	}
	#kiosk_gate{
		width: 350px;
	}
	.textbox-label{
		margin-right: 46px;
		width: 100px;
		vertical-align: middle;
		white-space: nowrap;
		margin-right: 30px;
		padding-right: 5px;
	}
	.textbox{
		width: 250px;
	    height: 40px;
	}
	.col-lg-offset-2 {
		border:thin;
	}
	.col-lg-offset-2 .row{
		text-align: center;
		padding-top: 30px;
	}
</style>
<script type="text/javascript">
	function join(){
		alert("가입하기");
		if($("#cb_com").val()==""){
			alert("회사를 선택해주세요.");
			$("#cb_com").textbox('textbox').focus();
			return;
		}
		if($("#kiosk_gate").val()==""){
			alert("설치 위치를 입력해 주세요.");
			$("#kiosk_gate").textbox('textbox').focus();
			return;
		}
		else{
			//$("#f_kioskjoin").submit();
		}
		
	}
</script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#cb_com").combobox({
			url:'combobox_data.json',//회사 이름을 받을 url
			valueField:'com_no',
			textField:'com_name'
		});
	});
</script>
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container-fluid">
	<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
		<div class="page-header" style="padding-top: 10px">
			<h1 class="text-center col-12 mb-0" style="padding-bottom: 20px;">KOISK_JOIN</h1>
		</div>
		<div class="row" style="height: 20px;"></div>
		<div class="row" style="vertical-align: middle;">
			<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
				<div class="well">
				<form id="f_kioskjoin">
					<div class="row">
						<input id="cb_com" name="cb_com" label="회사 이름" style="height: 40px;">
					</div>
					<div class="row">
						<input class="easyui-textbox" id="kiosk_gate" label="설치 위치"/>
					</div>
					<div class="row" align="center" style="padding-top: 200px">
						<button type="submit" id="join-submit" class="btn btn-Success" 
							    style="width: 200px;height: 40px;font-size: 20px;" onclick="join()">
							    kiosk_join&emsp;
						</button>
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