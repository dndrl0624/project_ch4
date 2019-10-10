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

/* 테이블 데이터 */
	$("#tb_logVisitor").bootstrapTable({
		columns:[
	         {field:'CONFM_NO',title:'방문번호'}
	         ,{field:'CMG_INOUT',title:'출입시간'}
	         ,{field:'CONFM_NAME',title:'방문자명'}
	         ,{field:'CMG_ENTRC',title:'출입위치'}/* 출입위치 : 사용게이트 */
	         ,{field:'CMG_NOTES',title:'처리상태'}
	         ,{field:'CONFM_DESTI',title:'목적지'}
	    ]
		,url:'/project_ch4_pojo/json/logVisitorJson.json'
		,pagination : 'true'
		,paginationPreText:"Previous"
		,paginationNextText:"Next"
		,pageSize:10//기본 페이지 사이즈
		,pageList:[10, 15, 20, 30] //칸수
	});
//검색방법 콤보박스 변경 후, 검색어 입력 후, 서치버튼 클릭
	$("#search").click(function() {
		$.ajax({
			type:'post'
			,url:'/project_ch4_pojo/json/logVisitorJson.json'/* 실제 사용할 URL 변경하기  : company/???.ch4 */
			,dataType: "json"
			,data :$("#f_text").serialize()
			,success: function(data){
				$("#tb_logVisitor").bootstrapTable('load',data);
			}
		});
	});
// 캘린더 검색 기능
	$('#calender').calendar({
		onSelect: function(date){
			$.ajax({
				type:'post'
				,url:'project_ch4_pojo/json/logVisitorJson.json'/* 실제 사용할 URL 변경하기  : company/applyVisitList.ch4 */
				,dataType: "json"
				,data :$("#f_search").serialize()
				,success: function(data){
					$("#tb_logVisitor").bootstrapTable('load',data);
				}
			});
		}
	});
//방문현황 콤보 박스
	$("#state").combobox({
		onChange: function(newVal){
			$.ajax({
				type:'post'
				,url:'/project_ch4_pojo/json/logVisitorJson.json'/* 실제 사용할 URL 변경하기  : company/???.ch4 */
				,dataType: "json"
				,data :$("#f_search").serialize()
				,success: function(data){
					$("#tb_logVisitor").bootstrapTable('load',data);
				}
			});
		}
	});
//출입시간 콤보박스
	$("#time").combobox({
		onChange: function(newVal){
			$.ajax({
				type:'post'
				,url:'/project_ch4_pojo/json/logVisitorJson.json'/* 실제 사용할 URL 변경하기  : company/???.ch4 */
				,dataType: "json"
				,data :$("#f_search").serialize()
				,success: function(data){
					$("#tb_logVisitor").bootstrapTable('load',data);
				}
			});
		}
	});
		
});
</script>
	<%@ include file="../../CommonForm/Top.jsp"%>
	<!-- content -->
	<div class="mainContent">
		<%@ include file="../../CommonForm/InfoSideBar.jsp"%>
		<div style="padding-left: 200px">
			<div class="col-lg-12">
				<div class="col-lg-offset-1 col-lg-10"
					style="margin-top: 20px; margin-bottom: 20px;">
					<div
						style="margin: 30px 20px 10px 0px; font-size: 35px; widtd: 50%; float: left;">
						방문 현황 조회</div>
				</div>
			</div>
			<!-- 검색 조건 설정 -->
			<div class="col-lg-offset-1 col-lg-10">
				<form id="f_search">
					<!-- 캘린더 -->
					<div class="col-lg-offset-1 col-lg-3">
						<div class="easyui-calendar" id="calender"
							style="margin-bottom: 10px; width: 250px; height: 200px;"></div>
					</div>
					<!-- 검색 툴바 -->
					<div class="col-lg-7">
						<div class="col-lg-12">
							<br>
							<!-- 검색 타입 설정 -->
							<select class="easyui-combobox" id="SearchType" name='SearchType'
								label="검색방법" labelPosition="left" style="width: 230px;">
								<option value="VISITOR_NAME" selected>방문자명</option>
								<option value="VISITOR_HP">방문자 연락처</option>
								<option value="VISIT_APPLY_NAME">신청자명</option>
								<option value="VISIT_APPLY_HP">신청자 연락처</option>
							</select>
							<!-- 검색창 : 콤보박스에 의한 분기<br> -->
							<!-- 텍스트 박스에 대해 name값 변경 : 처음 값은 방문자명 // onChange 이벤트로 Name속성을 바꾸어 주기 -->
							<input class="easyui-textbox" id="searchText" name="VISITOR_NAME"
								style="width: 150px;"> <a class="easyui-linkbutton"
								data-options="iconCls:'icon-search'" id="search"></a>
						</div>
						<br>
						<!-- 콤보 박스 : 처리결과 대해 -->
						<div class="col-lg-12" style="margin-top: 10px;">
							<select class="easyui-combobox" id="state" name="CMG_NOTES"
								label="방문현황" labelPosition="left" style="width: 230px;">
								<option value="전체" selected>전체</option>
								<option value="방문중">방문중</option>
								<option value="외출">외출</option>
								<option value="방문종료">방문종료</option>
							</select>
						</div>
						<br>
						<!-- 콤보 박스 : 처리결과 대해 -->
						<div class="col-lg-12" style="margin-top: 10px;">
							<select class="easyui-combobox" id="time" name="CMG_INOUT"
								label="출입시간" labelPosition="left" style="width: 230px;">
								<option value="" selected>전체</option>
								<option value="00">00시</option>
								<option value="01">01시</option>
								<option value="02">02시</option>
								<option value="03">03시</option>
								<option value="04">04시</option>
								<option value="05">05시</option>
								<option value="06">06시</option>
								<option value="07">07시</option>
								<option value="08">08시</option>
								<option value="09">09시</option>
								<option value="10">10시</option>
								<option value="11">11시</option>
								<option value="12">12시</option>
								<option value="13">13시</option>
								<option value="14">14시</option>
								<option value="15">15시</option>
								<option value="16">16시</option>
								<option value="17">17시</option>
								<option value="18">18시</option>
								<option value="19">19시</option>
								<option value="20">20시</option>
								<option value="21">21시</option>
								<option value="22">22시</option>
								<option value="23">23시</option>
							</select>
						</div>
					</div>
				</form>
				<div style="width: 84%;">
					<table class="table table-bordered table-hover" id="tb_logVisitor">
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>