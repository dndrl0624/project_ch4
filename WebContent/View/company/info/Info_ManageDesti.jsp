<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>목적지 관리</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<link rel="stylesheet" type="text/css" href="/project_ch4_pojo/Style/css/maxCss.css">
</head>
<body>
<script type="text/javascript">
/* 테이블 데이터 */
$(document).ready(function(){
	$("#tb_desti").bootstrapTable({
	    columns:[
	         {field:'DESTI_NO',title:'일련번호'}
	         ,{field:'DESTI_NAME',title:'목적지명'}/* 이름 : 회의실, 인사과 */
	         ,{field:'DESTI_LOC',title:'위치'}/* 위치 : 410호,4층 5호... */
	         ,{field:'DESTI_NOTES',title:'비고'}/* 비고 : 이전,회의실,작업실,수리예정 */
	    ]
	    ,onLoadError: function(status,jqXHR){
	    	alert("error");
	    }
	    ,pagination:'true'//페이지 네이션
	    ,paginationPreText:"Previous"
	    ,paginationNextText:"Next"
	    ,pageSize:10//기본 페이지 사이즈
	    ,pageList:[10, 15, 20, 30] //칸수
	    ,onClickRow:function(row,$element,field){
	       $element.toggleClass('single-select');//로우 클릭했을 때 색 변함.
	     }
	    ,onDblClickRow:function(row,$element,field){
			var de_no = $element.find("td").eq(0).html();
			var de_name = $element.find("td").eq(1).html();
			var de_loc = $element.find("td").eq(2).html();
			var de_note = $element.find("td").eq(3).html();
			
			$("#DESTI_NO").textbox('setValue',de_no);
			$("#DESTI_NAME").textbox('setValue',de_name);
			$("#DESTI_LOC").textbox('setValue',de_loc);
			$("#DESTI_NOTES").textbox('setValue',de_note);
			
			$("#destiModal").modal('show');
	   	 }
	});
	$.ajax({
		url: "/project_ch4_pojo/json/desti.json"
		,dataType: "json"
		,success: function(result){
			$("#tb_desti").bootstrapTable('load',result);
		}
	});
});

/* 추가 버튼 기능 구현 */
function addDesti(){
	alert("새로넣어죠");
}

/* 삭제 버튼 기능 구현 */
function deletDesti(){
	alert("지워죠");
}

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
					<a href="/project_ch4_pojo/View/company/info/Info_ManageLog.jsp">
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
					<a href="/project_ch4_pojo/View/company/info/Info_ManageDesti.jsp" style="text-decoration: underline;">
					<i class="fa fa-list-alt" aria-hidden="true"></i>옥내 목적지 관리</a>
				</h4>
			</div>
		</div>
	</div>
</aside>

<!-- Content -->
<div class="mainContent">
<!-- 페이지 이름 / 환영+ 로그아웃 버튼 -->
	<div class="col-lg-12">
		<div style="margin:30px 20px 10px 0px;font-size:35px;width: 50%;float: left;">옥내 목적지 관리</div>
		<%@ include file="../../CommonForm/logout.jsp"%>
	</div>
	
	<div class="col-lg-9" style="margin-left: auto;margin-bottom: 2%;">
		 <button type="button" class="btn btn-info" id="desti_add" style="float: right;"
		 	data-toggle="modal" data-target="#addModal">목적지 추가</button>
	</div>

<!-- 부트 테이블 : 목적지 관리 -->
<div class='col-lg-12' style="margin-left: auto; margin-right: auto;">
	<div class="col-lg-1"></div>
	<div class="col-lg-8">
		<table class="table table-bordered table-hover" id="tb_desti">
		</table>
	</div>
</div>
</div>

<!-- 목적지추가 모달창 -->
<div id="addModal" class="modal fade" role="dialog" style="width: 50%;margin-left: 28%;margin-top: 10%;">
<div class="modal-dialog">
<!-- Modal content -->
	<div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">목적지 추가</h4>
        </div>
        
        <div class="modal-body" style="align: center;padding-left: 30%">
        	<p>일련번호는 자동으로 추가됩니다.</p>
        	<table>
        		<tr><td>목적지명</td>		<td><input class="easyui-textbox" id="DESTI_NAME_ADD"></td></tr>
        		<tr><td>위치</td>			<td><input class="easyui-textbox" id="DESTI_LOC_ADD"></td></tr>
        		<tr><td>비고</td>			<td><input class="easyui-textbox" id="DESTI_NOTES_ADD"></td></tr>
        	</table>
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-info" id="desti_add" onclick="javascript:addDesti();">추가</button>
          <button type="button" class="btn" id="btn_close" data-dismiss="modal">Close</button>
        </div>
	</div>
</div>
</div>

<!-- 상세정보 모달창 : 상세조회/삭제 -->
<div id="destiModal" class="modal fade" role="dialog" style="width: 50%;margin-left: 28%;margin-top: 10%;">
<div class="modal-dialog">
<!-- Modal content -->
	<div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">키오스크 상세정보</h4>
        </div>
        
        <div class="modal-body" style="align: center;padding-left: 30%">
        	<table>
        		<tr><td>일련번호</td>		<td><input class="easyui-textbox" id="DESTI_NO"></td></tr>
        		<tr><td>목적지명</td>		<td><input class="easyui-textbox" id="DESTI_NAME"></td></tr>
        		<tr><td>위치</td>			<td><input class="easyui-textbox" id="DESTI_LOC"></td></tr>
        		<tr><td>비고</td>			<td><input class="easyui-textbox" id="DESTI_NOTES"></td></tr>
        	</table>
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-info" id="desti_delete" onclick="javascript:deletDesti();">삭제</button>
          <button type="button" class="btn" id="btn_close" data-dismiss="modal">Close</button>
        </div>
	</div>
</div>
</div>

<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>