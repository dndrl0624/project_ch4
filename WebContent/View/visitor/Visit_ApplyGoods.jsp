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
<style>
	body {
		position: relative;
	}
	ul.nav-pills {
		padding-top: 70px;
		position: fixed;
	}
	div.col-lg-7 #section1,#section2 {
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
	
</style>
<title>반입 신청 - CH4 방문자 관리 시스템</title>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="300">
<%@ include file="/View/CommonForm/Top.jsp"%>
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
			<div id="section1" class="panel panel-info">    
			    <div class="panel-heading">기본 반입정보</div>
			    <div class="panel-body">
			    	<input class="easyui-textbox" label="방문지" labelPosition="left"><br><br>
					<input class="easyui-textbox" label="목적지" labelPosition="left">
			    </div>
			</div>
		    <div id="section2" class="panel panel-success">    
			    <div class="panel-heading">물품 등록</div>
			    <div class="panel-body">
			    	Try to scroll this section and look at the navigation list while scrolling!
			    </div>
		    </div>
	    </div>
  	</div>
</div>
</body>
</html>