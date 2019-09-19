<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>물품 반입 신청 디테일</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<!-- CSS Style Import --> 
<style type="text/css">
/* 사이드바 설정 */ aside {
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
	margin: 3% 0px 0px 17%;
}

/* 스크롤 메뉴 */
ul.nav-pills {
	position: fixed;
}

/* class 스타일 */
div.col-lg-7 #section1 {
	height: 500px;
	margin-bottom: 10px;
	font-size: 28px;
}

div.col-lg-7 #section2, #section3, #section4 {
	height: 300px;
	margin-bottom: 10px;
	font-size: 28px;
}

div.panel-heading {
	font-size: 20px;
	font-weight: bold;
}

div.panel-body {
	height: 100%;
	border: 0px;
}

table.table {
	margin-bottom: 0px;
}

.row.table {
	margin-left: 0px;
	margin-right: 0px;
	text-align: center;
	font-size: 14px;
}

.row.table.basic {
	border-top: 2px solid #31708f;
}

.row.table.visitor {
	border-top: 2px solid #3c763d;
	margin-bottom: 50px;
}

.row.table.device {
	border-top: 2px solid #8a6d3b;
	margin-bottom: 50px;
}

.row.table.parking {
	border-top: 2px solid #333333;
	margin-bottom: 50px;
}

.table th, .table td {
	text-align: center;
	border: 1px solid #EDEDED;
}

.table th {
	background-color: #DDDDDD;
}

/* 캘린더 */
.calendar-saturday {
	color: #CC2222;
}

.calendar-today {
	font-weight: bold;
	color: #0000ff;
}

.calendar-disabled {
	opacity: 0.3;
	filter: alpha(opacity = 60);
	cursor: default;
}

input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button {
	-webkit-appearance: none;
	margin: 0;
}
</style>
<script type="text/javascript">
	var now = new Date();
</script>
</head>
<body>
<!-- java script -->
<script type="text/javascript">
//combobox 직접입력 방지
$.fn.combobox.defaults.editable = false

//datebox 날짜형식 YYYY-MM-DD로 설정
$.fn.datebox.defaults.formatter = function(date){
    var y = date.getFullYear();
    var m = date.getMonth()+1;
    var d = date.getDate();
    return y+'-'+(m<10 ? "0"+m:m)+'-'+(d<10 ? "0"+d:d);
}  
//datebox parser설정
$.fn.datebox.defaults.parser = function(s){
    var t = Date.parse(s);
    if (!isNaN(t)){
       return new Date(t);
    } else {
       return new Date();
    }
}
//datebox 한글화
$.fn.datebox.defaults.currentText = '오늘'
$.fn.datebox.defaults.closeText = '닫기'
$.fn.calendar.defaults.weeks = ['일','월','화','수','목','금','토']
$.fn.calendar.defaults.months = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']

$(document).ready(function(){
    ///////////////////////// 방문날짜 이벤트  //////////////////////////
    $("#visit_term").combobox("disable");
    $("#visit_day").combobox("disable");
    //방문유형 선택시 입력폼 Enable,Disable
    $("#visit_type").combobox({
       onChange: function(newValue){
          if("일일방문"==newValue){   //datebox 1개만 Enable
             $("#visit_term").combobox("disable");
             $("#visit_day").combobox("disable");
             $("#visit_date2").datebox("disable");
          }
          else if("기간방문"==newValue){   //datebox 2개만 Enable
             $("#visit_term").combobox("disable");
             $("#visit_day").combobox("disable");
             $("#visit_date2").datebox("enable");
          }
          else {   //정기방문 : 전부 Enable
             $("#visit_term").combobox("enable");
             $("#visit_day").combobox("enable");
             $("#visit_date2").datebox("enable");
          }
       }
    });
    //방문시작일 선택시 마지막일 선택범위 (시작일+1~내년 당일) 제한
    $('#visit_date1').datebox({
       onSelect: function(date){
          firstDate = date;
          $('#visit_date2').datebox().datebox('calendar').calendar({
                validator: function(date){
                    var now = new Date();
                    var d1 = new Date(firstDate.getFullYear(), firstDate.getMonth(), firstDate.getDate()+1);
                    var d2 = new Date(now.getFullYear()+1, now.getMonth(), now.getDate());
                    return d1<=date && date<=d2;
                }
            });
          //최소기간을 정해버리면 disable이 풀림.....
          //그래서 '일일방문'에선 다시 사용못하게 막아야함
          if("일일방문"==$("#visit_type").val()){
             $("#visit_date2").datebox("disable");
          }
       }
    });
    //방문일자 선택범위 (당일~내년 당일) 제한
    $('#visit_date1').datebox().datebox('calendar').calendar({
          validator: function(date){
              var now = new Date();
              var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
              var d2 = new Date(now.getFullYear()+1, now.getMonth(), now.getDate());
              return d1<=date && date<=d2;
          }
      });
    //방문일자 마지막일 범위 초기세팅
    $('#visit_date2').datebox().datebox('calendar').calendar({
          validator: function(date){
              var now = new Date();
              var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate()+1);
              var d2 = new Date(now.getFullYear()+1, now.getMonth(), now.getDate());
              return d1<=date && date<=d2;
          }
      });
    $("#visit_date2").datebox("disable");
    //방문일자  초기세팅 당일로 : js와 충돌 : DB에서 값 받아서 넣어주기
    $('#visit_date1').datebox('setValue',now.getFullYear()+'-'+now.getMonth()+'-'+(now.getDate()+1));
});
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
	</div>
</aside>

<div class="mainContent" style="padding-left:16%">
		<div class="col-lg-8">
			<div class="row">
				<div class="col-lg-9">
					<h2 style="margin-bottom: 20px; border-left: 4px solid #17405D;">
						<b>물품 반입 상세 조회</b> (승인자용)
					</h2>
				</div>
			</div>
			<div id="section1" class="panel panel-info">
				<div class="panel-heading">기본 방문정보</div>
				<div class="panel-body">
					<h4
						style="margin-bottom: 10px; border-left: 3px solid #31708f; padding-left: 4px;">
						<b>신청자 정보</b>
					</h4>
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
					<h4
						style="margin-bottom: 10px; border-left: 3px solid #31708f; padding-left: 4px;">
						<b>방문기간</b>
					</h4>
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
									<td><select id="visit_type" class="easyui-combobox"
										style="width: 80%;" data-options="panelHeight:'auto'">
											<option value="일일방문">일일방문</option>
											<option value="기간방문">기간방문</option>
											<option value="정기방문">정기방문</option>
									</select></td>
									<td><select id="visit_term" class="easyui-combobox"
										style="width: 80%;" data-options="panelHeight:'auto'">
											<option value="매주">매주</option>
											<option value="격주">격주</option>
											<option value="첫째주">첫째주</option>
											<option value="둘째주">둘째주</option>
											<option value="셋째주">셋째주</option>
											<option value="넷째주">넷째주</option>
											<option value="마지막주">마지막주(넷째주포함)</option>
									</select></td>
									<td><select id="visit_day" class="easyui-combobox"
										style="width: 80%;" data-options="panelHeight:'auto'">
											<option value="월요일">월요일</option>
											<option value="화요일">화요일</option>
											<option value="수요일">수요일</option>
											<option value="목요일">목요일</option>
											<option value="금요일">금요일</option>
											<option value="토요일">토요일</option>
											<option value="일요일">일요일</option>
									</select></td>
								</tr>
							</tbody>
						</table>
						<table class="table">
							<tr>
								<th>방문날짜</th>
								<td><input id="visit_date1" class="easyui-datebox"
									style="width: 30%; height: 100%"> &emsp;&emsp;<span>~</span>&emsp;&emsp;
									<input id="visit_date2" class="easyui-datebox"
									style="width: 30%; height: 100%"></td>
							</tr>
						</table>
					</div>
					<h4
						style="margin-bottom: 10px; border-left: 3px solid #31708f; padding-left: 4px;">
						<b>상세정보</b>
					</h4>
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
									<td><input class="easyui-combobox" style="width: 80%;"
										data-options="panelHeight:'auto'"></td>
									<td><input class="easyui-textbox" style="width: 80%;"></td>
									<td><input class="easyui-textbox" style="width: 80%;"></td>
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
							<h4 style="border-left: 3px solid #3c763d; padding-left: 4px;">
								<b>방문자 정보</b>
							</h4>
						</div>
					</div>
					<div class="row table visitor">
						<table id="tb_visitor" class="table">
							<thead>
								<tr>
									<th><input id="chkAllVisitor" type="checkbox"></th>
									<th style="width: 40%;">성명</th>
									<th style="width: 50%;">연락처</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="section5" class="panel panel-danger">
				<div class="panel-heading">반입 물품</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-8">
							<h4 style="border-left: 3px solid #8a6d3b; padding-left: 4px;">
								<b>반입물품 정보</b>
							</h4>
						</div>
					</div>
					<div class="row table goods">
						<table id="tb_goods" class="table">
							<thead>
								<tr>
									<th><input id="chkAllGoods" type="checkbox"></th>
									<th style="width: 30%;">반입물품명</th>
									<th style="width: 30%;">물품종류</th>
									<th style="width: 30%;">물품수량</th>
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
							<h4 style="border-left: 3px solid #8a6d3b; padding-left: 4px;">
								<b>반입기기 정보</b>
							</h4>
						</div>
					</div>
					<div class="row table device">
						<table id="tb_device" class="table">
							<thead>
								<tr>
									<th><input id="chkAllDevice" type="checkbox"></th>
									<th style="width: 30%;">기종</th>
									<th style="width: 30%;">제조사</th>
									<th style="width: 30%;">모델명</th>
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
							<h4 style="border-left: 3px solid #333333; padding-left: 4px;">
								<b>차량 정보</b>
							</h4>
						</div>
					</div>
					<div class="row table parking">
						<table id="tb_parking" class="table">
							<thead>
								<tr>
									<th><input id="chkAllParking" type="checkbox"></th>
									<th style="width: 40%;">차량번호</th>
									<th style="width: 20%;">차종</th>
									<th style="width: 30%;">차량모델명</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<div style="float: right; margin-bottom:20%;">
				<button type="button" id="permission" class="btn btn-primary">반입 신청 승인</button>
				<button type="button" id="return" class="btn btn-danger">반입 신청 반려</button>
				<button type="button" class="btn btn-default" onClick="location.href='javascript:history.back()'">이전 페이지</button>
			</div>
		</div>
</div>
	<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>