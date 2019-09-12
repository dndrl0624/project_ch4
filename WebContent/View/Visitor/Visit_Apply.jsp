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
<!-- CSS Style Import --> 
<style type="text/css"> 
<%@ include file="/Style/css/CssStyle.css"%>
</style>
<style>
	body {
		position: relative;
	}
	ul.nav-pills {
		padding-top: 70px;
		position: fixed;
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
	}
	.row.table.device {
		border-top: 2px solid #8a6d3b;
	}
	th,td {
		text-align:center;
		border: 1px solid #EDEDED;
	}
	th {
		background-color: #DDDDDD;
	}
	
</style>
<title>방문 신청 - CH4 방문자 관리 시스템</title>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="300">
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container-fluid">
	<div class="row">
	    <div class="col-lg-offset-1 col-lg-1" id="myScrollspy" style="padding-left:50px;text-align:center;">
		    <ul class="nav nav-pills nav-stacked">
		      <li class="active"><a href="#section1">기본 방문정보</a></li>
		      <li><a href="#section2">방문자 등록</a></li>
		      <li><a href="#section3">반입기기</a></li>
		      <li><a href="#section4">주차등록</a></li>
		    </ul>
	    </div>
	    <div class="col-lg-7 col-lg-offset-1"> 
			<div class="row">
		    	<div class="col-lg-10">
					<h2 style="margin-bottom:20px; border-left: 4px solid #17405D; padding-left:8px;"><b>방문 신청</b> (방문지)</h2>
		    	</div>
		    	<div class="col-lg-2" style="text-align:right; padding-top:30px;">
					<button class="btn btn-primary">방문이력</button>
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
			    	<h6 style="margin-bottom:10px;">신청일로부터 1년 이내로 가능합니다.</h6>
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
			    						<select class="easyui-combobox" style="width:80%;">
			    							<option value="일일방문">일일방문</option>
			    							<option value="기간방문">기간방문</option>
			    							<option value="정기방문">정기방문</option>
			    						</select>
			    					</td>
			    					<td>
			    						<select class="easyui-combobox" style="width:80%;">
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
			    						<select class="easyui-combobox" style="width:80%;">
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
			    					<input class="easyui-datebox" style="width:30%;height:100%">
			    					&emsp;&emsp;<span>~</span>&emsp;&emsp;
			    					<input class="easyui-datebox" style="width:30%;height:100%">
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
			    					<td><input class="easyui-combobox" style="width:80%;"></td>
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
					    	<h6 style="margin-bottom:10px;">방문자는 최대 10명으로 제한합니다.</h6>
					    </div>
					    <div class="col-lg-4" style="text-align:right;padding-top:20px;">
							<button class="btn btn-default">방문자 추가</button>
							<button class="btn btn-danger">선택삭제</button>
		    			</div>
				    </div>
			    	<div class="row table visitor">
			    		<table class="table">
			    			<thead>
			    				<tr>
			    					<th><input type="checkbox"></th>
				    				<th>성명</th>
				    				<th>연락처</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    				<tr>
			    					<td><input type="checkbox"></td>
			    					<td><input class="easyui-textbox" style="width:80%;"></td>
			    					<td><input class="easyui-textbox" style="width:80%;"></td>
			    				</tr>
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
					    	<h6 style="margin-bottom:10px;">소지하실 상용정보 통신기기를 모두 등록 해주시기 바랍니다.</h6>
				    	</div>
				    	<div class="col-lg-4" style="text-align:right;padding-top:20px;">
							<button class="btn btn-default">기기 추가</button>
							<button class="btn btn-danger">선택삭제</button>
		    			</div>
				    </div>
				    <div class="row table device">
			    		<table class="table">
			    			<thead>
			    				<tr>
			    					<th><input type="checkbox"></th>
				    				<th>기기명</th>
				    				<th>기종</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    				<tr>
			    					<td><input type="checkbox"></td>
			    					<td><input class="easyui-textbox" style="width:80%;"></td>
			    					<td><input class="easyui-textbox" style="width:80%;"></td>
			    				</tr>
			    			</tbody>
			    		</table>
			    	</div>
			    </div>
		    </div>
		    <div id="section4" class="panel panel-default">    
			    <div class="panel-heading">주차등록</div>
			    <div class="panel-body">
			    	<h4 style="border-left: 3px solid #333333; padding-left:4px;"><b>차량 정보</b></h4>
			    </div>
		    </div>
	    </div>
  	</div>
</div>
</body>
</html>