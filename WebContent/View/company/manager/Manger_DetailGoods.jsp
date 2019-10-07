<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user_id = "";
	String user_name = "";
	String company_no = "";
	String company_name = "";
	user_id = (String)session.getAttribute("CMNG_ID");
	user_name = (String)session.getAttribute("CMNG_NAME");
	company_no = (String)session.getAttribute("COM_NO");
	company_name = (String)session.getAttribute("COM_NAME");
	if(user_id==null||user_id.equals("")){
		//로그인 페이지로 돌아가기
		response.sendRedirect("loginform.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>물품 반입 신청 디테일</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<!-- CSS Style Import --> 
<link rel="stylesheet" type="text/css" href="/project_ch4_pojo/Style/css/maxCss.css">
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
	function gpermission(){
		$("#f_gper").attr("method","post");
		$("#f_gper").attr("action","company/mngPermit.ch4?aplg_no="+(반출) );
		$("#f_gper").submit();
	}
//신청 반려 처리
	function greturn(){
		$("#f_gret").attr("method","post");
		$("#f_gret").attr("action","company/mngPermit.ch4?aplg_no="+(반출) );
		$("#f_gret").submit();
	}
</script>
</head>
<link rel="stylesheet" type="text/css" href="/project_ch4_pojo/Style/css/maxCss.css">
<body>
<!-- java script -->
<script type="text/javascript">
<%@ include file="../../CommonForm/maxJavascript.jsp"%>
</script>
<%@ include file="../../CommonForm/Top.jsp"%> 

<!-- Side Bar -->
<aside>
	<div class="panel-group" style="margin-top:90px">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/manager/Manager_Main.jsp">
					<i class="fa fa-home" aria-hidden="true"></i>메인페이지</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse1">
					<i class="fa fa-users" aria-hidden="true"></i>방문 신청 조회</a>
				</h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse">
				<div class="panel-body">
					<a  href="/project_ch4_pojo/View/company/manager/Manager_SearchVisitor.jsp">
					<i class="fa fa-search-plus" aria-hidden="true"></i>방문 신청 조회</a><br> 
					<a  href="/project_ch4_pojo/View/company/manager/Manager_LogVisitor.jsp">
					<i class="fa fa-list-alt" aria-hidden="true"></i>방문현황 조회</a><br> 
				</div>
			</div>
		</div>
		
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse2">
					<i class="fa fa-truck" aria-hidden="true"></i>물품 반입 신청 조회</a>
				</h4>
			</div>
			<div id="collapse2" class="panel-collapse collapse in">
				<div class="panel-body">
					<a  href="/project_ch4_pojo/View/company/manager/Manager_SearchGoods.jsp">
					<i class="fa fa-search-plus" aria-hidden="true"></i>반입 신청 조회</a><br> 
					<a  href="/project_ch4_pojo/View/company/manager/Manager_LogGoods.jsp">
					<i class="fa fa-list-alt" aria-hidden="true"></i>반입 현황 조회</a><br> 
				</div>
			</div>
		</div>
	</div>
</aside>

<div class="mainContent" >
<!-- 페이지 이름 / 환영+ 로그아웃 버튼 -->
	<div class="col-lg-12" style="padding-bottom:3%">
		<div class="row">
			<div style="margin:30px 0px 10px 16%;">
			<b style="font-size:35px;width: 50%;float: left;">물품 반입 상세 조회 (승인자용)</b>
			<%@ include file="../../CommonForm/logout.jsp"%>
			</div>
		</div>
	</div>
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
									<th>실반입장소</th>
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
			<div id="section5" class="panel panel-danger">
				<div class="panel-heading">반입 물품</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-8">
							<h4 style="border-left: 3px solid #8a6d3b; padding-left: 4px;">
								<b>반입물품 정보</b>
							</h4>
						</div>
					</div>
					<div class="row table goods">
						<table id="tb_goods" class="table">
							<thead>
								<tr>
									<th><input id="chkAllGoods" type="checkbox"></th>
									<th style="width: 30%;">반입물품명</th>
									<th style="width: 30%;">물품종류</th>
									<th style="width: 30%;">물품수량</th>
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
				<button type="button" id="btn_permission" class="btn btn-primary" onClick="location.href='javascript:gpermission()'">반입 신청 승인</button>
				<button type="button" id="btn_return" class="btn btn-danger" onClick="location.href='javascript:greturn()'">반입 신청 반려</button>
				<button type="button" class="btn btn-default" onClick="location.href='javascript:history.back()'">이전 페이지</button>
			</div>
		</div>
</div>
<form id="f_gper">
	<input type="hidden" id="com_permission" name="COM_NO" value="(String)session.getAttribute('COM_NO')>">
	<input type="hidden" id="permissioner" name="CMNG_ID" value="<%session.getAttribute("CMNG_ID"); %>"><!-- 승인 담당자 정보 : 세션값을 그대로 사용 OR 다시 넘겨주기 -->
	<!-- 승인 목적지 값 넣어주기 -->
	<input type="hidden" id="hidden_desti" name="?desti" value="콤보박스 value">
	<input type="hidden" id="hidden_permission" name="APLG_PERMIT_ST" value="승인">
</form>
<form id="f_gret">
	<input type="hidden" id="com_return" name="COM_NO" value=company_name>
	<input type="hidden" id="permissioner" name="CMNG_ID" value="<%session.getAttribute("CMNG_ID"); %>"><!-- 승인 담당자 정보 : 세션값을 그대로 사용 OR 다시 넘겨주기 -->
	<!-- 승인 목적지 값 넣어주기 -->
	<input type="hidden" id="hidden_desti" name="?desti" value="콤보박스 value">
	<input type="hidden" id="hidden_return" name="APLG_PERMIT_ST" value="반려">
</form>
	<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>