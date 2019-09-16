<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>방문 상세 페이지</title>
<%@ include file="/Style/common/HeadUI.jsp"%>
<!-- CSS Style Import --> 
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
	margin:30px 20px 5% 17%;
}
</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="300">
<%@ include file="../../CommonForm/Top.jsp"%>

<!-- Side Bar -->
<aside>
	<div class="panel-group" style="margin-top:90px"> 	<!-- Footer 짤리는 표 부분 보여주기 -->
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse1">방문 신청 조회</a>
				</h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse in">
				<div class="panel-body">
					<a  href="#">방문 신청 조회</a><br> 
					<a  href="#">방문현황 조회</a><br> 
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
					<a  href="#">반입 신청 조회</a><br> 
					<a  href="#">반입 현황 조회</a><br> 
				</div>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse3">여분 목록</a>
				</h4>
			</div>
			<div id="collapse3" class="panel-collapse collapse">
				<div class="panel-body">
					<a  href="#">sub0</a><br> 
					<a  href="#">sub1</a><br> 
					<a  href="#">sub2</a><br> 
					<a  href="#">sub3</a><br>
				</div>
			</div>
		</div>
	</div>
</aside>

<!-- Content -->
<div class="mainContent">
	<div class="row"><!-- <!-- -----------------창 고정 및 스타일---------------------------------------- -->
	    <div class="col-sm-2" id="myScrollspy" style="text-align:center;">
		    <ul class="nav nav-pills nav-stacked">
		      <li class="active"><a href="#section1">기본 방문정보</a></li>
		      <li><a href="#section2">방문자 등록</a></li>
		      <li><a href="#section3">반입기기</a></li>
		      <li><a href="#section4">주차등록</a></li>
		    </ul>
	    </div>
	    <div class="col-sm-7"> 
			<div class="row">
		    	<div class="col-lg-9">
					<h2 style="margin-bottom:20px; border-left: 4px solid #17405D;"><b>방문 신청 상세 조회</b> (승인자용)</h2>
		    	</div>
				<div class="col-lg-3" style="float: right; margin-top: 3%">
					<button type="button" id="permission" class="btn btn-primary" >신청 승인</button>
					<button type="button" id="return" class="btn btn-danger">신청 반려</button>
				</div>
			</div>
		    <div id="section1" class="panel panel-info">    
			    <div class="panel-heading">기본 방문정보</div>
			    <div class="panel-body">
			    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>신청자 정보</b></h4>
			    	<div class="row table basic">
			    		<table class="table">
			    			<tr>
			    				<th>성명</th>
			    				<td>(성명)</td>
			    				<th>전화번호</th>
			    				<td>010-0000-1234</td>
			    			</tr>
			    		</table>
			    	</div>
			    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>방문기간</b></h4>
			    	<div class="row table basic">
			    		<table class="table">
			    			<thead>
			    				<tr>
				    				<th>방문유형</th>
				    				<th>방문주기</th>
				    				<th>방문요일</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    				<tr>
			    					<td>
			    						<select id="visit_type" class="easyui-combobox" style="width:80%;" data-options="panelHeight:'auto'">
			    							<option value="일일방문">일일방문</option>
			    							<option value="기간방문">기간방문</option>
			    							<option value="정기방문">정기방문</option>
			    						</select>
			    					</td>
			    					<td>
			    						<select id="visit_term" class="easyui-combobox" style="width:80%;" data-options="panelHeight:'auto'">
			    							<option value="매주">매주</option>
			    							<option value="격주">격주</option>
			    							<option value="첫째주">첫째주</option>
			    							<option value="둘째주">둘째주</option>
			    							<option value="셋째주">셋째주</option>
			    							<option value="넷째주">넷째주</option>
			    							<option value="마지막주">마지막주(넷째주포함)</option>
			    						</select>
			    					</td>
			    					<td>
			    						<select id="visit_day" class="easyui-combobox" style="width:80%;" data-options="panelHeight:'auto'">
			    							<option value="월요일">월요일</option>
			    							<option value="화요일">화요일</option>
			    							<option value="수요일">수요일</option>
			    							<option value="목요일">목요일</option>
			    							<option value="금요일">금요일</option>
			    							<option value="토요일">토요일</option>
			    							<option value="일요일">일요일</option>
			    						</select>
			    					</td>
			    				</tr>
			    			</tbody>
			    		</table>
			    		<table class="table">
			    			<tr>
			    				<th>방문날짜</th>
			    				<td>
			    					<input id="visit_date1" class="easyui-datebox" style="width:30%;height:100%">
			    					&emsp;&emsp;<span>~</span>&emsp;&emsp;
			    					<input id="visit_date2" class="easyui-datebox" style="width:30%;height:100%">
			    				</td> 
			    			</tr>
			    		</table>
			    	</div>
			    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>상세정보</b></h4>
			    	<div class="row table basic">
			    		<table class="table">
			    			<thead>
			    				<tr>
				    				<th>목적지</th>
				    				<th>담당자</th>
				    				<th>방문목적</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    				<tr>
			    					<td><input class="easyui-combobox" style="width:80%;" data-options="panelHeight:'auto'"></td>
			    					<td><input class="easyui-textbox" style="width:80%;"></td>
			    					<td><input class="easyui-textbox" style="width:80%;"></td>
			    				</tr>
			    			</tbody>
			    		</table>
			    	</div>
			    </div>
		    </div>
		    <div id="section2" class="panel panel-success">    
			    <div class="panel-heading">방문자 등록</div>
			    <div class="panel-body">
			    	<div class="row">
			    		<div class="col-lg-8">
					    	<h4 style="border-left: 3px solid #3c763d; padding-left:4px;"><b>방문자 정보</b></h4>
					    </div>
				    </div>
			    	<div class="row table visitor">
			    		<table id="tb_visitor" class="table">
			    			<thead>
			    				<tr>
			    					<th><input id="chkAllVisitor" type="checkbox"></th>
				    				<th style="width:40%;">성명</th>
				    				<th style="width:50%;">연락처</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    			</tbody>
			    		</table>
			    	</div>
			    </div>
		    </div>
		    <div id="section3" class="panel panel-warning">    
			    <div class="panel-heading">반입기기</div>
			    <div class="panel-body">
			    	<div class="row">
			    		<div class="col-lg-8">
					    	<h4 style="border-left: 3px solid #8a6d3b; padding-left:4px;"><b>반입기기 정보</b></h4>
				    	</div>
				    </div>
				    <div class="row table device">
			    		<table id="tb_device" class="table">
			    			<thead>
			    				<tr>
			    					<th><input id="chkAllDevice" type="checkbox"></th>
				    				<th style="width:30%;">기종</th>
				    				<th style="width:30%;">제조사</th>
				    				<th style="width:30%;">모델명</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    			</tbody>
			    		</table>
			    	</div>
			    </div>
		    </div>
		    <div id="section4" class="panel panel-default">    
			    <div class="panel-heading">주차등록</div>
			    <div class="panel-body">
			    	<div class="row">
			    		<div class="col-lg-8">
			    			<h4 style="border-left: 3px solid #333333; padding-left:4px;"><b>차량 정보</b></h4>
				    	</div>
				    </div>
			    	<div class="row table parking">
				    	<table id="tb_parking" class="table">
				    		<thead>
				    			<tr>
				    				<th><input id="chkAllParking" type="checkbox"></th>
									<th style="width:40%;">차량번호</th>
									<th style="width:20%;">차종</th>
									<th style="width:30%;">차량모델명</th>
				    			</tr>
				    		</thead>
				    	</table>
				    </div>
			    </div>
		    </div>
	    </div>
  	</div>
</div>

<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
<!-- java script -->
<script type="text/javascript">
/* 라디오버튼 */
 //라디오 버튼 변경시 이벤트
$("input[name='SearchType']:radio").change(function () {
 //라디오 버튼 값을 가져온다.
var SearchType = this.value;
                         
if(SearchType == "CompanyName"){//스포츠인 경우
	//방문자명 연락처 검색 hide
	$( "#NameTelSearchBox" ).hide();
	//회사명 검색 show
	$( "#CompanyNameSearchBox" ).show();
	}
else if(SearchType == "NameTel"){//공연/전시인 경우
	//회사명 검색 hide
	$( "#CompanyNameSearchBox" ).hide();
	//방문자명 연락처 검색 show
	$( "#NameTelSearchBox" ).show();
	}                     
});


/*<!-- ========================================================================================================== --> */
/* 달력 기능 */

/* searchBox Enter 검색 기능 */
   function proc_key() {
      if(event.keyCode == 13) {
         item.focus();
         event.returnValue = false;
      }
   }
</script>
<!-- Bottom Link Import --> 
<%-- <%@ include file="/Style/common/BottomUI.jsp"%> --%>
</body>
</html>