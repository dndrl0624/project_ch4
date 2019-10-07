<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 	String user_id = "";
// 	String user_name = "";
// 	String company_no = "";
// 	String company_name = "";
// 	user_id = (String)session.getAttribute("CMNG_ID");
// 	user_name = (String)session.getAttribute("CMNG_NAME");
// 	company_no = (String)session.getAttribute("COM_NO");
// 	company_name = (String)session.getAttribute("COM_NAME");
// 	if(user_id==null||user_id.equals("")){
// 		//로그인 페이지로 돌아가기
// 		response.sendRedirect("loginform.jsp");
// 	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>방문현황 관리</title>
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
			
			// textbox placeholder
			if(newVal=="VISITOR_NAME"){
				$("#searchText").textbox('textbox').attr('placeholder',"방문자 이름");
			}else if(newVal=="VISITOR_HP"){
				$("#searchText").textbox('textbox').attr('placeholder',"방문자 연락처");
			}else if(newVal=="VISIT_APPLY_NAME"){
				$("#searchText").textbox('textbox').attr('placeholder',"신청자 이름");
			}else if(newVal=="VISIT_APPLY_HP"){
				$("#searchText").textbox('textbox').attr('placeholder',"신청자 연락처");
			}
			
			var inputHidden = $("#searchText").textbox('textbox').parent().find('input:last');
			inputHidden.attr('name',newVal);
// 			$("span.textbox > .textbox-value").attr('name',newVal);
		}
	});
});

/* 테이블 데이터 */
$(document).ready(function(){
	$("#tb_logVisitor").bootstrapTable({
		toolbar:'#toolbar'
		,url:'/project_ch4_pojo/json/logVisitorJson.json'
		,pagination : 'true'
		,paginationPreText:"Previous"
		,paginationNextText:"Next"
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

<!-- Side Bar -->
<aside>
	<div style="margin-top:30px">
	<h3 style="color: white;">회@사@이@름@</h3> <!-- session.getAttribute("COM_NAME"); -->
	</div>
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
	<div class="col-lg-12">
	<div style="padding-left:200px">
		<div style="margin:30px 20px 10px 0px;font-size:35px;widtd: 50%;float: left;"> 방문자 현황 조회 </div>
		<%@ include file="../../CommonForm/logout.jsp"%>
	</div>
	</div>
	
<!-- 검색 조건 설정 -->
<div class="col-lg-12">
<div style="padding-left:200px">
<!-- 캘린더 -->
	<form id="f_search">
<%-- 	<input type="hidden" name="COM_NO" value="<% session.getAttribute("COM_NO"); %>"> --%>
	<div class="col-lg-1"></div>
	<div class="col-lg-3">
		<div class="easyui-calendar" id="calender" style="margin-bottom: 10px; width: 230px; height: 150px;"></div>
	</div>
<!-- 검색 툴바 -->
	<div class="col-lg-7">
		<div class="col-lg-12"><br>
			<!-- 검색 타입 설정 -->
			<select class="easyui-combobox" id="SearchType" name='SearchType' label="검색방법" labelPosition="left" style="width:230px;">
				<option value="VISITOR_NAME" selected>방문자명</option>
				<option value="VISITOR_HP">방문자 연락처</option>
				<option value="VISIT_APPLY_NAME">신청자명</option>
				<option value="VISIT_APPLY_HP">신청자 연락처</option>
			</select>
		<!-- 검색창 : 콤보박스에 의한 분기<br> -->
			<!-- 텍스트 박스에 대해 name값 변경 : 처음 값은 방문자명 // onChange 이벤트로 Name속성을 바꾸어 주기 -->
			<input class="easyui-textbox" id="searchText" name="VISITOR_NAME" style="width:150px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="search"></a>
		</div><br>
		<!-- 콤보 박스 : 처리결과 대해 -->
		<div class="col-lg-12" style="margin-top: 10px;">
			<select class="easyui-combobox" id="state" name="CMG_NOTES" label="방문현황" labelPosition="left" style="width:230px;">
				<option value="전체" selected>전체</option>
				<option value="방문중">방문중</option>
				<option value="외출">외출</option>
				<option value="방문종료">방문종료</option>
			</select>
		</div><br>
		<!-- 콤보 박스 : 처리결과 대해 -->
		<div class="col-lg-12" style="margin-top: 10px;">
			<select class="easyui-combobox" id="time" name="CMG_INOUT" label="출입시간" labelPosition="left" style="width:230px;">
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
	
<!-- 부트 테이블 : search_ResultVisitor 참조-->	<!-- 처리내용 : 입장 퇴장 --><!-- 현재위치 : 내부 외부 사내 .. -->
<div style="width: 84%;">
	<table class="table table-bordered table-hover" id="tb_logVisitor" >
		<thead>
			<tr>
				<th data-field="CONFM_NO">방문번호</th>
				<th data-field="CMG_INOUT">처리시간</th>
				<th data-field="CONFM_NAME">방문자명</th>
				<th data-field="CMG_ENTRC">출입위치</th>
				<th data-field="CMG_NOTES">처리상태</th>
				<th data-field="VISIT_DESTI">목적지</th>
			</tr>
		</thead>
	</table>
</div>

</div>
</div>
</div>	
<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>