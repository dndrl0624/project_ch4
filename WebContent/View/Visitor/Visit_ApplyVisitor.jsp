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
	th,td {
		text-align:center;
		border: 1px solid #EDEDED;
	}
	th {
		background-color: #DDDDDD;
	}
	.modal-header.visitor {
		background-color: #dff0d8;
	}
</style>
<title>방문 신청 - CH4 방문자 관리 시스템</title>
<script type="text/javascript">
	var vIndex = 1;
	var dIndex = 1;
	var pIndex = 1;
</script>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="300">
<%@ include file="/View/CommonForm/Top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		///////////////////////// 방문자 추가 이벤트 /////////////////////////
		//방문자 추가 modal 띄우기
		$("#btn_addRowVisitor").on('click',function(){
			if(vIndex>=10){
				alert("방문인원은 최대 10명입니다.");
				return;
			}
			$("#md_visitor").modal("show");
		});
		//입력값 테이블에 row 추가하기
		$("#addVisitor").on('click',function(){
			var name = $("#v_name").val();
			var hp = $("#v_hp").val();
			var row = "<tr id='row'"+vIndex+"><td><input id='chkVisitor' type='checkbox' value='"+vIndex+"'></td>"
					+"<td>"+name+"</td>"
					+"<td>"+hp+"</td></tr>";
			$("#tb_visitor tbody").append(row);
			$("#v_name").textbox('setValue',null);
			$("#v_hp").textbox('setValue',null);
			$("#md_visitor").modal("hide");
			vIndex++;
		});
		//전체선택
		$("#chkAllVisitor").on('click',function(){
			var chkAll = $(this).is(":checked");
			if(chkAll) {
		    	$("#tb_visitor input:checkbox").prop("checked", true);
			}
		    else {
		    	$("#tb_visitor input:checkbox").prop("checked", false);
		    }
		});
		//선택된 row 제거하기 (미완성)
		$("#btn_delRowVisitor").on('click',function(){
			$("#tb_visitor #chkVisitor:checked").each(function(){
				alert($(this).val());
			});
		});
		////////////////////////////////////////////////////////////////
		///////////////////////// 반입기기 추가 이벤트 /////////////////////////
		$("#btn_addRowDevice").on('click',function(){
			$("#md_device").modal("show");
		});
		$("#addDevice").on('click',function(){
			var name = $("#d_name").val();
			var model = $("#d_model").val();
			var row = "<tr id='row'"+dIndex+"><td><input id='chkDevice' type='checkbox' value='"+dIndex+"'></td>"
					+"<td>"+name+"</td>"
					+"<td>"+model+"</td></tr>";
			$("#tb_device tbody").append(row);
			$("#d_name").textbox('setValue',null);
			$("#d_model").textbox('setValue',null);
			$("#md_device").modal("hide");
			dIndex++;
		});
		$("#chkAllDevice").on('click',function(){
			var chkAll = $(this).is(":checked");
			if(chkAll) {
		    	$("#tb_device input:checkbox").prop("checked", true);
			}
		    else {
		    	$("#tb_device input:checkbox").prop("checked", false);
		    }
		});
		$("#btn_delRowDevice").on('click',function(){
			$("#tb_device #chkDevice:checked").each(function(){
				alert($(this).val());
			});
		});
		////////////////////////////////////////////////////////////////
		///////////////////////// 차량 추가 이벤트 ///////////////////////////
		$("#btn_addRowParking").on('click',function(){
			$("#md_parking").modal("show");
		});
		$("#p_kind").combobox({
			onChange:function(newValue){
				
			}
		});
		$("#addParking").on('click',function(){
			var num = $("#p_num").val();
			var kind = $("#p_kind").val();
			var model = $("#p_model").val();
			var row = "<tr id='row'"+pIndex+"><td><input id='chkParking' type='checkbox' value='"+pIndex+"'></td>"
					+"<td>"+num+"</td>"
					+"<td>"+kind+"</td>"
					+"<td>"+model+"</td></tr>";
			$("#tb_parking tbody").append(row);
			$("#p_num").textbox('setValue',null);
			$("#p_kind").combobox('select','차종');
			$("#p_model").combobox('select','차량모델명');
			$("#md_parking").modal("hide");
			pIndex++;
		});
		$("#chkAllParking").on('click',function(){
			var chkAll = $(this).is(":checked");
			if(chkAll) {
		    	$("#tb_parking input:checkbox").prop("checked", true);
			}
		    else {
		    	$("#tb_parking input:checkbox").prop("checked", false);
		    }
		});
		$("#btn_delRowParking").on('click',function(){
			$("#tb_parking #chkParking:checked").each(function(){
				alert($(this).val());
			});
		});
		////////////////////////////////////////////////////////////////
	});
</script>
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
							<button id="btn_addRowVisitor" class="btn btn-default">방문자 추가</button>
							<button id="btn_delRowVisitor" class="btn btn-danger">선택삭제</button>
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
					    	<h6 style="margin-bottom:10px;">소지하실 상용정보 통신기기를 모두 등록 해주시기 바랍니다.</h6>
				    	</div>
				    	<div class="col-lg-4" style="text-align:right;padding-top:20px;">
							<button id="btn_addRowDevice" class="btn btn-default">기기 추가</button>
							<button id="btn_delRowDevice" class="btn btn-danger">선택삭제</button>
		    			</div>
				    </div>
				    <div class="row table device">
			    		<table id="tb_device" class="table">
			    			<thead>
			    				<tr>
			    					<th><input id="chkAllDevice" type="checkbox"></th>
				    				<th style="width:40%;">기기명</th>
				    				<th style="width:50%;">기종</th>
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
				    	<div class="col-lg-4" style="text-align:right;padding-top:5px;">
							<button id="btn_addRowParking" class="btn btn-default">차량 추가</button>
							<button id="btn_delRowParking" class="btn btn-danger">선택삭제</button>
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
				    		<tbody>
				    		</tbody>
				    	</table>
				    </div>
			    </div>
		    </div>
	    </div>
  	</div>
</div>
<!-- 방문자 추가 시 입력폼 Modal -->
<div id="md_visitor" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header visitor">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">방문자 정보 입력</h4>
			</div>
			<div class="modal-body" style="text-align:center;">
				<input id="v_name" class="easyui-textbox" label="성명" labelPosition="left" ><br><br>
				<input id="v_hp" class="easyui-textbox" label="전화번호" labelPosition="left" >
			</div>
			<div class="modal-footer">
        		<button type="button" class="btn btn-primary" id="addVisitor">추가</button>
        		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        	</div>
		</div>
	</div>
</div>
<!-- 반입기기 추가 시 입력폼 Modal -->
<div id="md_device" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header device">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">반입기기 정보 입력</h4>
			</div>
			<div class="modal-body" style="text-align:center;">
				<input id="d_name" class="easyui-textbox" label="기기명" labelPosition="left" ><br><br>
				<input id="d_model" class="easyui-textbox" label="기종" labelPosition="left" >
			</div>
			<div class="modal-footer">
        		<button type="button" class="btn btn-primary" id="addDevice">추가</button>
        		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        	</div>
		</div>
	</div>
</div>
<!-- 차량 추가 시 입력폼 Modal -->
<div id="md_parking" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header parking">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">차량 정보 입력</h4>
			</div>
			<div class="modal-body" style="text-align:center;">
				<input id="p_num" class="easyui-textbox" label="차량번호" labelPosition="left" data-options="promt:'예시)OOO가1234'"><br><br>
				<select id="p_kind" class="easyui-combobox" label="차종" labelPosition="left" >
					<option value=''>차종</option> 
					<option value='승용차'>승용차</option> 
					<option value='승합차'>승합차</option> 
					<option value='작업차'>작업차</option> 
					<option value='특수차'>특수차</option> 
					<option value='오토바이'>오토바이</option> 
				</select><br><br>
				<select id="p_model" class="easyui-combobox" label="차량모델명" labelPosition="left" >
					<option value="">차량모델명</option>
				</select>
			</div>
			<div class="modal-footer">
        		<button type="button" class="btn btn-primary" id="addDevice">추가</button>
        		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        	</div>
		</div>
	</div>
</div>
</body>
</html>