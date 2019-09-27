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
/* 검색방법 콤보박스로 textbox name값 변경 */
$(document).ready(function(){
	$('#SearchType').combobox({
		onChange: function(newVal){
			$("#searchText").textbox('textbox').attr('name',newVal);
			$("#searchText").attr('textboxname',newVal);
			$("span.textbox > .textbox-value").attr('name',newVal);
		}
	});
});

//combobox 직접입력 방지
$.fn.combobox.defaults.editable = false

/* 테이블 데이터 */
$(document).ready(function(){
	$("#tb_logVisitor").bootstrapTable({
		height:'630'
		,toolbar:'#toolbar'
		,url:'/project_ch4_pojo/json/logVisitorJson.json'
		,pagination : 'true'
		,onClickRow : function(row, $element, field) {
					$element.toggleClass('single-select');//로우 클릭했을 때 색 변함.
		}
	});
	$("#search").click(function() {
		var check = $("#SearchType").val();
		var searchT = $("#searchText").val();
		
		var st = $("#state").val();
		var date1 = $("#datepicker1").val();
		var date2 = $("#datepicker2").val();
		
//		alert(check);
//		alert(searchT);
// 		alert(st);
// 		alert(date1);
// 		alert(date2);

		$("#tb_logVisitor").bootstrapTable('refreshOptions', {
			filterOptions : {
				filterAlgoritdm : 'or'
			}
		});//			DESTI_NAME(field) : nameSearch(var)
		$("#tb_logVisitor").bootstrapTable('filterBy', {
// 			if(check==VISITOR_NAME){
// 				CONFM_NAME : searchT
// 			}
// 			else if(check==VISITOR_HP){
// 				CONFM_HP : searchT
// 			}
// 			else if(check==COM_NAME){
// 				VISIT_DESTI : searchT
// 			}
// 			VISIT_DATE : date1
		});
// 상태 콤보박스 값으로 필터링
		var now = $("#state").val();
		alert(now);
		$("#tb_logVisitor").bootstrapTable('refreshOptions',{
			filterOptions:{
				filterAlgorithm : 'or'
			}
		});
		$("#tb_logVisitor").bootstrapTable('filterBy',{
			CMG_NOTES: now
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
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/info/Info_Notice.jsp">
					<i class="fa fa-search-plus" aria-hidden="true"></i>안내 공지</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/info/Info_ManageLog.jsp" style="text-decoration: underline;">
					<i class="fa fa-list-alt" aria-hidden="true"></i>방문자현황관리</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/info/Info_ManageKiosk.jsp">
					<i class="fa fa-search-plus" aria-hidden="true"></i>키오스크 관리</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/info/Info_ManageDesti.jsp">
					<i class="fa fa-list-alt" aria-hidden="true"></i>옥내 목적지 관리</a>
				</h4>
			</div>
		</div>
	</div>
</aside>

<!-- content -->
<div class="mainContent">
<!-- 페이지 이름 / 환영+ 로그아웃 버튼 -->
	<div class="col-lg-12">
		<div style="margin:30px 20px 10px 0px;font-size:35px;widtd: 50%;float: left;"> 방문/반입 현황 조회 </div>
		<%@ include file="../../CommonForm/logout.jsp"%>
	</div>
	
<!-- 검색 조건 설정 -->
<div id="toolbar">
  <div class="form-inline" role="form">
    <div class="form-group">
	<div class='col-sm-2'>
	<!-- 검색 타입 설정 --><br>
		<select class="easyui-combobox" id="SearchType" name='SearchType' label="검색방법" labelPosition="left" style="width:90%;">
			<option value="">선택하세요</option>
			<option value="VISITOR_NAME">방문자명</option>
			<option value="VISITOR_HP">연락처</option>
			<option value="COM_NAME">회사명</option>
		</select>
	</div>
	<div class='col-sm-2'>
		<!-- 검색창 : 콤보박스에 의한 분기 --><br>
		<!-- 텍스트 박스에 대해 name값 변경 : 처음 값은 방문자명 // onChange 이벤트로 Name속성을 바꾸어 주기 -->
		<input class="easyui-textbox" id="searchText" name="VISITOR_NAME" style="widtd:230px;" data-options="prompt:'필요한 정보를 입력하세요'">
	
	</div>
	<div class='col-sm-2'><br>
		<select class="easyui-combobox" id="state" name="state" label="현황" labelPosition="left" style="width:80%;">
			<option value="전체" selected>전체</option>
			<option value="사내">사내</option>
			<option value="외출">외출</option>
			<option value="방문종료">방문종료</option>
		</select>
	</div>
	<div  class='col-sm-5'>
<!-- 날짜 검색 -->
	<div class="form-group">
		<div class='col-sm-5'>
			<span style="font-weight: bold;">시작일</span>
			<div class="form-group">
				<div class='easyui-datebox' id="datepicker1" >
					<input type='text' class="form-control" name="openDate" required="required" /> 
					<span class="input-group-addon"> 
						<span class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
		</div>
		<div class='col-sm-1'>
			<h4 align="center"><br>
				<b>~</b>
			</h4>
		</div>
		<div class='col-sm-5'>
			<span style="font-weight: bold;">종료일</span>
			<div class="form-group">
				<div class='easyui-datebox' id="datepicker2">
					<input type='text' class="form-control" name="closeDate" required="required" /> 
					<span class="input-group-addon"> 
						<span class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
		</div>
	</div>
	</div>
<!-- 검색 버튼 -->
	<div  class='col-sm-1'>
		<button id="search" class="btn btn-primary">search</button>
	</div>
	
	</div>
</div>
</div>

<!-- 부트 테이블 : search_ResultVisitor 참조-->	<!-- 처리내용 : 입장 퇴장 --><!-- 현재위치 : 내부 외부 사내 .. -->
	<div class="row">
		<table class="table table-bordered table-hover" id="tb_logVisitor" >
			<thead>
				<tr>
					<th data-field="CONFM_NO">방문번호</th>
					<th data-field="CMG_INOUT">처리시간</th>
					<th data-field="CMG_NOTESz">처리내용</th>
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