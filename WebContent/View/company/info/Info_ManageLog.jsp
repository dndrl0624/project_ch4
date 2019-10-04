<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>방문현황 관리</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<link rel="stylesheet" type="text/css" href="/project_ch4_pojo/Style/css/maxCss.css">
</head>
<body>
<script type="text/javascript">
//combobox 직접입력 방지
$.fn.combobox.defaults.editable = false
//datebox 직접입력 방지
$.fn.datebox.defaults.editable = false

/* 검색방법 콤보박스로 textbox name값 변경 */
$(document).ready(function(){
	$('#SearchType').combobox({
		onChange: function(newVal){
			$("#searchText").attr('textboxname',newVal);
			$("#searchText").textbox('textbox').attr('name',newVal);
			var inputHidden = $("#searchText").textbox('textbox').parent().find('input:last');
			inputHidden.attr('name',newVal);
// 			$("span.textbox > .textbox-value").attr('name',newVal);
		}
	});
});

/* 테이블 데이터 */
$(document).ready(function(){
	$("#tb_logVisitor").bootstrapTable({
		toolbar:'#toolbar'
		,url:'/project_ch4_pojo/json/logVisitorJson.json'
		,pagination : 'true'
	});
	$("#search").click(function() {
		$.ajax({
			type:'post'
			,url:'/project_ch4_pojo/json/logVisitorJson.json'/* 실제 사용할 URL 변경하기  : company/???.ch4 */
			,dataType: "json"
			,data :$("#f_log").serialize()
			,success: function(data){
				$("#tb_logVisitor").bootstrapTable('data',data);
			}
		});
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
					<a href="/project_ch4_pojo/View/company/info/Info_Main.jsp">
					<i class="fa fa-home" aria-hidden="true"></i>메인페이지</a>
				</h4>
			</div>
		</div>
<!-- 		<div class="panel panel-info"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				<h4 class="panel-title"> -->
<!-- 					<a href="/project_ch4_pojo/View/company/info/Info_Notice.jsp"> -->
<!-- 					<i class="fa fa-search-plus" aria-hidden="true"></i>안내 공지</a> -->
<!-- 				</h4> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/info/Info_ManageLog.jsp">
					<i class="fa fa-list-alt" aria-hidden="true"></i>방문자현황관리</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/info/Info_ManageGLog.jsp">
					<i class="fa fa-truck" aria-hidden="true"></i>반입현황관리</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/info/Info_ManageCompany.jsp">
					<i class="fa fa-search-plus" aria-hidden="true"></i>종합 관리</a>
				</h4>
			</div>
		</div>
	</div>
</aside>

<!-- content -->
<div class="mainContent">
<!-- 페이지 이름 / 환영+ 로그아웃 버튼 -->
	<div class="col-lg-12" style="margin-bottom: 5%">
		<div style="margin:30px 20px 10px 0px;font-size:35px;widtd: 50%;float: left;"> 방문자 현황 조회 </div>
		<%@ include file="../../CommonForm/logout.jsp"%>
	</div>
	
<!-- 검색 조건 설정 -->
<div class='col-lg-12' style="padding: 0px; margin-left: 2%;">
	<form id="f_log">
	<div class="col-lg-2" style="padding: 0px;">
	<!-- 검색 타입 설정 --><br>
		<select class="easyui-combobox" id="SearchType" name='SearchType' label="검색방법" labelPosition="left" style="width:90%;">
			<option value="">선택하세요</option>
			<option value="VISITOR_NAME">방문자명</option>
			<option value="VISITOR_HP">연락처</option>
		</select>
	</div>
	<div class="col-lg-2" style="padding: 0px;">
		<!-- 검색창 : 콤보박스에 의한 분기 --><br>
		<!-- 텍스트 박스에 대해 name값 변경 : 처음 값은 방문자명 // onChange 이벤트로 Name속성을 바꾸어 주기 -->
		<input class="easyui-textbox" id="searchText" name="VISITOR_NAME" style="widtd:230px;" data-options="prompt:'필요한 정보를 입력하세요'">
	
	</div>
	<div class="col-lg-2" style="padding: 0px;"><br>
		<select class="easyui-combobox" id="state" name="CMG_NOTES" label="현황" labelPosition="left" style="width:80%;">
			<option value="전체" selected>전체</option>
			<option value="방문중">방문중</option>
			<option value="외출">외출</option>
			<option value="방문종료">방문종료</option>
		</select>
	</div>
	<div class="col-lg-4" style="padding: 0px;">
<!-- 날짜 검색 -->
			<div class='col-sm-2'></div>
			<div class='col-sm-4'>
				<span style="font-weight: bold;">시작일</span><br>
				<input class="easyui-datebox" id="date1" style="width:120px;">
			</div>
			<div class='col-sm-1' style="padding: 0px;">
				<h4 align="left"><br>
					<b>~</b>
				</h4>
			</div>
			<div class='col-sm-5' style="padding: 0px;">
				<span style="font-weight: bold;">종료일</span><br>
				<input class="easyui-datebox" id="date2" style="width:120px;">
			</div>
	</div>
	</form>
<!-- 검색 버튼 -->
	<div class="col-lg-1" style="padding: 0px;margin-top: 15px;">
		<button id="search" class="btn btn-primary" >search</button>
	</div>
	
</div>

<!-- 부트 테이블 : search_ResultVisitor 참조-->	<!-- 처리내용 : 입장 퇴장 --><!-- 현재위치 : 내부 외부 사내 .. -->
<div class="col-lg-11">
	<table class="table table-bordered table-hover" id="tb_logVisitor" >
		<thead>
			<tr>
				<th data-field="CONFM_NO">방문번호</th>
				<th data-field="CMG_INOUT">처리시간</th>
				<th data-field="CMG_ENTRC">출입위치</th>
				<th data-field="CMG_NOTES">현재위치</th>
				<th data-field="CONFM_NAME">방문자명</th>
				<th data-field="CONFM_HP">연락처</th>
				<th data-field="COM_NAME">방문지</th>
				<th data-field="VISIT_DESTI">목적지</th>
				<th data-field="VISIT_TYPE">방문유형</th>
				<th data-field="VISIT_DATE">방문일자</th>
			</tr>
		</thead>
	</table>
</div>
	
</div>	
<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>