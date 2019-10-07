<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>방문 신청 디테일</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<!-- CSS Style Import --> 
<style type="text/css">
/* 스크롤 메뉴 */
ul.nav-pills {
	position: fixed;
}

/* class 스타일 */
div.col-lg-7 #section1 {
	height: 500px;
	margin-bottom: 10px;
	font-size: 28px;
}

div.col-lg-7 #section2, #section3, #section4 {
	height: 300px;
	margin-bottom: 10px;
	font-size: 28px;
}

div.panel-heading {
	font-size: 20px;
	font-weight: bold;
}

div.panel-body {
	height: 100%;
	border: 0px;
}

table.table {
	margin-bottom: 0px;
}

.row.table {
	margin-left: 0px;
	margin-right: 0px;
	text-align: center;
	font-size: 14px;
}

.row.table.basic {
	border-top: 2px solid #31708f;
}

.row.table.visitor {
	border-top: 2px solid #3c763d;
	margin-bottom: 50px;
}

.row.table.device {
	border-top: 2px solid #8a6d3b;
	margin-bottom: 50px;
}

.row.table.parking {
	border-top: 2px solid #333333;
	margin-bottom: 50px;
}

.table th, .table td {
	text-align: center;
	border: 1px solid #EDEDED;
}

.table th {
	background-color: #DDDDDD;
}

</style>
<script type="text/javascript">
	var now = new Date();
	
//신청 승인 처리
	function vpermission(){
		$("#f_vper").attr("method","post");
		$("#f_vper").attr("action","company/mngPermit.ch4");
		$("#f_vper").submit();
	}
//신청 반려 처리
	function vreturn(){
		$("#f_vret").attr("method","post");
		$("#f_vret").attr("action","company/mngPermit.ch4" );
		$("#f_vret").submit();
	}
</script>
</head>
<body>
<!-- java script -->
<%@ include file="../../CommonForm/Top.jsp"%> 

<div class="mainContent">
	<div class="col-lg-12" style="padding-bottom:3%">
	<div style="padding-left:200px">
		<div class="row">
			<div style="margin:30px 0px 0px 16%">
			<b style="font-size:35px;width: 50%;float: left;">방문 신청 상세 조회 (승인자용)</b>
			</div>
		</div>
	</div>
	</div>
	<div class="col-lg-12">
	<div style="padding-left:200px">
	<div class="col-lg-9" style="padding-left:16%">
			<div id="section1" class="panel panel-info">
				<div class="panel-heading">기본 방문정보</div>
				<div class="panel-body">
					<h4
						style="margin-bottom: 10px; border-left: 3px solid #31708f; padding-left: 4px;">
						<b>신청자 정보</b>
					</h4>
					<div class="row table basic">
						<table class="table">
							<tr>
								<th>성명</th>
								<td>(성명)</td>
								<th>전화번호</th>
								<td>010-0000-1234</td>
							</tr>
						</table>
					</div>
					<h4
						style="margin-bottom: 10px; border-left: 3px solid #31708f; padding-left: 4px;">
						<b>방문기간</b>
					</h4>
					<div class="row table basic">
						<table class="table">
							<thead>
								<tr>
									<th>방문유형</th>
									<th>방문주기</th>
									<th>방문요일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><select id="visit_type" class="easyui-combobox"
										style="width: 80%;" data-options="panelHeight:'auto'">
											<option value="일일방문">일일방문</option>
											<option value="기간방문">기간방문</option>
											<option value="정기방문">정기방문</option>
									</select></td>
									<td><select id="visit_term" class="easyui-combobox"
										style="width: 80%;" data-options="panelHeight:'auto'">
											<option value="매주">매주</option>
											<option value="격주">격주</option>
											<option value="첫째주">첫째주</option>
											<option value="둘째주">둘째주</option>
											<option value="셋째주">셋째주</option>
											<option value="넷째주">넷째주</option>
											<option value="마지막주">마지막주(넷째주포함)</option>
									</select></td>
									<td><select id="visit_day" class="easyui-combobox"
										style="width: 80%;" data-options="panelHeight:'auto'">
											<option value="월요일">월요일</option>
											<option value="화요일">화요일</option>
											<option value="수요일">수요일</option>
											<option value="목요일">목요일</option>
											<option value="금요일">금요일</option>
											<option value="토요일">토요일</option>
											<option value="일요일">일요일</option>
									</select></td>
								</tr>
							</tbody>
						</table>
						<table class="table">
							<tr>
								<th>방문날짜</th>
								<td><input id="visit_date1" class="easyui-datebox"
									style="width: 30%; height: 100%"> &emsp;&emsp;<span>~</span>&emsp;&emsp;
									<input id="visit_date2" class="easyui-datebox"
									style="width: 30%; height: 100%"></td>
							</tr>
						</table>
					</div>
					<h4
						style="margin-bottom: 10px; border-left: 3px solid #31708f; padding-left: 4px;">
						<b>상세정보</b>
					</h4>
					<div class="row table basic">
						<table class="table">
							<thead>
								<tr>
									<th>목적지</th>
									<th>실목적지</th>
									<th>방문목적</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input class="easyui-combobox" style="width: 80%;"
										data-options="panelHeight:'auto'"></td>
									<td><input class="easyui-combobox" style="width: 80%;"
										data-options="panelHeight:'auto'"></td>
									<td><input class="easyui-textbox" style="width: 80%;"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="section2" class="panel panel-success">
				<div class="panel-heading">방문자 등록</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-8">
							<h4 style="border-left: 3px solid #3c763d; padding-left: 4px;">
								<b>방문자 정보</b>
							</h4>
						</div>
					</div>
					<div class="row table visitor">
						<table id="tb_visitor" class="table">
							<thead>
								<tr>
									<th><input id="chkAllVisitor" type="checkbox"></th>
									<th style="width: 40%;">성명</th>
									<th style="width: 50%;">연락처</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="section3" class="panel panel-warning">
				<div class="panel-heading">반입기기</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-8">
							<h4 style="border-left: 3px solid #8a6d3b; padding-left: 4px;">
								<b>반입기기 정보</b>
							</h4>
						</div>
					</div>
					<div class="row table device">
						<table id="tb_device" class="table">
							<thead>
								<tr>
									<th><input id="chkAllDevice" type="checkbox"></th>
									<th style="width: 30%;">기종</th>
									<th style="width: 30%;">제조사</th>
									<th style="width: 30%;">모델명</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="section4" class="panel panel-default">
				<div class="panel-heading">주차등록</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-8">
							<h4 style="border-left: 3px solid #333333; padding-left: 4px;">
								<b>차량 정보</b>
							</h4>
						</div>
					</div>
					<div class="row table parking">
						<table id="tb_parking" class="table">
							<thead>
								<tr>
									<th><input id="chkAllParking" type="checkbox"></th>
									<th style="width: 40%;">차량번호</th>
									<th style="width: 20%;">차종</th>
									<th style="width: 30%;">차량모델명</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<div style="float: right; margin-bottom:20%;">
				<button type="button" id="permission" class="btn btn-primary" onClick="location.href='javascript:vpermission()'">방문 신청 승인</button>
				<button type="button" id="return" class="btn btn-danger" onClick="location.href='javascript:vreturn()'">방문 신청 반려</button>
				<button type="button" class="btn btn-default" onClick="location.href='javascript:history.back()'">이전 페이지</button>
			</div>
	</div>
	</div>
	</div>
</div>
<form id="f_vper">
	<input type="hidden" id="com_permission" name="COM_NO" value="<%session.getAttribute("COM_NO"); %>">
	<input type="hidden" id="permissioner" name="CMNG_ID" value="<%session.getAttribute("CMNG_ID"); %>"><!-- 승인 담당자 정보 : 세션값을 그대로 사용 OR 다시 넘겨주기 -->
	<input type="hidden" id="hidden_permission" name="VISIT_PERMIT_ST" value="승인">
</form>
<form id="f_vret">
	<input type="hidden" id="com_return" name="COM_NO" value=company_name>
	<input type="hidden" id="permissioner" name="CMNG_ID" value=user_id><!-- 승인 담당자 정보 -->
	<input type="hidden" id="hidden_return" name="VISIT_PERMIT_ST" value="반려">
</form>
	<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>