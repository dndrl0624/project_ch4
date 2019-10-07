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
<title>방문 신청 조회 페이지</title>
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

// 검색방법 콤보박스로 textbox name값 변경
$(document).ready(function(){
	$('#SearchType').combobox({
		onChange: function(newVal){
			$("#searchText").textbox('textbox').attr('name',newVal);
			$("#searchText").attr('textboxname',newVal);
			var inputHidden = $("#searchText").textbox('textbox').parent().find('input:last');
			inputHidden.attr('name',newVal);
// 			$("span.textbox > .textbox-value").attr('name',newVal);
		}
	});
	
/* 부트스트랩 테이블 */
	$("#tb_sv").bootstrapTable({
		 	columns:[
		         {field:'VISIT_NO',title:'신청번호'}
		         ,{field:'VISIT_PERMIT_ST',title:'승인상태'}
		         ,{field:'VISIT_APPLY_NAME',title:'신청자명'}
		         ,{field:'VISIT_APPLY_HP',title:'신청자연락처'}
		         ,{field:'VISIT_DAYE',title:'신청일자'}
		         ,{field:'VISIT_DESTI',title:'목적지'}/* 현재위치 : 내부 외부 사내 .. */
		   	 ]
			,url:'/project_ch4_pojo/json/searchVisitorJson.json'// 실제 사용할 URL 변경하기  : company/applyVisitList.ch4
			,dataType: "json"
			,success: function(result){
				$("#tb_sv").bootstrapTable('load',result);
			}
			,onLoadError: function(status,jqXHR){
				alert("error");
			}
			,pagination:'true'//페이지 네이션
			,paginationPreText:"Previous"
		    ,paginationNextText:"Next"
		    ,pageSize:10//기본 페이지 사이즈
		    ,pageList:[10, 15, 20, 30] //칸수
			,onDblClickRow : function(row, $element, field) {
				//테이블에서 일련번호 칸에 들어간 정보 가져오기
				var choo = $element.find('td').eq(0).text();
				//alert(choo);
				//디테일 페이지로 이동
				 location.href="/project_ch4_pojo/View/company/manager/Manger_DetailVisitor.jsp?VISIT_NO="+choo
				 // 실제 사용할 URL 변경하기  :
		}
	});
//승인상태 변경 검색 이벤트
	$("#GMNG_CONFM").combobox({
		onChange: function(newVal){
			//alert("work");
			$.ajax({
				type:'post'
				,url:'/project_ch4_pojo/json/searchVisitorJson.json'/* 실제 사용할 URL 변경하기  : company/???.ch4 */
				,dataType: "json"
				,data :$("#f_search").serialize()
				,success: function(data){
					$("#tb_sv").bootstrapTable('load',data);
				}
			});
		}
	});
	
//신청일 변경 검색 이벤트
	$("#startdate").datebox({
		onSelect: function(date){
				$.ajax({
					type:'post'
					,url:'/project_ch4_pojo/json/searchVisitorJson.json'/* 실제 사용할 URL 변경하기  : company/???.ch4 */
					,dataType: "json"
					,data :$("#f_search").serialize()
					,success: function(data){
						$("#tb_sv").bootstrapTable('load',data);
					}
				});
			}
	});
	$("#closedate").datebox({
		onSelect: function(date){
				$.ajax({
					type:'post'
					,url:'/project_ch4_pojo/json/searchVisitorJson.json'/* 실제 사용할 URL 변경하기  : company/???.ch4 */
					,dataType: "json"
					,data :$("#f_search").serialize()
					,success: function(data){
						$("#tb_sv").bootstrapTable('load',data);
					}
				});
			}
	});
	
});

/* 검색버튼 기능 */
function btn_search(){
/* 전화번호 형식 맞춰주기 */
//alert($("#SearchType").combobox('getValue'));
// 	if($("#SearchType").combobox('getValue')=="VISITOR_HP"||$("#SearchType").combobox('getValue')=="VISIT_APPLY_HP"){
// 		var hp = $("#searchText").textbox('getValue');
// 		if(-1==hp.indexOf("-")){
// 			var telA = hp.substring(0,3);
// 			var telB = hp.substring(4,8);
// 			var telC = hp.substring(8);
// 			//alert(telA);
// 			hp =telA+"-"+telB+"-"+telC;
// 			$("#searchText").textbox('setValue',hp);
// 		}
// 	}
	/* 검색 조건을 통해 재출력 */
	$.ajax({
		type:'post'
		,url:'/project_ch4_pojo/json/searchVisitorJson.json'/* 실제 사용할 URL 변경하기  : company/applyVisitList.ch4 */
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
			<div id="collapse1" class="panel-collapse collapse in">
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
			<div id="collapse2" class="panel-collapse collapse">
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
	<div style="padding-left:200px">
		<div style="margin:30px 20px 10px 0px;font-size:35px;width: 70%;float: left;">방문 신청 조회</div>
		<%@ include file="../../CommonForm/logout.jsp"%>
	</div>
	</div>
<!-- 검색 툴바 -->
	<div class="col-lg-12">
	<div style="padding-left:200px;  margin-top: 120px;">
<form id="f_search">
<input type="hidden" name="COM_NO" value="<% session.getAttribute("COM_NO"); %>">
	<!-- 검색 타입 설정 -->
		<div class='col-sm-2' style="margin-left:20px;">
			<select class="easyui-combobox" id="SearchType" name='SearchType' label="검색방법" labelPosition="left" style="width:100%;">
				<option value="VISI_APPLY_NAME" selected>신청자명</option>
				<option value="VISITOR_NAME">방문자명</option>
				<option value="VISIT_DESTI">목적지</option>
				<option value="VISIT_NO">신청번호</option>
			</select>
		</div>
		
			<!-- 검색창 : 콤보박스에 의한 분기 -->
			<!-- 텍스트 박스에 대해 name값 변경 : 처음 값은 방문자명 // onChange 이벤트로 Name속성을 바꾸어 주기 -->
		<div class='col-sm-2'>
			<input class="easyui-textbox" id="searchText" name="VISITOR_NAME" style="width:150px;">
			<a class="easyui-linkbutton" type="button" data-options="iconCls:'icon-search'" onclick="btn_search()"></a>
		</div>
		
		<div class='col-sm-2' style="margin-left:30px; margin-right: 30px; padding: 0;">
			<select class="easyui-combobox" id="state" name="GMNG_CONFM" label="승인상태" labelPosition="left" style="width:100%;">
				<option value="" selected>전체</option>
				<option value="결재중">결재중</option>
				<option value="승인">승인</option>
				<option value="반려">반려</option>
				<option value="취소">취소</option>
			</select>
		</div>
		
<!-- 날짜 검색 -->
		<div  class='col-sm-4' style="padding: 0px;">
			<div class='col-sm-6'>
				<span style="font-weight: bold;">신청일</span>
				<input class="easyui-datebox" id="startdate" name="visit_apply_date1"style="width:120px;">
			</div>
			<div class='col-sm-1'>
				<h4 align="center">
					<b>~</b>
				</h4>
			</div>
			<div class='col-sm-4' style="padding: 0px;">
				<input class="easyui-datebox" id=closedate name="visit_apply_date2" style="width:120px;">
			</div>
		</div>
</form>

<!-- 부트 테이블 : search_ResultVisitor 참조 -->
	<div style="width: 86%;">
		<table class="table table-bordered table-hover" id="tb_sv" >
		</table>
	</div>
	
	</div>
	</div>
</div>

<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>

</body>
</html>