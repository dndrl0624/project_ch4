<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>물품반입 현황 조회 페이지</title>
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
	$("#tb_logGood").bootstrapTable({
	    columns:[
	         {field:'GMNG_NO',title:'반입번호'}
	         ,{field:'APLG_NAME',title:'신청자명'}
	         ,{field:'APLG_HP',title:'연락처'}
	         ,{field:'COM_NAME',title:'방문지'}
	         ,{field:'APLG_DESTI',title:'목적지'}
	         ,{field:'APLG_REASON',title:'반입상'}
	         ,{field:'APLG_TRANS_DATE',title:'반입일자'}
	         ,{field:'GMNG_NAME',title:'물품명'}
	         ,{field:'GMNG_TYPE',title:'물품종류'}
	         ,{field:'GMNG_QUAN',title:'물품수량'}
	         ,{field:'GMNG_NOTES',title:'비고'}
	    ]
	    ,onLoadError: function(status,jqXHR){
	    	alert("error");
	    }
	    ,pagination:'true'//페이지 네이션
	    ,paginationPreText:"Previous"
	    ,paginationNextText:"Next"
	    ,pageSize:10//기본 페이지 사이즈
	    ,pageList:[2, 4, 6, 8] //칸수
	    ,onClickRow:function(row,$element,field){
	       //$element.attr('data-index',10)
	       $element.toggleClass('single-select');//로우 클릭했을 때 색 변함.
	       //alert(row.N_NO);
	     }
	    ,onDblClickRow:function(row,$element,field){
	       alert("상세조회 모달");
	     }
	});
});
/* 버튼 검색 */
function search(){
	$.ajax({
		url: "/project_ch4_pojo/json/logGoodsJson.json"
		,dataType: "json"
		,success: function(result){
			$("#tb_logGood").bootstrapTable('load',result);
		}
	});
}
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
		<!-- 
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
		-->
	</div>
</aside>

<!-- Content -->
<div class="mainContent">
<!-- 페이지 이름 / 환영+ 로그아웃 버튼 -->
	<div class="col-lg-12">
		<div style="margin:30px 20px 10px 0px;font-size:35px;width: 50%;float: left;"> 물품 반입 현황 조회 </div>
		<%@ include file="../../CommonForm/logout.jsp"%>
	</div>
<!-- 검색 조건 설정 -->
	<div class='col-sm-2'>
	<!-- 검색 타입 설정 --><br>
		<select class="easyui-combobox" id="SearchType" name='SearchType' label="검색방법" labelPosition="left" style="width:100%;">
			<option value="VISITOR_NAME">방문자명</option>
			<option value="VISITOR_HP">연락처</option>
			<option value="COM_NAME">회사명</option>
		</select>
	</div>
	<div class='col-sm-2'>
		<!-- 검색창 : 콤보박스에 의한 분기 --><br>
		<!-- 텍스트 박스에 대해 name값 변경 : 처음 값은 방문자명 // onChange 이벤트로 Name속성을 바꾸어 주기 -->
		<input class="easyui-textbox" id="searchText" name="VISITOR_NAME" style="width:230px;height:25px;" data-options="prompt:'필요한 정보를 입력하세요'">
	
	</div>
	<div class='col-sm-2'><br>
		<select class="easyui-combobox" id="state" name="state" label="현황" labelPosition="left" style="width:100%;">
			<option value="all" selected>전체</option>
			<option value="beforemove">미반입</option>
			<option value="aftermove">반입완료</option>
			<option value="return">반려</option>
		</select>
	</div>
	<div  class='col-sm-4'>
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
<!-- 검색 버튼 -->
	<div  class='col-sm-1'>
		<button type="button" class="btn btn-success" onclick="search()"
		style="margin-top: 5px;margin-bottom: 15px;float: bottom;">Search</button>
	</div>
	</div>
	
<!-- 부트 테이블 : search_ResultVisitor 참조-->
	<div class="row">
		<table class="table table-bordered table-hover" id="tb_logGood" >
<!--                <thead style=""> -->
		</table>
	</div>
	
</div>
<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>

</body>
</html>