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
<title>방문/반입 신청 - CH4 방문자 관리 시스템</title>
<style>
	#jumbo_visit {
		margin-top : 0px;
		padding-top : 10px;
		height : 600px;
		background-image: url('../../Style/images/banner/speedGate (2).jpg');
	}
	.panel {
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
	}
	.panel-heading {
		font-size : 20px;
		padding-left: 40px;
		text-align:left;
	}
	#form1 {
		padding-left : 0px;
		padding-right : 0px;
	}
	.img-circle {
		width : 100px;
		height : 100px;
		margin : 20px 20px 20px 20px;
		background-color : #42788A;
	}
	.easyui-combobox {
		width : 85%;
	}
	.easyui-textbox {
		width : 90%;
	}
	.btn {
		width : 100%;
		height : 120px;
		font-size : 22px;
		padding-top : 0px;
		padding-bottom : 0px;
		padding-left : 0px;
		padding-right : 0px;
	}
	.btn#btn_search {
		width : 100%;
		height : 80px;
		font-size : 22px;
		padding-top : 0px;
		padding-bottom : 0px;
		padding-left : 0px;
		padding-right : 0px;
	}
	label {
		margin-top : 10px;
		margin-bottom : 10px;
		font-size : 22px;
	}
	label.radio-inline {
		margin-top : 5px;
		margin-bottom : 5px;
		font-size : 14px;
	}
	#input_apply_hp1,#input_apply_hp2,#input_apply_hp3 {
		width: 27%;
	}
	#input_search_hp1,#input_search_hp2,#input_search_hp3 {
		width: 80px;
	}
	input[type=number]::-webkit-inner-spin-button,
	input[type=number]::-webkit-outer-spin-button {
		-webkit-appearance: none;
		margin: 0;
	}
</style>
<script>
	var searchKeyword = "number";
</script>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<script>
	$(document).ready(function(){
		//방문을 선택하면 신청번호 name이 visit_no로 변경
		$("#radio_visitor").on('click',function(){
			$("#input_num").attr("name","visit_no");
			$("#input_search_name").attr("name","visit_apply_name");
			$("#input_search_hp").attr("name","visit_apply_hp");
		});
		//반입을 선택하면 신청번호 name이 apl_no로 변경
		$("#radio_goods").on('click',function(){
			$("#input_num").attr("name","aplg_no");
			$("#input_search_name").attr("name","aplg_name");
			$("#input_search_hp").attr("name","aplg_hp");
		});
		//방문지 선택시 목적지 combobox option 재설정
		$("#combo_company").combobox({
			onChange:function(newValue){
				alert("방문지: "+$("#combo_company").combobox('getValue'));
				/* $("#combo_desti").combobox({
					valueField: 'dept_no',
					textField: 'dept_name',
					url: "url요청주소 미지정"
				}); */
			}
		});
		//신청조회 검색조건이 신청번호일때
		$('.nav-tabs a[href="#nav_search1"]').on('shown.bs.tab', function(){
			//form전송 할때 조건문 조건값
			searchKeyword = "number";
		});
		//신청조회 검색조건이 신청자이름 & 연락처일때
		$('.nav-tabs a[href="#nav_search2"]').on('shown.bs.tab', function(){
			searchKeyword = "name&hp";
		});
	});
	//입력값을 약관동의 페이지로 가져가는 함수
	function applyNext(){
		//url정해지면 삭제 예정
		//location.href = "Visit_Agreement.jsp";
		if(!($("#combo_company").combobox('getValue'))){
			alert("방문지를 선택해 주세요.");
			$("#combo_company").combobox('textbox').focus();
			return;
		}
		if(!($("#combo_desti").combobox('getValue'))){
			alert("목적지를 선택해 주세요.");
			$("#combo_desti").combobox('textbox').focus();
			return;
		}
		if(!($("#input_apply_name").textbox('getValue'))){
			alert("신청자 성명을 입력해 주세요.");
			$("#input_apply_name").textbox('textbox').focus();
			return;
		}
		if(!($("#input_apply_hp1").textbox('getValue'))){
			alert("신청자 연락처를 입력해 주세요.");
			$("#input_apply_hp1").textbox('textbox').focus();
			return;
		}
		if(!($("#input_apply_hp2").textbox('getValue'))){
			alert("신청자 연락처를 입력해 주세요.");
			$("#input_apply_hp2").textbox('textbox').focus();
			return;
		}
		if(!($("#input_apply_hp3").textbox('getValue'))){
			alert("신청자 연락처를 입력해 주세요.");
			$("#input_apply_hp3").textbox('textbox').focus();
			return;
		}
		var apply_hp = $("#input_apply_hp1").textbox('getValue') + "-"
						+ $("#input_apply_hp2").textbox('getValue') + "-"
						+ $("#input_apply_hp3").textbox('getValue');
		$("#input_apply_hp").attr("value",apply_hp);
		//url주소 정해지면 활성화 예정
		//$("#form_apply").submit();
	}
	//조회페이지 넘어가는 함수
	function searchApply(){
		//신청번호로 조회니?
		if("number"==searchKeyword){
			if(!($("#input_num").textbox('getValue'))){
				alert("신청번호를 입력해 주세요.");
				$("#input_num").textbox('textbox').focus();
				return;
			}
			//url주소 정해지면 활성화 예정
			//$("#form_search_num").submit();
		}
		//이름 & 연락처로 조회니?
		else if("name&hp"==searchKeyword){
			if(!($("#input_search_name").textbox('getValue'))){
				alert("신청자 성명을 입력해 주세요.");
				$("#input_search_name").textbox('textbox').focus();
				return;
			}
			if(!($("#input_search_hp1").textbox('getValue'))){
				alert("신청자 연락처를 입력해 주세요.");
				$("#input_search_hp1").textbox('textbox').focus();
				return;
			}
			if(!($("#input_search_hp2").textbox('getValue'))){
				alert("신청자 연락처를 입력해 주세요.");
				$("#input_search_hp2").textbox('textbox').focus();
				return;
			}
			if(!($("#input_search_hp3").textbox('getValue'))){
				alert("신청자 연락처를 입력해 주세요.");
				$("#input_search_hp3").textbox('textbox').focus();
				return;
			}
			var search_hp = $("#input_apply_hp1").textbox('getValue') + "-"
							+ $("#input_apply_hp2").textbox('getValue') + "-"
							+ $("#input_apply_hp3").textbox('getValue');
			$("#input_search_hp").attr("value",search_hp);
			//url주소 정해지면 활성화 예정
			//$("#form_search_name").submit();
		}
	}
</script>
<div class="container-fluid" style="text-align:center;">
	<div id="jumbo_visit" class="jumbotron">
		<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
			<div class="row">
				<div style="text-align:left;">
					<h2>방문/반입 신청</h2>
				</div>
				<!------------------ 이 구간은 신청시 값이 전송되는 구간 -------------------->
				<form id="form_apply" action="" method="POST">
					<div id="form1" class="col-lg-6">
						<div class="panel panel-primary">
							<div class="panel-heading">1. 방문지/목적지 선택</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-4">
										<img class="img-circle" src="../../Style/images/crud/buildings.png">
									</div>
									<div class="col-lg-8">
										<br>
										<select id="combo_company" class="easyui-combobox" name="com_no" label="방문지" labelPosition="left">
											<option value="">방문지</option>
											<option value="test">테스트</option>
										</select><br><br>
										<select id="combo_desti" class="easyui-combobox" name="visit_desti" label="목적지" labelPosition="left">
											<option value="">목적지</option>
											<option value="test">테스트</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="form1" class="col-lg-6">
						<div class="panel panel-primary">
							<div class="panel-heading">2. 신청자</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-4">
										<img class="img-circle" src="../../Style/images/crud/clipboard.png">
									</div>
									<div class="col-lg-5" style="padding-left:0px;padding-right:0px;">
										<br>
										<input id="input_apply_name" class="easyui-textbox" name="visit_apply_name" data-options="prompt:'성명'"><br><br>
										<input id="input_apply_hp" type="hidden">
										<input id="input_apply_hp1" class="easyui-textbox" type="number" data-options="prompt:'010'"> - 
										<input id="input_apply_hp2" class="easyui-textbox" type="number" data-options="prompt:'XXXX'"> - 
										<input id="input_apply_hp3" class="easyui-textbox" type="number" data-options="prompt:'XXXX'">
									</div>
									<div class="col-lg-3" style="padding-left:0px;padding-right:20px;margin : 10px 0px 10px 0px;">
										<button id="btn_apply" class="btn btn-primary" type="button" onClick="javascript:applyNext()">신청</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<!------------------ 이 구간은 신청시 값이 전송되는 구간 끝 ------------------>
			</div>
			<div class="row">
				<div id="form1" class="col-lg-12">
					<div class="panel panel-info">
						<div class="panel-heading">3. 신청조회/안내</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-2">
									<img class="img-circle" src="../../Style/images/crud/searchbox.png" style="background-color:#6EAFA8">
								</div>
									<div class="col-lg-4" style="padding-left:0px;padding-right:10px;">
										<ul class="nav nav-tabs">
											<li class="active"><a data-toggle="tab" href="#nav_search1">신청번호</a></li>
											<li><a data-toggle="tab" href="#nav_search2">신청자정보</a></li>
										</ul>
										<div class="tab-content">
											<!------------------ 이 구간은 신청번호로 조회시 값이 전송되는 구간 -------------------->
											<form id="form_search_num" action="" method="POST">
											<div id="nav_search1" class="tab-pane fade in active">
												<br>
												<input id="input_num" class="easyui-textbox" name="visit_no" data-options="prompt:'신청번호를 입력하세요.'">
											</div>
											</form>
											<!------------------ 이 구간은 조회시 값이 전송되는 구간 끝 ------------------>
											<!------------------ 이 구간은 이름 & 연락처로 조회시 값이 전송되는 구간 -------------------->
											<form id="form_search_name" action="" method="POST">
											<div id="nav_search2" class="tab-pane fade" style="padding-top:10px;">
												<input id="input_search_name" class="easyui-textbox" name="visit_apply_name" data-options="prompt:'성명'" style="width:300px;"><br><br>
												<input id="input_search_hp" type="hidden" name="visit_apply_hp">
												<input id="input_search_hp1" class="easyui-textbox" type="number" data-options="prompt:'010'"> - 
												<input id="input_search_hp2" class="easyui-textbox" type="number" data-options="prompt:'XXXX'"> - 
												<input id="input_search_hp3" class="easyui-textbox" type="number" data-options="prompt:'XXXX'">
											</div>
											</form>
											<!------------------ 이 구간은 조회시 값이 전송되는 구간 끝 ------------------>
										</div>
									</div>
									<div class="col-lg-2" style="padding-left:0px;padding-right:40px;margin : 10px 0px 10px 0px;">
										<div>
											<label class="radio-inline"><input id="radio_visitor" type="radio" name="search" value="visitor" checked>방문</label>
											<label class="radio-inline"><input id="radio_goods" type="radio" name="search" value="goods" >반입</label>
										</div>
										<button id="btn_search" class="btn btn-info" type="button" onClick="javascript:searchApply()">조회</button>
									</div>
								<div class="col-lg-4" style="padding-left:0px;padding-right:0px;">
									<label for="img_process">신청 절차안내</label>
									<img id="img_process" src="../../Style/images/crud/img_process.png">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>