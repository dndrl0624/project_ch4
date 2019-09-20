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
	#section1 {
		height: 350px;
		margin-bottom: 10px;
		font-size: 28px;
	}
	#section2 {
		height: 500px;
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
	.row.table.goods {
		border-top: 2px solid #3c763d;
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
<script type="text/javascript">
	$(document).ready(function(){
		var gRow = "<tr><td>lg그램</td><td>노트북</td><td>10개</td></tr>";
		for(var i=0;i<15;i++){
			$("#tb_goods tbody").append(gRow);
		}
	});
</script>
<div class="container-fluid">
	<div class="row">
	    <div class="col-lg-8 col-lg-offset-2"> 
	    	<div style="text-align:center;">
	    		<img src="../../Style/images/crud/transport_logo_default.png" class="img-thumbnail" style="width:30%;border:0px;">
	    		<h3 style="margin-top:10px;">"고객님의 반입신청이 <b style="font-size:40px; color:#b22222;">접수</b><b style="font-size:24px; color:#4169e1;">(신청번호)</b>되었습니다."</h3>
	    	</div><br>
	    	<div class="row" style="text-align:center;">
	    		<h5 style="margin-bottom:20px;font-weight:bold;">※신청내용 변경 또는 취소는 당일 오후 4시까지 가능하며</h5>
	    		<h5 style="font-weight:bold;">신청번호를 모를 경우 이용에 제한될 수 있는 점 양해바랍니다.</h5>
	    	</div><br>
	    	<div class="row">
		    	<div style="text-align:center;"> 
					<button id="btn_update" class="btn btn-primary" type="button" onclick="" style="width:120px;margin-right:20px;">신청변경</button>
					<button id="btn_cancle" class="btn btn-danger" type="button" onclick="" style="width:120px;margin-right:20px;">신청취소</button>
					<button id="btn_navi" class="btn btn-default" type="button" onclick="location.href='Visit_Navigation.jsp'" style="width:120px;margin-right:20px;">오시는길</button>
					<button id="btn_main" class="btn btn-info" type="button" onclick="location.href='Visit_Main.jsp'" style="width:120px;">메인으로</button>
				</div>
			</div><br><br>
			<div class="row">
		    	<div class="col-lg-10">
					<h2 style="margin-bottom:20px; border-left: 4px solid #17405D; padding-left:8px;"><b>신청 정보</b></h2>
		    	</div>
			</div>
	    	<input id="com_no" type="hidden" name="com_no" value="">
			<div id="section1" class="panel panel-info">    
			    <div class="panel-heading">기본 반입정보</div>
			    <div class="panel-body">
			    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>신청자 정보</b></h4>
			    	<div class="row table basic">
			    		<table class="table">
			    			<thead>
				    			<tr>
				    				<th>신청번호</th>
				    				<th>신청일자</th>
				    				<th>성명</th>
				    				<th>연락처</th>
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
			    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>상세정보</b></h4>
			    	<div class="row table basic">
			    		<table class="table">
			    			<thead>
			    				<tr>
				    				<th>반입날짜</th>
				    				<th>목적지</th>
				    				<th>반입사유</th>
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
			    <div class="panel-heading">물품 정보</div>
			    <div class="panel-body">
			    	<div class="row">
			    		<div class="col-lg-8">
					    	<h4 style="border-left: 3px solid #3c763d; padding-left:4px;"><b>반입 물품 정보</b></h4>
					    </div>
				    </div>
			    	<div class="row table goods">
			    		<table id="tb_goods" class="table">
			    			<thead>
			    				<tr>
				    				<th style="width:40%;">물품명</th>
				    				<th style="width:40%;">물품종류</th>
				    				<th style="width:20%;">EA</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    			</tbody>
			    		</table>
			    	</div>
			    </div>
			</div>
	    </div>
  	</div>
</div>
</body>
</html>