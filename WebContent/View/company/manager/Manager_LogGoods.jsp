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
<style type="text/css"> 
<%@ include file="/Style/css/CssStyle.css"%>
/* 사이드바 설정 */
aside {
    width: 15%;
    height: 80%;
    position: fixed;
    background: #2f323a;
    overflow: auto;
}
/* 사이드바 overflow 시 스크롤바 안보이게 하기 */
aside::-webkit-scrollbar { 
    display: none; 
}
/* 테이블 제목 구간 가운데 정렬 */
th {
	text-align: center;
}

/* 메인 페이지 프레임 구간 설정 */
.mainContent {
	margin:20px 20px 10px 17%;
}

/* 로그아웃 버튼 */
 .logout{
      text-decoration: none;
      
      color: white;
      background-color: teal;
      padding:10px 20px 10px 20px;
      margin:20px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
    }
    .logout:active{
      transform: translateY(3px);
    }

</style>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>
/* 테이블 data insert 기능 */
$(function () {
		$.ajax({
				url : "/project_ch4_pojo/json/logGoodsJson.json",
				//data: $("#폼 태그 아이디").serialize();
				//type : 'post',
				dataType : "json",
				success : function(data) {
					$.each(data, function() {
						$('#logGoodsTable').append(
								"<tr><td>" + this["GMNG_NO"]
								+ "</td><td>" + this["APLG_NAME"]
								+ "</td><td>" + this["APLG_HP"]
								+ "</td><td>" + this["COM_NAME"]
								+ "</td><td>" + this["APLG_DESTI"]
								+ "</td><td>" + this["APLG_REASON"]
								+ "</td><td>" + this["APLG_TRANS_DATE"]
								+ "</td><td>" + this["GMNG_NAME"]
								+ "</td><td>" + this["GMNG_TYPE"]
								+ "</td><td>" + this["GMNG_QUAN"]
								+ "</td><td>" + this["GMNG_NOTES"]
								+ "</td></tr>");
					});
					$.each(data, function(index, entry) {
						$('#logGoodsTable').append(
								"<tr><td>" + entry["GMNG_NO"]
								+ "</td><td>" + entry["APLG_NAME"]
								+ "</td><td>" + entry["APLG_HP"]
								+ "</td><td>" + entry["COM_NAME"]
								+ "</td><td>" + entry["APLG_DESTI"]
								+ "</td><td>" + entry["APLG_REASON"]
								+ "</td><td>" + entry["APLG_TRANS_DATE"]
								+ "</td><td>" + entry["GMNG_NAME"]
								+ "</td><td>" + entry["GMNG_TYPE"]
								+ "</td><td>" + entry["GMNG_QUAN"]
								+ "</td><td>" + entry["GMNG_NOTES"]
								+ "</td></tr>");
					});
				},
				error : function() {
					alert("에러발생");
				}
			});
		});
</script>
</head>
<body>
<script type="text/javascript">
/* 검색방법 콤보박스로 textbox name값 변경 */
$(document).ready(function(){
	$('#SearchType').combobox({
		onChange: function(newVal,oldVal){
			$("#SearchType").textbox('textbox').attr('name',newVal);
			$("#SearchType").attr('textboxname',newVal);
			$("span.textbox > .textbox-value").attr('name',newVal);
		}
	});
});

/* 검색버튼 기능 */
function btn_search(){
	alert(
			 "콤보:검색  :"+$('#SearchType').combobox('getValue')
			 +"// text Name : "+$("span.textbox > .textbox-value").attr('name')
			 +"// text value :"+document.getElementById("searchText").value
			 +"// 콤보:처리 :"+$('#GMNG_CONFM').combobox('getValue')
			 +"// 시작일  :"+$('#datepicker1').datebox('getValue')
			 +"// 종료일   :"+$('#datepicker2').datebox('getValue')
	)};
	
</script>
<%@ include file="../../CommonForm/Top.jsp"%>

<!-- Side Bar -->
<aside>
	<div class="panel-group" style="margin-top:90px">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/project_ch4_pojo/View/company/manager/Manager_Main.jsp">
					<i class="fas fa-home"></i>메인페이지</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse1">방문 신청 조회</a>
				</h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse">
				<div class="panel-body">
					<a  href="/project_ch4_pojo/View/company/manager/Manager_SearchVisitor.jsp">방문 신청 조회</a><br> 
					<a  href="/project_ch4_pojo/View/company/manager/Manager_LogVisitor.jsp">방문현황 조회</a><br> 
				</div>
			</div>
		</div>
		
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse2">물품 반입 신청 조회</a>
				</h4>
			</div>
			<div id="collapse2" class="panel-collapse collapse in">
				<div class="panel-body">
					<a  href="/project_ch4_pojo/View/company/manager/Manager_SearchGoods.jsp">반입 신청 조회</a><br> 
					<a  href="/project_ch4_pojo/View/company/manager/Manager_LogGoods.jsp">반입 현황 조회</a><br> 
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
		<div style="margin:30px 20px 10px 0px;font-size:35px;width: 75%;float: left;"> 물품 반입 현황 조회 </div>
		<div style="width:20%; float: right;"> 
			<!-- 관리자명 -->@@@님 환영합니다.
<!-- 로그아웃 기능 + 로그인하는 페이지로 이동 --><!-- 로그아웃 기능 + 로그인하는 페이지로 이동 --><!-- 로그아웃 기능 + 로그인하는 페이지로 이동 --><!-- 로그아웃 기능 + 로그인하는 페이지로 이동 -->
			<a class="logout" href="/project_ch4_pojo/View/로그인하는 페이지.jsp">로그아웃</a> 
		</div>
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
		<select class="easyui-combobox" id="GMNG_CONFM" name="GMNG_CONFM" label="현황" labelPosition="left" style="width:100%;">
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
		<button type="button" class="btn btn-success" onclick="javascript:btn_search()"
		style="margin-top: 5px;margin-bottom: 15px;float: bottom;">Search</button>
	</div>
	</div>
	

<!-- 검색 결과 테이블 -->
<table class="table table-bordered" id="logGoodsTable" style="width: 100%;margin-top:20px;" border="1">
	<thead style="font-size:20px;">
	<tr>
		<th>물품번호</th>
		<th>신청자</th>
		<th>연락처</th>
		<th>반입장소</th>
		<th>목적지</th>
		<th>반입사유</th>
		<th>반입일자</th>
		<th>반입물품명</th>
		<th>종류</th>
		<th>수량</th>
		<th>비고</th>
	</tr>
	</thead>
<!-- ========================================================================================================== -->
<!-- 1. if  : 검색결과가 없습니다 / 검색결과 보여주기 -->
<!-- 2. for : 모든 검색결과 보여주기 -->
	<tr>
		<td colspan= "11" style="text-align: center;font-size:20px;
			font-weight: bold;text-decoration: underline;">
		검색결과가 없습니다</td>
	</tr>
<!--	
	<tr style="cursor: pointer;" onClick="location.href='/project_ch4_pojo/View/company/manager/Manger_DetailGoods.jsp'">
		<td colspan= "11" style="text-align: center;font-size:20px; font-weight: bold;text-decoration: underline;" >
		상세정보 예시</td>
	</tr>
 -->
</table>

</div>
<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>

</body>
</html>