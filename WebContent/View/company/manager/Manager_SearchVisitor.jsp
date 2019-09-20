<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<%@ include file="../../CommonForm/maxJavascript.jsp"%>
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
		<div style="margin:30px 20px 10px 0px;font-size:35px;width: 50%;float: left;">방문 신청 조회</div>
		<%@ include file="../../CommonForm/logout.jsp"%>
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
	<div class='col-sm-2'><br>
		<select class="easyui-combobox" id="state" name="state" label="승인상태" labelPosition="left" style="width:100%;">
			<option value="all" selected>전체</option>
			<option value="commit">승인</option>
			<option value="return">반려</option>
			<option value="cancle">취소</option>
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
<div  class='col-sm-1'>
	<button type="button" class="btn btn-success" onclick="javascript:btn_search()"
	style="margin-top: 5px;margin-bottom: 15px;float: bottom;">Search</button>
</div>
	</div>
	

<!-- 검색 결과 테이블 -->
<table class="table table-bordered" style="width: 100%;">
	<thead style="font-size:20px;">
	<tr>
		<th>신청번호</th>
		<th>신청자</th>
		<th>방문지</th>
		<th>목적지</th>
		<th>방문목적</th>
		<th>신청자연락처</th>
		<th>방문유형</th>
		<th>방문일자</th>
		<th>방문주기</th>
		<th>방문요일</th>
	</tr>
	</thead>
<!-- ========================================================================================================== -->
<!-- 1. if  : 검색결과가 없습니다 / 검색결과 보여주기 -->
<!-- 2. for : 모든 검색결과 보여주기 -->
	<tbody>
	
	<tr>
		<td colspan= "10" style="text-align: center;font-size:20px;font-weight: bold;text-decoration: underline;height:100px;">검색결과가 없습니다</td>
	</tr>
	
	<tr style="height:30px;">
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
		<td>Example</td>
	</tr>
	
	<tr style="cursor: pointer;" onClick="location.href='/project_ch4_pojo/View/company/manager/Manger_DetailVisitor.jsp'">
		<td colspan= "10" style="text-align: center;font-size:20px; font-weight: bold;text-decoration: underline;" >
		상세정보 예시</td>
	</tr>
	
	</tbody>
</table>

</div>

<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>

</body>
</html>