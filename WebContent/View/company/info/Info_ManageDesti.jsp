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
<body><!-- ID로 이름 받아오는 것 // 상세정보 수정+삭제 함수 만들기 : 폼태그 전송 -->
<script type="text/javascript">
/* 테이블 데이터 */
$(document).ready(function(){
	$("#tb_desti").bootstrapTable({
		height:'530'
		//,toolbar:'#toolbar'
		,url:'/project_ch4_pojo/json/desti.json'
		,pagination : 'true'
		,search : 'true'
		,showSearchButton : 'true'
		,onClickRow : function(row, $element, field) {
				$element.toggleClass('single-select');//로우 클릭했을 때 색 변함.
			}
		,onDblClickRow : function(row, $element, field) {
			var ki_no = $element.find("td").eq(0).html();
			var ki_gate = $element.find("td").eq(1).html();
			var ki_st = $element.find("td").eq(2).html();
			var ki_note = $element.find("td").eq(3).html();

			$("#DESTI_NO").textbox('setValue', ki_no);
			$("#DESTI_NAME").textbox('setValue', ki_gate);
			$("#DESTI_LOC").textbox('setValue', ki_st);
			$("#DESTI_NOTES").textbox('setValue', ki_note);

			$("#destiModal").modal('show');
		}
	});
	$("#search").click(function() {
		var nameSearch = $("#nameSearch").val();
		//alert(nameSearch);
		$("#tb_desti").bootstrapTable('refreshOptions', {
			filterOptions : {
				filterAlgorithm : 'or'
			}
		});
		$("#tb_desti").bootstrapTable('filterBy', {
			DESTI_NAME : nameSearch
		});
	});
});

	/* 추가 버튼 기능 구현 */
	function addDesti() {
		//alert("새로넣어죠");
		var name = $('#DESTI_NAME_ADD').val();
		var loca = $('#DESTI_LOC_ADD').val();
		var noti = $('#DESTI_NOTES_ADD').val();
		//폼태그 : ** 일련번호를 생성해서 최종적으로 같이 넣어준다 **
		$("#f_desti_add").attr("method","get");
		$("#f_desti_add").attr("action","/desti.ch4?DESTI_NAME="+name+"&DESTI_LOC="+loca+"&DESTI_NOTES="+noti);
		$("#f_desti_add").submit();
	}
	/* 수정 버튼 기능 구현 */
	function changeDesti() {
		//alert("시작부터 밑장빼기냐");
		var nonoC = $('#DESTI_NO').val();
		var nameC = $('#DESTI_NAME').val();
		var locaC = $('#DESTI_LOC').val();
		var notiC = $('#DESTI_NOTES').val();
		alert(nonoC);
		//수정 정보 전송
		$("#f_desti_add").attr("method","get");
		$("#f_desti_add").attr("action","/desti.ch4?DESTI_NO"+nonoC+"&DESTI_NAME="+nameC+"&DESTI_LOC="+locaC+"&DESTI_NOTES="+notiC);
		$("#f_desti_add").submit();
	}
	/* 삭제 버튼 기능 구현 */
	function deletDesti() {
		//alert("지워죠");
		var nonoD = $('#DESTI_NO').val();
		alert();
		//삭제할 정보의 일련번호 전달
		$("#f_desti_add").attr("method","get");
		$("#f_desti_add").attr("action","/desti.ch4?DESTI_NO"+nonoD);
		$("#f_desti_add").submit();
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
		 <button type="button" class="btn btn-info" style="float: right;"
		 	data-toggle="modal" data-target="#addModal">목적지 추가</button>
	</div>
<!-- 검색 조건 설정 : 검색조건이 명확하지 않을 수 있음으로 전체 자료에서 검색함 : 부트스트랩으로 처리함 -->

<!-- 부트 테이블 : 목적지 관리 -->
<div class='col-lg-12' style="margin-left: auto; margin-right: auto;">
	<div class="col-lg-1"></div>
	<div class="col-lg-8">
		<table class="table table-bordered table-hover" id="tb_desti">
			<thead>
				<tr>
					<th data-field="DESTI_NO">일련번호</th>
					<th data-field="DESTI_NAME">목적지명</th>
					<th data-field="DESTI_LOC">위치</th>
					<th data-field="DESTI_NOTES">비고</th>
				</tr>
			</thead>
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
        	<form id="f_desti_add">
        	<table>
        		<tr><td>목적지명</td>		<td><input class="easyui-textbox" id="DESTI_NAME_ADD"></td></tr>
        		<tr><td>위치</td>			<td><input class="easyui-textbox" id="DESTI_LOC_ADD"></td></tr>
        		<tr><td>비고</td>			<td><input class="easyui-textbox" id="DESTI_NOTES_ADD"></td></tr>
        	</table>
        	</form>
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-info" id="desti_add" onclick="javascript:addDesti();">저장</button>
          <button type="button" class="btn" id="btn_close" data-dismiss="modal">Close</button>
        </div>
	</div>
</div>
</div>

<!-- 상세정보 모달창 : 상세조회/수정/삭제 -->
<div id="destiModal" class="modal fade" role="dialog" style="width: 50%;margin-left: 28%;margin-top: 10%;">
<div class="modal-dialog">
<!-- Modal content -->
	<div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">목적지 상세정보</h4>
        </div>
        
        <div class="modal-body" style="align: center;padding-left: 30%">
        	<form id="f_desti_chage">
        	<table>
        		<tr><td>일련번호</td>		<td><input class="easyui-textbox" id="DESTI_NO" readonly="readonly"></td></tr>
        		<tr><td>목적지명</td>		<td><input class="easyui-textbox" id="DESTI_NAME"></td></tr>
        		<tr><td>위치</td>			<td><input class="easyui-textbox" id="DESTI_LOC"></td></tr>
        		<tr><td>비고</td>			<td><input class="easyui-textbox" id="DESTI_NOTES"></td></tr>
        	</table>
        	</form>
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-info" id="desti_change" onclick="javascript:changeDesti();">수정</button>
          <button type="button" class="btn btn-danger" id="desti_delete" onclick="javascript:deletDesti();">삭제</button>
          <button type="button" class="btn" id="btn_close" data-dismiss="modal">Close</button>
        </div>
	</div>
</div>
</div>

<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>