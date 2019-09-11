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
<title>Insert title here</title>
<style type="text/css">
	#h_row{
		background-color: silver;
	}
	
</style>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
	<div class="container-fluid" style="text-align: center;">
		<div>
			<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
				<h3 align="left">방문 예약 시스템</h3>
				<div class="row">
					<h3 align="left"> | 제목</h3>
				</div>
				<div class="row" id="h_row">
					<div class="col-lg-5">
						<div class="col-sm-2">
							<label for="textbox" style="text-align: 'left';padding-top: 5px;" >라벨</label>
						</div>
						<input id="textbox" class="form-control" type="text" style="width: 100px" >
					</div>
					<div class="col-lg-3" style="background-color:yellow;">h</div>
					<div class="col-lg-4" style="background-color: teal;">g</div>
				
				</div>
				<div class="row">
					<h3 align="left"> | 제목2</h3>
				</div>
				<div class = row>
					<div class="col-lg-6">
						<div class="panel" style="background-color: #ffed99">
							<div class="panel-heading">
								냠냠
							</div>
							<div class="panel-body">
								바디
							</div>
						</div>
					</div>
					<div div class="col-lg-6">
						<div class="panel" style="background-color: #ffed99">
							<div class="panel-heading">
								냠냠
							</div>
							<div class="panel-body">
								바디
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
						<table class="table">
							<thead>
								<tr>
							        <th>Firstname</th>
							        <th>Lastname</th>
							        <th>Email</th>
							    </tr>
							</thead>
						</table>					
					</div>
				</div>
			</div>
		</div>
		
	
	
	</div>
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>