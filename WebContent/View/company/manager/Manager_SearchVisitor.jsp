<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>방문 신청 조회 페이지</title>
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

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 50%; /* Could be more or less, depending on screen size */                          
}
/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
/* 메인 페이지 프레임 구간 설정 */
.mainContent {
	margin:30px 20px 10px 17%;
}
</style>
</head>
<body>
<%@ include file="../../CommonForm/Top.jsp"%>

<!-- Side Bar -->
<aside>
	<div class="panel-group" style="margin-top:90px">
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
	<div style="margin:30px 20px 10px 0px;font-size:35px;">
	방문 신청 조회 페이지
	<!-- <button type="button" id="lastDetail" class="btn btn-info" style="margin-left:456px;">이전 방문 이력</button><br> -->
	</div>
<!-- margin : top right bottom left 순서 -->
	<div class='col-sm-1'></div>
	<div class='col-sm-2'>
<!-- 검색 타입 설정 -->
	<div style="margin-bottom:3px">
		<input type="radio" name="SearchType" value="CompanyName" checked="checked"><span>회사명</span>
		<input type="radio" name="SearchType" value="NameTel"><span>방문자명+연락처</span>
	</div>
<!-- 검색창 : 라디오버튼에 의한 분기 -->
	<span id="CompanyNameSearchBox">
		<textarea name="CompanyNameSearchBox" style="width:100%;height:25px;overflow:hidden;" placeholder="회사명을 입력하세요"></textarea>
		<input class="easyui-textbox" name="CompanyNameSearchBox" style="width:30px;height:25px;" data-options="prompt:'회사명을 입력하세요'">
	</span>
	<span id="NameTelSearchBox" style="display:none">
		<input class="easyui-textbox" name="NameSearchBox" style="width:100%;height:25px;overflow:hidden;" data-options="prompt:'방문자명을 입력하세요'">
		<input class="easyui-textbox" name="TelSearchBox" style="width:100%;height:25px;overflow:hidden;" data-options="prompt:'Tel (    )      -'">
		<textarea name="NameSearchBox" style="width:100%;height:25px;overflow:hidden;" placeholder="방문자명을 입력하세요"></textarea>
		<textarea name="TelSearchBox" style="width:100%;height:25px;overflow:hidden;" placeholder="Tel (    )      -"></textarea>
	</span>
	</div>
	<div  class='col-sm-4'>
<!-- 날짜 검색 -->
	<div class="form-group">
		<div class='col-sm-5'>
			신청 시작일
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
			신청종료일
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
<button type="button" class="btn btn-success" style="margin-top: 5px;margin-bottom: 15px;float: bottom;">Search</button>
</div>
	</div>
	

<!-- 검색 결과 테이블 -->
<table style="width: 100%;" border="1">
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
	</tbody>
</table>

 
<!-- The Modal -->
    <div id="detailModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <p>디테일 페이지 만든 후, 적용하기</p>
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

//Modal
var modal = document.getElementById('detailModal');

// Get the button that opens the modal
var btn = document.getElementById("lastDetail");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];                                          

// 버튼 눌렀을 시, Modal 열기
btn.onclick = function() {
    modal.style.display = "block";
}

// x버튼 눌렀을 때
span.onclick = function() {
    modal.style.display = "none";
}

// Modal 밖 부븐 클릭 시
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
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
>>>>>>> refs/remotes/origin/ht_view
</html>