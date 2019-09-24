<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>키오스크 관리</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<link rel="stylesheet" type="text/css" href="/project_ch4_pojo/Style/css/maxCss.css">
<!-- <link rel="stylesheet" type="text/css" href="/project_ch4_pojo/Style/css/maxModal.css"> -->
</head>
<body>
<script type="text/javascript">
//combobox 직접입력 방지
$.fn.combobox.defaults.editable = false
/* 테이블 데이터 */
$(document).ready(function(){
	$("#tb_kiosk").bootstrapTable({
	    columns:[
	         {field:'KIOSK_NO',title:'키오스크 일련번호'}
	         ,{field:'KIOSK_GATE',title:'위치'}/* 위치 : 동문or정문or... */
	         ,{field:'KIOSK_ST',title:'상태'}/* 상태 : 정상,고장,수리요청,수리중 */
	         ,{field:'KIOSK_NOTES',title:'비고'}/* 비고 : 수리예정 */
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
			var kio_no = $element.find("td").eq(0).html();
			var kio_loc = $element.find("td").eq(1).html();
			var kio_con = $element.find("td").eq(2).html();
			var kio_not = $element.find("td").eq(3).html();
			//alert(test);
			$("#kiosk_no").attr('value',kio_no);
			$("#kiosk_location").attr('value',kio_loc);
			$("#kiosk_condtion").attr('value',kio_con);
			$("#kiosk_notice").attr('value',kio_not);
			$("#kioskModal").modal('show');
	   	 }
	});
});
/* 버튼 검색 */
function search(){
	$.ajax({
		url: "/project_ch4_pojo/json/kiosk.json"
		,dataType: "json"
		,success: function(result){
			$("#tb_kiosk").bootstrapTable('load',result);
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
					<a href="/project_ch4_pojo/View/company/info/Info_ManageKiosk.jsp" style="text-decoration: underline;">
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

<!-- Content -->
<div class="mainContent">
<!-- 페이지 이름 / 환영+ 로그아웃 버튼 -->
	<div class="col-lg-12">
		<div style="margin:30px 20px 10px 0px;font-size:35px;width: 50%;float: left;"> 키오스크 관리 </div>
		<%@ include file="../../CommonForm/logout.jsp"%>
	</div>
<!-- 검색 조건 설정 -->
<div class='col-lg-12'>
	<div class='col-lg-1'></div>
	<div class='col-sm-2'>
		<select class="easyui-combobox" id="KIOSK_ST" name="KIOSK_ST" label="상태" labelPosition="left" style="width:100%;">
			<option value="all" selected>전체</option>
			<option value="nomal">정상</option>
			<option value="error">고장</option>
			<option value="request">수리 요청</option>
			<option value="repair">수리 중</option>
		</select>
	</div>
<!-- 검색 버튼 -->
	<div  class='col-sm-1'>
		<button type="button" class="btn btn-success" onclick="javascript:search()"
				style="margin-top: 5px;margin-bottom: 15px;float: bottom;">Search</button>
	</div>
</div>
<!-- 부트 테이블 : kiosk -->
<div class='col-lg-12' style="margin-left: auto; margin-right: auto;">
	<div class="col-lg-1"></div>
	<div class="col-lg-8">
		<table class="table table-bordered table-hover" id="tb_kiosk">
		</table>
	</div>
</div>

</div>

<!-- 모달 상세정보 -->
<div id="kioskModal" class="modal fade" role="dialog" style="width: 50%;margin-left: 28%;margin-top: 10%;">
<div class="modal-dialog">
<!-- Modal content -->
	<div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">키오스크 상세정보</h4>
        </div>
        
        <div class="modal-body" style="align: center;padding-left: 30%">
        	<table>
        		<tr><td>일련번호</td>	<td><input class="text" id="kiosk_no"></td></tr>
        		<tr><td>위치</td>		<td><input class="text" id="kiosk_location"></td></tr>
        		<tr><td>상태</td>		<td><input class="text" id="kiosk_condtion"></td></tr>
        		<tr><td>비고</td>		<td><input class="text" id="kiosk_notice"></td></tr>
        	</table>
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-info" id="state_change">상태 변경</button>
          <button type="button" class="btn" id="btn_close" data-dismiss="modal">Close</button>
        </div>
	</div>
</div>
</div>

<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>