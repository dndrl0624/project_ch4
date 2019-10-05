<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<title>키오스크 관리</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.15.4/extensions/toolbar/bootstrap-table-toolbar.min.js"></script>
<link rel="stylesheet" type="text/css" href="/project_ch4_pojo/Style/css/maxCss.css">
</head>
<body>
<script type="text/javascript">
//combobox 직접입력 방지
$.fn.combobox.defaults.editable = false
/* 테이블 데이터 */
$(document).ready(function(){
	$("#bt_table").bootstrapTable({
		height:'460'
		,toolbar:'#toolbar'
// 		,showColumns:'true'
// 		,showRefresh:'true'
// 		,queryParams:'queryParams'
		,url:'/project_ch4_pojo/json/kiosk.json'
		,pagination:'true'
// 		,sidePagination:'server'
	    ,onClickRow:function(row,$element,field){
	       $element.toggleClass('single-select');//로우 클릭했을 때 색 변함.
	     }
	    ,onDblClickRow:function(row,$element,field){
	       alert("상세조회 모달");
	     }
	});
	$("#search").click(function(){
		alert("눌림?");
		var combo = $("#combo").val();
		alert(combo);
		$("#bt_table").bootstrapTable('refreshOptions',{
			filterOptions:{
				filterAlgorithm : 'or'
			}
		});
		$("#bt_table").bootstrapTable('filterBy',{
			KIOSK_ST: combo
		});
	});
});
// var $table = $('#bt_table')
// var $ok = $('#ok')

// $(function() {
//   $ok.click(function () {
//     $table.bootstrapTable('refresh')
//   })
// })

// function queryParams() {
//   var params = {}
//   $('#toolbar').find('select[name]').each(function () {
//     params[$(this).attr('name')] = $(this).val()
//   })
//   return params
// }
	
</script>
<%@ include file="../CommonForm/Top.jsp"%>

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
		<%@ include file="../CommonForm/logout.jsp"%>
	</div>
<!-- 검색 조건 설정 -->
<div id="toolbar">
  <div class="form-inline" role="form">
    <div class="form-group">
      <select id="combo" class="form-control" name="combo" style="width:100%;">
			<option value="정상">정상</option>
			<option value="고장">고장</option>
			<option value="수리요청">수리요청</option>
			<option value="수리중">수리중</option>
		</select>
    </div>
    <button id="search" class="btn btn-primary">search</button>
  </div>
</div>

<!-- 부트 테이블 : kiosk -->
<div class='col-lg-12' style="margin-left: auto; margin-right: auto;">
	<div class="col-lg-1"></div>
	<div class="col-lg-8">
		<table class="table table-bordered table-hover" id="bt_table">
					<thead>
						<tr>
							<th data-field="KIOSK_NO">일련번호</th>
							<th data-field="KIOSK_GATE">위치</th>
							<th data-field="KIOSK_ST">상태</th>
							<th data-field="KIOSK_NOTES">비고</th>
						</tr>
					</thead>
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