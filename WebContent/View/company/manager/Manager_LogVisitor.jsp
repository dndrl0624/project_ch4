<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>방문 현황 조회 페이지</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<style type="text/css"> 
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

/* 메인 페이지 프레임 구간 설정 */
.mainContent {
	margin:20px 20px 10px 17%;
}

/* 테이블 제목 구간 가운데 정렬 */
th {
	text-align: center;
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

</head>
<body>
<script type="text/javascript">
/* 콤보박스 : 검색방법 */
$(document).ready(function(){
	$('#SearchType').combobox({
		onChange: function(newVal,oldVal){
			$("#searchText").textbox('textbox').attr('name',newVal);
			$("#searchText").attr('textboxname',newVal);
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
					<a href="/project_ch4_pojo/View/company/manager/Manager_Main.jsp">메인페이지</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse1">방문 신청 조회</a>
				</h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse in">
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
			<div id="collapse2" class="panel-collapse collapse">
				<div class="panel-body">
					<a  href="/project_ch4_pojo/View/company/manager/Manager_SearchGoods.jsp">반입 신청 조회</a><br> 
					<a  href="/project_ch4_pojo/View/company/manager/Manager_LogGoods.jsp">반입 현황 조회</a><br> 
				</div>
			</div>
		</div>
		
	</div>
</aside>

<!-- Content -->
<div class="mainContent">
<!-- 페이지 이름 / 환영+ 로그아웃 버튼 -->
	<div class="col-lg-12">
		<div style="margin:30px 20px 10px 0px;font-size:35px;width: 75%;float: left;"> 방문 현황 조회 페이지 </div>
		<div style="width:20%; float: right;"> 
			<!-- 관리자명 -->@@@님 환영합니다.
<!-- 로그아웃 기능 + 로그인하는 페이지로 이동 --><!-- 로그아웃 기능 + 로그인하는 페이지로 이동 --><!-- 로그아웃 기능 + 로그인하는 페이지로 이동 --><!-- 로그아웃 기능 + 로그인하는 페이지로 이동 -->
			<a class="logout" href="/project_ch4_pojo/View/로그인하는 페이지.jsp">로그아웃</a> 
		</div>
	</div>
	
	<div class='col-sm-2'>
	<!-- 검색 타입 설정 --><br>
		<select class="easyui-combobox" id="SearchType" name='SearchType' label="검색방법" labelPosition="left" style="width:100%;">
			<option value="VISITOR_NAME" selected>방문자명</option>
			<option value="VISITOR_HP">연락처</option>
			<option value="COM_NAME">회사</option>
		</select>
	</div>
	<div class='col-sm-2'>
	<!-- 검색창 : 콤보박스에 의한 분기 --><br>
		<!-- 텍스트 박스에 대해 name값 변경 : 처음 값은 방문자명 // onChange 이벤트로 Name속성을 바꾸어 주기 -->
		<input class="easyui-textbox" id="searchText" name="VISITOR_NAME" style="width:230px;height:25px;">
	
	</div>
	<div class='col-sm-2'>
	<!-- 콤보 박스 : 처리결과 대해 --><br>
		<select class="easyui-combobox" id="GMNG_CONFM" name="GMNG_CONFM" label="현재위치" labelPosition="left" style="width:100%;">
			<option value="all" selected>전체</option>
			<option value="insideCom">사내</option>
				<option value="outsideCom">외출</option>
			<option value="goHome">퇴근</option>
		</select>
	</div>
	<div  class='col-sm-4'>
<!-- 날짜 검색 -->
			<div class="form-group">
				<div class='col-sm-5'>
					<span style="font-weight: bold;">시작일</span>
					<div class="form-group">
						<div class='easyui-datebox' id="datepicker1">
							<input type='text' class="form-control" name="openDate" required="required" /> 
							<span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<div class='col-sm-1'>
					<h4 align="center">
						<br> <b>~</b>
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
<table class="table table-bordered" style="width: 100%;margin-top:20px;" border="1">
	<thead style="font-size:20px;">
	<tr>
		<th>방문번호</th>
		<th>처리시간</th>		<!-- 시간 -->
		<th>처리내용</th>		<!-- 들어옴,나감 // 입장 : 사내  // 퇴장:외출 // 퇴장:퇴근-->
		<th>현재 위치</th>		<!-- 미방문, 사내, 사외  // 외출, 퇴근 -->
		<th>방문자명</th>
		<th>연락처</th>		<!-- 방문자 연락처 -->
		<th>방문지</th>
		<th>목적지</th>
		<th>방문유형</th>
		<th>방문일자</th>
	</tr>
	</thead>
<!-- ========================================================================================================== -->
<!-- 1. if  : 검색결과가 없습니다 / 검색결과 보여주기 -->
<!-- 2. for : 모든 검색결과 보여주기 -->
	<tbody>
	
	<tr>
		<td colspan= "12" style="text-align: center;font-size:20px;font-weight: bold;text-decoration: underline;">검색결과가 없습니다</td>
	</tr>
<!--
	<tr style="cursor: pointer;" onClick="location.href='/project_ch4_pojo/View/company/manager/Manger_DetailVisitor.jsp'">
		<td colspan= "12" style="text-align: center;font-size:20px; font-weight: bold;text-decoration: underline;" >
		상세정보 예시 - 페이지 이동</td>
	</tr>
	
	<tr>
		<td colspan= "10" id="modalopen" data-toggle="modal" data-target="#detailModal"
		style="text-align: center;font-size:20px; font-weight: bold;text-decoration: underline;" >
		상세정보 예시 - 모달창</td>
	</tr>
-->
	</tbody>
</table>

</div>

<!-- Modal -->
	<div class="modal fade" id="detailModal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h1 class="modal-title" style="text-align: center;font-weight: bold;">모달제목이다</h1>
				</div>
				<div class="modal-body">
					<div class="row">
						<table class="table table-bordered" style="width: 100%;margin-top:20px;" border="1">
							<tr>
								<th></th>
								<th>방문자명</th>
								<th>방문자 연락처</th>		
								<th>위치</th>
								<th>신청자명</th>
								<th>신청자 연락처</th>
								<th></th>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>

</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
>>>>>>> refs/heads/uk_view
</html>