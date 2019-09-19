<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
<title>Insert title here</title>
<style type="text/css">
	#h_row{
		background-color: silver;
	}
	#table1 {
	    border-left-style: hidden;
	    border-right-style: hidden;
	    border-top-style: groove;
		border-top-color: #00508a;
		    
	}
	#table1 td{
		
	}
	#warn1{
		text-align: left;
		-webkit-text-stroke-width: thin;
	}
	#warn2{
		margin-top: 10px;
	    text-align: left;
	    margin-bottom: auto;
	    margin-left: inherit;
	}
	
</style>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
	<div class="container-fluid" style="text-align: center;">
		<div>
			<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
				<h3 align="left">방문 예약 시스템</h3>
				<div class="row">
					<h4 class="col-sm-7"align="left" > | 제  목</h4>
					<div class="col-sm-3" style="float: right:;" align="right">
						<div class="dropdown"  >
							<button class="btn btn-menu dropdown-toggle" type="button" 
									data-toggle="dropdown" style="width: 100%; float: right">방문자 선택 이력
    							<span class="caret"></span>
    						</button>
						</div>
					</div>
					<div class="col-sm-2" style="padding: inherit;">
						<input class="btn btn-info" style="width: 90%; ">
					</div>
				</div>
				<div class="row" style="margin-bottom: -16px;">
					<table class="table" border="1">
						<tr id="table1">
							<td width="10%" style="background-color: #dddddd;">성명/생년월일</td>
							<td width="10%"></td>
							<td width="10%" style="background-color: #dddddd;">휴대전화번호</td>
							<td width="10%"></td>
							<td width="10%" style="background-color: #dddddd;">회사명</td>
							<td width="10%"></td>
						</tr>
					</table>
				</div>
				<div class="row">
					<div id="warn1">
						※ 방문자 변경 및 동행자 추가는 신청자에게 책임이 있습니다. 방문자(동행자)정보 확인과 정보보안 서약을 성실히 준수하여 주시기 바랍니다.
					</div>
				</div>
				<div class="row">
					<h4 class="col-sm-2" align="left" > | 제  목2</h4>
					<div id="warn2" class="col-sm-8" style="text-align: left;">
						<span style="color:#000000">총 0 회 ( 09:00 이전 :<span style=color:#FF0000>0</span> 회, 09:00 이후 :<span style=color:#FF0000>0</span> 회 )</span>
					</div>
					<div class="col-sm-2">
						<input class="btn btn-info" style="width: 90%; ">
					</div>
				</div>
			</div>
		</div>
		
	
	
	</div>
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>