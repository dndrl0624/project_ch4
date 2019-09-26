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
<title>QR조회 - CH4 방문자 관리 시스템</title>
<style>
	h2#title {
		border-left: 5px solid #FF5F41;
		padding-left: 10px;
	}
	#form1 {
		padding-left : 0px;
		padding-right : 0px;
	}
	.panel.panel-info {
		border: 2px solid #FF5F41;
	}
	.panel-body {
		border: 0px;	
	}
	.img-circle {
		width : 100px;
		height : 100px;
		margin : 20px 20px 20px 20px;
		background-color : #FF7C63;
	}
	.easyui-textbox {
		width : 90%;
	}
	#btn_search {
		background-color : #FF7C63;
		border-color : #FF5F41;
		width : 100%;
		height : 120px;
		font-size : 22px;
		padding-top : 0px;
		padding-bottom : 0px;
		padding-left : 0px;
		padding-right : 0px;
	}
	#tb_search thead tr th {
		border-top-width: 3px;
		border-top-color: #FF5F41;
		border-bottom-width: 3px;
		border-bottom-color: #FF5F41;
	}
	#tb_search th {
		background-color: #FFC3B8;
	}
	.modal-content {
		border: 0px;
	}
	.modal-body {
		text-align: center;
	}
	#md_qr_body {
		padding-left: 0px;
		padding-right: 0px;
		text-align: center;
	}
	#md_qr_header {
		background-color: #FFC3B8;
	}
	.table th,
	.table td {
		text-align:center;
		border: 1px solid #EDEDED;
	}
	.table th {
		background-color: #FFC3B8;
	}
</style>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<script type="text/javascript">
	//부트스트랩 테이블 default 세팅
	$.fn.bootstrapTable.defaults.locales = ["ko-KR"];
	$.fn.bootstrapTable.defaults.singleSelect = true;
	$.fn.bootstrapTable.defaults.pagination = true;
	$.fn.bootstrapTable.defaults.pageList = [10,20,30,50];
	$.fn.bootstrapTable.columnDefaults.halign = 'center';
	$.fn.bootstrapTable.columnDefaults.valign = 'middle';
	$.fn.bootstrapTable.columnDefaults.align = 'center';
	$(document).ready(function(){
		$("#tb_search").bootstrapTable({
			columns:[
			    {field:'confm_no',title:'물품번호'},
			    {field:'com_name',title:'반입지'},
			    {field:'aplg_trans_date',title:'반입일자'},
			    {field:'confm_name',title:'물품명'},
			    {field:'confm_type',title:'물품종류'},
			    {field:'confm_quan',title:'EA'},
			    {field:'show_qr',title:'QR코드',events: window.operateEvents,
			          formatter: operateFormatter,width:150},
			    {field:'confm_qrcode',title:'QRcode',visible:false},
			    {field:'qrPath',title:'QRpath',visible:false}
			],
			onClickCell:function(row,$element,field,value){
				//누른 cell의 컬럼명
				var column = row;
				//방문번호를 눌렀을때는 해당 방문번호의 신청번호로 정보 조회(새창띄우기)
				if("confm_no"==column){
					var confm_no = value;
					$("#confm_no").attr('value',confm_no);
// 					$("#form_search_info").submit();
					alert('방문번호로 신청 상세조회');
				}
			}
		});
	});
	function operateFormatter(value, row, index) {
		/////////// QR이미지 경로 변수 처리 ///////////
		
		/////////// QR이미지 경로 변수 처리 ///////////
	    return [
	      "<button class='btn QR' type='button' style='margin-right:10px;'><img src='../../Style/images/crud/QR_icon.png'></button>"
	      +"<button class='btn download' type='button'>"
	      +"<a href='../../Style/images/crud/QR.png' download='myQR.png'>"
	      +"<img src='../../Style/images/crud/download_icon.png'></a></button>"
	    ].join('')
	}
	window.operateEvents = {
		'click .btn.QR': function (e, value, row, index) {
			/////////// QR이미지 경로 변수 처리 ///////////
			
			/////////// QR이미지 경로 변수 처리 ///////////
			var QR = "<img class='img_thumbnail' src='../../Style/images/crud/QR.png'>";
			$("#md_qr_body").empty();
			$("#md_qr_body").append(QR);
			$("#md_QR").modal('show');
		}
	}
	function searchQR(){
		//테스트용
		$.ajax({
			url: "../../json/testLog3.json",
			dataType: "json",
			success: function(result){
				$("#tb_search").bootstrapTable('load',result);
			}
		});
// 		if(!($("#input_search_num").textbox('getValue'))){
// 			alert("신청번호를 입력해 주세요.");
// 			$("#input_search_num").textbox('textbox').focus();
// 			return;
// 		}
// 		$.ajax({
// 			type: "POST",
// 			url: "/goods/searchQR.ch4",
// 			data: $("#form_search").serialize(),
// 			dataType: "json",
// 			success: function(result){
// 				if(!result){
// 					alert("조회결과가 없습니다.");
// 					return;
// 				}
// 				$("#tb_search").bootstrapTable('load',result);
// 			},
// 			error: function(){
// 				alert("error");
// 			}
// 		});
	}
</script>
<div class="container">
	<div class="row">
		<div id="form1" class="col-lg-offset-1 col-lg-10">
			<div style="text-align:left;">
				<h2 id="title"><b>반입 QR 조회</b></h2>
			</div>
			<div class="panel panel-info">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-offset-1 col-lg-2">
							<img class="img-circle" src="../../Style/images/crud/QR.png">
						</div>
						<div class="col-lg-6" style="padding-top:50px;text-align:center;">
							<!------------------ 이 구간은 이름 & 연락처로 조회시 값이 전송되는 구간 -------------------->
							<form id="form_search" method="POST">
								<input id="input_search_num" class="easyui-textbox" name="aplg_no" data-options="prompt:'신청번호'" style="width:300px;"><br><br>
							</form>
							<!------------------ 이 구간은 조회시 값이 전송되는 구간 끝 ------------------>
						</div>
						<div class="col-lg-2" style="padding-left:0px;padding-right:40px;margin : 10px 0px 10px 0px;">
							<button id="btn_search" class="btn btn-info" type="button" onClick="searchQR()">조회</button>
						</div>
					</div>
				</div>
			</div><br>
			<table id="tb_search" class="table"></table>
		</div>
	</div>
</div>
<!-- QR코드 이미지 Modal -->
<div id="md_QR" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="md_qr_header" class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div id="md_qr_body" class="modal-body">
				
			</div>
		</div>
	</div>
</div>
<!-- 방문번호로 정보조회 FORM전송 -->
<form id="form_search_info" action="" method="post">
	<input id="confm_no" type="hidden" name="confm_no" value="">
</form>
</body>
</html>