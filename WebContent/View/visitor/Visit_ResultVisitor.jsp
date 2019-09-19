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
<title>신청결과 - CH4 방문자 관리 시스템</title>
<style>
	body {
		position: relative;
	}
	div.col-lg-7 #section1 {
		height: 500px;
		margin-bottom: 10px;
		font-size: 28px;
	}
	div.col-lg-7 #section2,#section3,#section4 {
		height: 300px;
		margin-bottom: 10px;
		font-size: 28px;
	}
	div.panel-heading {
		font-size:20px;
		font-weight:bold;
	}
	div.panel-body {
		height: 100%;
		border: 0px;
	}
	table.table {
		margin-bottom:0px;
	}
	.row.table {
		margin-left:0px;
		margin-right:0px;
		text-align:center;
		font-size:14px;
	}
	.row.table.basic {
		border-top: 2px solid #31708f;
	}
	.row.table.visitor {
		border-top: 2px solid #3c763d;
		margin-bottom:50px;
	}
	.row.table.device {
		border-top: 2px solid #8a6d3b;
		margin-bottom:50px;
	}
	.row.table.parking {
		border-top: 2px solid #333333;
		margin-bottom:50px;
	}
	.table th,
	.table td {
		text-align:center;
		border: 1px solid #EDEDED;
	}
	.table th {
		background-color: #DDDDDD;
	}
</style>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container-fluid">
	<div class="row">
	    <div class="col-lg-8 col-lg-offset-2"> 
			<div class="row">
		    	<div class="col-lg-10">
					<h2 style="margin-bottom:20px; border-left: 4px solid #17405D; padding-left:8px;"><b>방문 신청 결과</b> ()</h2>
		    	</div>
			</div>
	    	<input id="com_no" type="hidden" name="com_no" value="">
			<div id="section1" class="panel panel-info">    
			    <div class="panel-heading">기본 방문정보</div>
			    <div class="panel-body">
			    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>신청자 정보</b></h4>
			    	<div class="row table basic">
			    		<table class="table">
			    			<tr>
			    				<th>신청번호</th>
			    				<td></td>
			    				<th>성명</th>
			    				<td></td>
			    				<th>연락처</th>
			    				<td></td>
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
				    				<th>방문날짜</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    				<tr>
			    					<td></td>
			    					<td></td>
			    					<td></td>
			    					<td></td>
			    				</tr>
			    			</tbody>
			    		</table>
			    	</div>
			    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>상세정보</b></h4>
			    	<div class="row table basic">
			    		<table class="table">
			    			<thead>
			    				<tr>
				    				<th>방문지</th>
				    				<th>목적지</th>
				    				<th>방문목적</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    				<tr>
			    					<td></td>
			    					<td></td>
			    					<td></td>
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
									<th style="width:40%;">차량번호</th>
									<th style="width:20%;">차종</th>
									<th style="width:30%;">차량모델명</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    		</tbody>
				    	</table>
				    </div>
			    </div>
			</div><br>
			<div style="text-align:center;"> 
				<button id="btn_update" class="btn btn-primary" type="button" onclick="" style="width:150px;margin-right:20px;">신청변경</button>
				<button id="btn_main" class="btn btn-info" type="button" onclick="location.href='Visit_Main.jsp'" style="width:150px;">메인으로</button>
			</div>
	    </div>
  	</div>
</div>
</body>
</html>