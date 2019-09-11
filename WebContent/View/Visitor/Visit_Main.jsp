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
	label {
		margin-top : 10px;
		margin-bottom : 10px;
		font-size : 22px;
	}
</style>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container-fluid" style="text-align:center;">
	<div id="jumbo_visit" class="jumbotron">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<div class="row">
				<div style="text-align:left;">
					<h2>방문/반입 신청</h2>
				</div>
				<div id="form1" class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">1. 방문지/목적지 선택</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-4">
									<img class="img-circle" src="/Style/images/crud/buildings.png">
								</div>
								<div class="col-lg-8">
									<br>
									<input class="easyui-combobox" label="방문지" labelPosition="left"><br><br>
									<input class="easyui-combobox" label="목적지" labelPosition="left">
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
									<img class="img-circle" src="/Style/images/crud/clipboard.png">
								</div>
								<div class="col-lg-5" style="padding-left:0px;padding-right:0px;">
									<br>
									<input class="easyui-textbox" data-options="prompt:'성명'"><br><br>
									<input class="easyui-textbox" data-options="prompt:'전화번호'">
								</div>
								<div class="col-lg-3" style="padding-left:0px;padding-right:20px;margin : 10px 0px 10px 0px;">
									<button id="btn_apply" class="btn btn-primary" type="button">신청</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div id="form1" class="col-lg-12">
					<div class="panel panel-info">
						<div class="panel-heading">3. 신청조회/안내</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-2">
									<img class="img-circle" src="/Style/images/crud/searchbox.png" style="background-color:#6EAFA8">
								</div>
								<div class="col-lg-4" style="padding-left:0px;padding-right:10px;">
									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#nav_search1">신청번호</a></li>
										<li><a data-toggle="tab" href="#nav_search2">신청자정보</a></li>
									</ul>
									<div class="tab-content">
										<div id="nav_search1" class="tab-pane fade in active">
											<br>
											<input class="easyui-textbox" data-options="prompt:'신청번호를 입력하세요.'">
										</div>
										<div id="nav_search2" class="tab-pane fade" style="padding-top:10px;">
											<input class="easyui-textbox" data-options="prompt:'성명'" style="width:300px;"><br><br>
											<input class="easyui-textbox" data-options="prompt:'전화번호'" style="width:300px;">
										</div>
									</div>
								</div>
								<div class="col-lg-2" style="padding-left:0px;padding-right:40px;margin : 10px 0px 10px 0px;">
									<button id="btn_search" class="btn btn-info" type="button">조회</button>
								</div>
								<div class="col-lg-4" style="padding-left:0px;padding-right:0px;">
									<label for="img_process">신청 절차안내</label>
									<img id="img_process" src="/Style/images/crud/img_process.png">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-1"></div>
	</div>
</div>

</body>
</html>