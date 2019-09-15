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
	div.col-lg-7 #section1,#section2 {
		/* height: 300px; */
		height:100%;
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
	th,td {
		text-align:center;
		border: 1px solid #EDEDED;
	}
	th {
		background-color: #DDDDDD;
	}
	.modal-header.goods {
		background-color: #dff0d8;
	}
</style>
<title>반입 신청 - CH4 방문자 관리 시스템</title>
<script type="text/javascript">
	var vIndex = 1;
</script>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="300">
<%@ include file="/View/CommonForm/Top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		///////////////////////물품 추가 이벤트//////////////////////
		////////////물품 추가 modal 띄우기 시작
		$("#btn_addRowGoods").on('click',function(){
			$("#md_goods").modal("show");
		})
		////////////물품 추가 modal 띄우기 끝.
		//입력값 테이블에 row추가하기 
		$("#addGoods").on('click',function(){
			var goodsname = $("#v_goodsname").val();
			var EA = $("#v_ea").val();
			var goodsinfo = $("#v_goodsinfo").val();
			var row = "<tr id='row'"+vIndex+"><td><input id='chkGoods' type='checkbox' value='"+vIndex+"'></td>"
					+"<td>"+goodsname+"</td>"
					+"<td>"+EA+"</td>"
					+"<td>"+goodsinfo+"</td></tr>";
			$("#tb_goods tbody").append(row);
			$("#v_goodsname").textbox('setValue',null);
			$("#v_ea").textbox('setValue',null);
			$("#v_goodsinfo").textbox('setValue',null);
			$("#md_goods").modal("hide");
			vIndex++;
		});
		//입력값 테이블에 row추가하기  끝.
		//전체선택
		$("#chkAllGoods").on('click',function(){
			var chkAll = $(this).is(":checked");
			if(chkAll) {
		    	$("#tb_goods input:checkbox").prop("checked", true);
			}
		    else {
		    	$("#tb_goods input:checkbox").prop("checked", false);
		    }
		});
		//전체선택 끝.
		//선택된 row 제거하기 (미완성)
		$("#btn_delRowGoods").on('click',function(){
			$("#tb_goods #chkGoods:checked").each(function(){
				alert($(this).val());
				$(this).parent().parent().remove();
			});
		});
	});

</script>
<div class="container-fluid">
	<div class="row">
	    <div class="col-lg-offset-1 col-lg-1" id="myScrollspy" style="padding-left:50px;text-align:center;">
		    <ul class="nav nav-pills nav-stacked">
		      <li class="active"><a href="#section1">기본 반입정보</a></li>
		      <li><a href="#section2">물품 등록</a></li>
		    </ul>
	    </div>
	    <div class="col-lg-7 col-lg-offset-1">
		    <div class="row">
		    	<div class="col-lg-10">
					<h2 id="apply_title" style="margin-bottom:20px; border-left: 4px solid #17405D; padding-left:8px;"><b>반입 신청</b> (방문지)</h2>
		    	</div>
		    	<div class="col-lg-2" style="text-align:right; padding-top:30px;">
					<button class="btn btn-primary">반입이력</button>
		    	</div>
			</div>
			<!-- 반입정보  -->
			<div id="section1" class="panel panel-info">    
			    <div class="panel-heading">기본 반입정보</div>
			    <div class="panel-body">
			    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>신청자 정보</b></h4>
			    	<div class="row table basic">
			    		<table class="table">
			    			<th>성명</th>
			    			<td>(성명)</td>
			    			<th>전화번호</th>
			    			<td>010-0000-1234</td>
			    		</table>
			    	</div>
			    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>반입일자</b></h4>
			    	<h6 style="margin-bottom:10px;">신청일로부터 1년 이내로 가능합니다.</h6>
			    	<div class="row table basic">
			    		<table class="table">
							<tr>
								<th>반입날짜</th>
								<td>
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
				    				<th>반입사유</th>
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
			<!-- 물품 등록 -->
			<div id="section2" class="panel panel-success">    
				<div class="panel-heading">물품 등록</div>
				<div class="panel-body">
					<div class="row">
			    		<div class="col-lg-8">
					    	<h4 style="border-left: 3px solid #3c763d; padding-left:4px;"><b>반입 물품 정보</b></h4>
					    	<!-- <h6 style="margin-bottom:10px;">방문자는 최대 10명으로 제한합니다.</h6> -->
					    </div>
					    <div class="col-lg-4" style="text-align:right;padding-top:20px;">
							<button id="btn_addRowGoods" class="btn btn-default">물품 추가</button>
							<button id="btn_delRowGoods" class="btn btn-danger">선택삭제</button>
		    			</div>
				    </div>
				    <div class="row table goods">
			    		<table id="tb_goods" class="table">
			    			<thead>
			    				<tr>
			    					<th><input id="chkAllGoods" type="checkbox"></th>
				    				<th style="width:30%;">물품명</th>
				    				<th style="width:20%;">EA</th>
				    				<th style="width:40%;">물품 정보</th>
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
<div id="md_goods" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header goods">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">물품 정보 입력</h4>
			</div>
			<div class="modal-body" style="text-align:center;">
				<input id="v_goodsname" class="easyui-textbox" label="물품명" labelPosition="left" ><br><br>
				<input id="v_ea" class="easyui-textbox" label="EA" labelPosition="left" ><br><br>
				<input id="v_goodsinfo" class="easyui-textbox" label="물품정보" labelPosition="left" >
			</div>
			<div class="modal-footer">
        		<button type="button" class="btn btn-primary" id="addGoods">추가</button>
        		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        	</div>
		</div>
	</div>
</div>
</body>
</html>
