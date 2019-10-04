<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>반입 현황 관리 미 작성</title>
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
	$("#tb_logGoods").bootstrapTable({
		toolbar:'#toolbar'
		,url:'/project_ch4_pojo/json/logGoodsJson.json'
		,pagination : 'true'
		,onClickRow : function(row, $element, field) {
					$element.toggleClass('single-select');//로우 클릭했을 때 색 변함.
		}
	});
	$("#search").click(function() {
		$.ajax({
			type:'get'
			,url:'/project_ch4_pojo/json/logGoodsJson.json'/* 실제 사용할 URL 변경하기  : company/???.ch4 */
			,dataType: "json"
			,data :$("#f_log").serialize()
			,success: function(data){
				$("#tb_logGoods").bootstrapTable('load',data);
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
			<option value="CONFM_NAME">반입물품명</option>
		</select>
	</div>
	<div class="col-lg-2" style="padding: 0px;">
		<!-- 검색창 : 콤보박스에 의한 분기 --><br>
		<!-- 텍스트 박스에 대해 name값 변경 : 처음 값은 방문자명 // onChange 이벤트로 Name속성을 바꾸어 주기 -->
		<input class="easyui-textbox" id="searchText" name="VISITOR_NAME" style="widtd:230px;" data-options="prompt:'필요한 정보를 입력하세요'">
	
	</div>
	<div class="col-lg-2" style="padding: 0px;"><br>
		<select class="easyui-combobox" id="state" name="CONFM_STATE" label="반입현황" labelPosition="left" style="width:80%;">
			<option value="미반입" selected>미반입</option>
			<option value="반입완료">반입완료</option>
			<option value="취소">취소</option>
			<option value="오류">오류</option>
		</select>
	</div>
	<div class="col-lg-3" style="padding: 0px;">
<!-- 날짜 검색 -->
			<div class='col-sm-4'>
				<span style="font-weight: bold;">시작일</span><br>
				<input class="easyui-datebox" id="date2" style="width:120px;">
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
	<div class='col-sm-1' style="padding-left: 40px;">
		<button id="search" class="btn btn-primary" >search</button>
	</div>
	
</div>

<!-- 부트 테이블 : search_ResultVisitor 참조-->	<!-- 처리내용 : 입장 퇴장 --><!-- 현재위치 : 내부 외부 사내 .. -->
<div style="width: 84%;">
	<table class="table table-bordered table-hover" id="tb_logGoods" >
		<thead>
			<tr>
				<th data-field="CONFM_NO">물품번호</th>
				<th data-field="CONFM_STATE">반입현황</th>
				<th data-field="CONFM_TRANS_DATE">반입일자</th>
				<th data-field="CONFM_TRANS_TIME">반입시간</th>
				<th data-field="CONFM_NAME">물품명</th>
				<th data-field="CONFM_TYPE">물품종류</th>
				<th data-field="CONFM_QUAN">신청갯수</th>
				<th data-field="CONFM_TRANS_QUAN">반입개수</th>
				<th data-field="ERR_LOG">오류내역</th>
			</tr>
		</thead>
	</table>
</div>
	
</div>	
<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>