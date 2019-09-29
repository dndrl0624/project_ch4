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
//combobox 직접입력 방지
$.fn.combobox.defaults.editable = false

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


/* 테이블 데이터 */
$(document).ready(function(){
	$("#tb_lg").bootstrapTable({
		height:'672'
		,pagination:'true'
		,toolbarAlign : 'right'
		,url: "/project_ch4_pojo/json/logGoodsJson.json"
		,onLoadError: function(status,jqXHR){
	    	alert("error");
	    }
	    ,pageSize:11//기본 페이지 사이즈
	    ,pageList:[2, 4, 6, 8] //칸수
	    ,onClickRow:function(row,$element,field){
	       //$element.attr('data-index',10)
	       $element.toggleClass('single-select');//로우 클릭했을 때 색 변함.
	       //alert(row.N_NO);
	     }
	    ,onDblClickRow:function(row,$element,field){
	    	 alert("어떠한 기능을 넣을 것인가요? 모달 조회 OR 아무것도 없이");
		    // 실제 사용할 URL 변경하기  : company/@@@@.ch4
	     }
	});
});
/* 버튼 검색 */
function search(){
	/* 전화번호 형식 맞춰주기 */
	//alert($("#SearchType").combobox('getValue'));
	if($("#SearchType").combobox('getValue')=="VISITOR_HP"||$("#SearchType").combobox('getValue')=="VISIT_APPLY_HP"){
		var hp = $("#searchText").textbox('getValue');
		if(-1==hp.indexOf("-")){
			var telA = hp.substring(0,3);
			var telB = hp.substring(4,8);
			var telC = hp.substring(8);
			//alert(telA);
			hp =telA+"-"+telB+"-"+telC;
			$("#searchText").textbox('setValue',hp);
		}
	}
	/* 검색 조건을 통해 재출력 */
	$.ajax({
		type:'post'
		,url:'/project_ch4_pojo/json/logGoodsJson.json'/* 실제 사용할 URL 변경하기  : company/applyVisitList.ch4 */
		,dataType: "json"
		,data :$("#f_search").serialize()
		,success: function(data){
			$("#tb_sv").bootstrapTable('load',data);
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
<form id="f_search">
	<div class='col-sm-2'>
	<!-- 검색 타입 설정 --><br>
		<select class="easyui-combobox" id="SearchType" name='SearchType' label="검색방법" labelPosition="left" style="width:'100%'">
			<option value="VISITOR_NAME" >방문자명</option>
			<option value="VISITOR_HP">연락처</option>
			<option value="VISIT_APPLY_NAME">신청자명</option>
			<option value="VISIT_APPLY_HP">신청자 연락처</option>
		</select>
	</div>
	<div class='col-sm-2'>
		<!-- 검색창 : 콤보박스에 의한 분기 --><br>
		<!-- 텍스트 박스에 대해 name값 변경 : 처음 값은 방문자명 // onChange 이벤트로 Name속성을 바꾸어 주기 -->
		<input class="easyui-textbox" id="searchText" name="VISITOR_NAME" style="width:230px;height:25px;" data-options="prompt:'필요한 정보를 입력하세요'">
	
	</div>
	<div class='col-sm-2'><br>
		<select class="easyui-combobox" id="state" name="state" label="현황" labelPosition="left" style="width:100%;">
			<option value="tryAgain" selected>전체</option>
			<option value="미반입">미반입</option>
			<option value="반입완료">반입완료</option>
			<option value="반려">반려</option>
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
</form>	
<!-- 부트 테이블 : search_ResultVisitor 참조-->
	<div class="row">
		<table class="table table-bordered table-hover" id="tb_lg" >
			<thead>
				<tr>
					<th data-field="GMNG_NO">반입번호</th>
					<th data-field="APLG_NAME">신청자명</th>
					<th data-field="APLG_HP">연락처</th>
					<th data-field="COM_NAME">방문지</th>
					<th data-field="APLG_DESTI">목적지</th>
					<th data-field="APLG_REASON">반입사유</th>
					<th data-field="APLG_TRANS_DATE">반입일자</th>
					<th data-field="GMNG_NAME">물품명</th>
					<th data-field="GMNG_TYPE">물품종류</th>
					<th data-field="GMNG_QUAN">물품수량</th>
					<th data-field="GMNG_NOTES">비고</th>
				</tr>
			</thead>
		</table>
	</div>
	
</div>
<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>

</body>
</html>