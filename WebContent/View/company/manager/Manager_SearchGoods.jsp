<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 -->
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>반입 신청 관리 - CH4 방문자 관리 시스템</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
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
			$("#searchText").textbox('textbox').attr('name',newVal);
			$("#searchText").attr('textboxname',newVal);
			var inputHidden = $("#searchText").textbox('textbox').parent().find('input:last');
			inputHidden.attr('name',newVal);
// 			$("span.textbox > .textbox-value").attr('name',newVal);
		}
	});

/* 테이블 데이터 */
	$("#tb_searchGood").bootstrapTable({
		toolbar:'#toolbar'
		,toolbarAlign : 'right'
		,pagination:'true'
		,paginationPreText:"Previous"
		,paginationNextText:"Next"
		,url: "/project_ch4_pojo/json/searchGoodsJson.json"
	    ,onLoadError: function(status,jqXHR){
	    	alert("error");
	    }
	    ,paginationPreText:"Previous"
	    ,paginationNextText:"Next"
	    ,pageSize:10//기본 페이지 사이즈
	    ,pageList:[10, 15, 20, 30] //칸수
	});

//방문현황 콤보
	$("#state").combobox({
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
//날짜 콤보
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
	$.ajax({
			type:'post'
			,url:'project_ch4_pojo/json/searchGoodsJson.json'/* 실제 사용할 URL 변경하기  : company/applyVisitList.ch4 */
			,dataType: "json"
			,data :$("#f_search").serialize()
			,success: function(data){
				$("#tb_searchGood").bootstrapTable('data',data);
			}
	});
}
</script>
	<%@ include file="../../CommonForm/Top.jsp"%>

	<!-- Content -->
	<div class="mainContent">
		<%@ include file="../../CommonForm/ManagerSideBar.jsp"%>
		<div style="padding-left: 200px">
			<div class="col-lg-12">

				<div style="font-size: 35px; width: 78%; float: left;">
					<h1>반입 신청 관리</h1>
				</div>
				<!-- 검색 조건 설정 -->
				<div class="col-lg-12">
					<form id="f_search">
						<div class='col-sm-2'>
							<select class="easyui-combobox" id="SearchType" name='SearchType'
								label="검색방법" labelPosition="left" style="width: 180px;">
								<option value="APLG_NO" selected>신청번호</option>
								<option value="APLG_NAME">신청자</option>
								<option value="APLG_DESTI">목적지
								<option>
							</select>
						</div>
						<div class='col-sm-2'>
							<!-- 검색창 : 콤보박스에 의한 분기 -->
							<!-- 텍스트 박스에 대해 name값 변경 : 처음 값은 방문자명 // onChange 이벤트로 Name속성을 바꾸어 주기 -->
							<input class="easyui-textbox" id="searchText" name="VISITOR_NAME"
								style="width: 150px;"> <a class="easyui-linkbutton"
								type="button" data-options="iconCls:'icon-search'"
								onclick="btn_search()"></a>
						</div>
						<div class='col-sm-2'>
							<select class="easyui-combobox" id="state" name="APLG_PERMIT_ST"
								label="결재상태" labelPosition="left" style="width: 180px;">
								<option value="" selected>전체</option>
								<option value="결제중" selected>결제중</option>
								<option value="승인">승인</option>
								<option value="반려">반려</option>
								<option value="취소">취소</option>
							</select>
						</div>
						<!-- 날짜 검색 -->
						<div class='col-sm-4' style="padding: 0px;">
							<div class='col-sm-6'>
								<span style="font-weight: bold;">신청일</span> <input
									class="easyui-datebox" id="startdate" name="aplg_date1"
									style="width: 120px;">
							</div>
							<div class='col-sm-1'>
								<h4 align="center">
									<b>~</b>
								</h4>
							</div>
							<div class='col-sm-4' style="padding: 0px;">
								<input class="easyui-datebox" id=closedate name="aplg_date2"
									style="width: 120px;">
							</div>
						</div>
					</form>

					<!-- 부트 테이블 : search_ResultVisitor 참조-->
					<div style="width: 86%;">
						<table class="table table-bordered table-hover" id="tb_searchGood">
							<thead>
								<tr>
									<th data-field="APLG_NO">신청번호</th>
									<th data-field="GMNG_CONFM">승인여부</th>
									<th data-field="APLG_NAME">신청자명</th>
									<th data-field="APLG_HP">연락처</th>
									<th data-field="APLG_DATE">신청일</th>
									<th data-field="APLG_DESTI">목적지</th>
								</tr>
							</thead>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>