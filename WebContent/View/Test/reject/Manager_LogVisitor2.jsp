<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>방문 현황 조회 페이지</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<style type="text/css"> 
<%@ include file="/Style/css/CssStyle.css"%>
/* 사이드바 설정 */
aside {
    width: 15%;
    height: 80%;
    position: fixed;
    background: #2f323a;
    overflow: auto;
}
/* 사이드바 overflow 시 스크롤바 안보이게 하기 */
aside::-webkit-scrollbar { 
    display: none; 
}

/* 메인 페이지 프레임 구간 설정 */
.mainContent {
	margin:30px 20px 10px 17%;
}

/* 테이블 제목 구간 가운데 정렬 */
th {
	text-align: center;
}

/* Modal */
 .modal {
     display: none;
     overflow: auto;/* 자동 스크롤 */
 }
 /* Modal 본문 */
 .modal-content {
     background-color: #fefefe;
     border: 1px solid #888;
     width: 100%; /* 화면 크기에 반응 */                          
 }
 /* 닫기 버튼 */
 .close {
     color: #aaa;
     float: right;
     font-size: 28px;
     font-weight: bold;
 }
 .close:hover, .close:focus {
     color: black;
     text-decoration: none;
     cursor: pointer;
 }

</style>


</head>
<body>
<form id="f_test" action="a.jsp">
	<input class="easyui-textbox" id="search2" name="s2" style="width:230px;height:25px;">
</form>
<script type="text/javascript">
	$(document).ready(function(){
		$('#SearchType').combobox({
			onChange: function(newVal,oldVal){
				$("#search").textbox('textbox').attr('name',newVal);
				$("#search").attr('textboxname',newVal);
				$("span.textbox > .textbox-value").attr('name',newVal);
				//alert($("span.textbox > .textbox-value").attr('name'));
			}
		});
	});
</script>
<%@ include file="../../CommonForm/Top.jsp"%>

<!-- Side Bar -->
<aside>
	<div class="panel-group" style="margin-top:90px">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/manager/Manager_Main.jsp">메인페이지</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse1">방문 신청 조회</a>
				</h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse in">
				<div class="panel-body">
					<a  href="/project_ch4_pojo/View/company/manager/Manager_SearchVisitor.jsp">방문 신청 조회</a><br> 
					<a  href="/project_ch4_pojo/View/company/manager/Manager_LogVisitor.jsp">방문현황 조회</a><br> 
				</div>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse2">물품 반입 신청 조회</a>
				</h4>
			</div>
			<div id="collapse2" class="panel-collapse collapse">
				<div class="panel-body">
					<a  href="/project_ch4_pojo/View/company/manager/Manager_SearchGoods.jsp">반입 신청 조회</a><br> 
					<a  href="/project_ch4_pojo/View/company/manager/Manager_LogGoods.jsp">반입 현황 조회</a><br> 
				</div>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse3">안내데스크</a>
				</h4>
			</div>
			<div id="collapse3" class="panel-collapse collapse">
				<div class="panel-body">
					<a  href="/project_ch4_pojo/View/company/info/Info_Main.jsp">안내데스크 메인</a><br> 
					<a  href="/project_ch4_pojo/View/company/info/Info_Notice.jsp">안내데스크 공지</a><br> 
					<a  href="/project_ch4_pojo/View/company/info/Info_ManageLog.jsp">방문자 현황 관리</a><br> 
				</div>
			</div>
		</div>
	</div>
</aside>

<!-- Content -->
<div class="mainContent">
	<div style="margin:30px 20px 10px 0px;font-size:35px;">
	방문 현황 조회 페이지
	</div>
	<div class='col-sm-2'>
	<!-- 콤보 박스 : 처리결과 대해 -->
		<select class="easyui-combobox" name="permissionSearch" label="처리결과" labelPosition="left" style="width:100%;">
			<option value="all" selected>전체</option>
			<option value="permission">승인</option>
				<option value="return">반려</option>
			<option value="cancle">취소</option>
		</select>
	</div>
	<div class='col-sm-2'>
	<!-- 검색 타입 설정 -->
		<select class="easyui-combobox" id="SearchType" name='SearchType' label="검색방법" labelPosition="left" style="width:100%;">
			<option value="visitorName" selected>방문자명</option>
			<option value="visitorTel">연락처</option>
			<option value="visitorCompany">회사</option>
		</select>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="alert($('#SearchType').combobox('getValue'))">콤보박스Value확인용</a>
<!-- 검색창 : 콤보박스에 의한 분기 -->
		<!-- 텍스트 박스에 대해 name값 변경 -->
		<input class="easyui-textbox" id="search" name="visitorName" style="width:230px;height:25px;">
		<script>
		$('#visitorName').textbox({
		    buttonText:'Search',
		    iconCls:'icon-man',
		    iconAlign:'left'
		})
		</script>
	</div>
	<div  class='col-sm-4'>
<!-- 날짜 검색 -->
			<div class="form-group">
				<div class='col-sm-5'>
					신청 시작일
					<div class="form-group">
						<div class='easyui-datebox' id="datepicker1">
							<input type='text' class="form-control" name="openDate"
								required="required" /> <span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class='col-sm-1'>
					<h4 align="center">
						<br> <b>~</b>
					</h4>
				</div>
				<div class='col-sm-5'>
					신청종료일
					<div class="form-group">
						<div class='easyui-datebox' id="datepicker2">
							<input type='text' class="form-control" name="closeDate"
								required="required" /> <span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class='col-sm-1'>
				<button type="button" class="btn btn-success"
					style="margin-top: 5px; margin-bottom: 15px; float: bottom;">Search</button>
			</div>
		</div>
	

<!-- 검색 결과 테이블 -->
<table style="width: 100%;margin-top:20px;" border="1">
	<thead style="font-size:20px;">
	<tr>
		<th>신청번호</th>
		<th>현재 위치</th>
		<th>방문자명</th>
		<th>방문지</th>
		<th>목적지</th>
		<th>방문자 연락처</th>
		<th>방문유형</th>
		<th>방문일자</th>
	</tr>
	</thead>
<!-- ========================================================================================================== -->
<!-- 1. if  : 검색결과가 없습니다 / 검색결과 보여주기 -->
<!-- 2. for : 모든 검색결과 보여주기 -->
	<tbody>
	
	<tr>
		<td colspan= "10" style="text-align: center;font-size:20px;font-weight: bold;text-decoration: underline;height:100px;">검색결과가 없습니다</td>
	</tr>
	
	<tr style="height:30px;">
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
	</tr>
	
	<tr>
		<td colspan= "10" id="modalopen" data-toggle="modal" data-target="#detailModal"
		style="text-align: center;font-size:20px; font-weight: bold;text-decoration: underline;height:100px;" >
		상세정보 예시</td>
	</tr>
	
	</tbody>
</table>

</div>

<!-- Modal -->
	<div class="modal fade" id="detailModal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h1 class="modal-title" style="text-align: center;font-weight: bold;">방문 현황 상세 조회</h1>
				</div>
				<div class="modal-body">
					<div class="row">
						<!-- <!-- -----------------창 고정 및 스타일---------------------------------------- -->
						<div class="col-sm-3" id="myScrollspy" style="text-align: center;">
							<ul class="nav nav-pills nav-stacked">
								<li class="active"><a href="#section1">기본 방문정보</a></li>
								<li><a href="#section2">방문자 등록</a></li>
								<li><a href="#section3">반입기기</a></li>
								<li><a href="#section4">주차등록</a></li>
							</ul>
						</div>
						<div class="col-sm-9">
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
									<h4 style="margin-bottom: 10px; border-left: 3px solid #31708f; padding-left: 4px;">
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
												<td>
													<input id="visit_date1" class="easyui-datebox" style="width: 30%; height: 100%"> &emsp;&emsp;
													<span>~</span>&emsp;&emsp;
													<input id="visit_date2" class="easyui-datebox" style="width: 30%; height: 100%">
												</td>
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
													<th>담당자</th>
													<th>방문목적</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input class="easyui-combobox" style="width: 80%;"
														data-options="panelHeight:'auto'"></td>
													<td><input class="easyui-textbox" style="width: 80%;"></td>
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
											<h4
												style="border-left: 3px solid #3c763d; padding-left: 4px;">
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
											<h4
												style="border-left: 3px solid #8a6d3b; padding-left: 4px;">
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
											<h4
												style="border-left: 3px solid #333333; padding-left: 4px;">
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
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" id="change" class="btn btn-warning">방문 신청 변경</button>
					<button type="button" id="permission" class="btn btn-primary">방문 신청 승인</button>
					<button type="button" id="return" class="btn btn-danger">방문 신청 반려</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
<!-- java script -->

</body>
</html>