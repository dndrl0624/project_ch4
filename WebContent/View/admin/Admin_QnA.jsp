<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//List<Map<String,Object>> 
 %>
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
<script type="text/javascript">
	function sendAnswer(q_no){
		var content = $("#a_content").val();
		var q_no = q_no;
		url : ;
		
	}
</script>
<style type="text/css">
	h3 {
		padding-left: 3%;
		border-left: solid 7px;
		color: black;
	}
</style>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container">
	<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
		<div class="row">
      		<h3>Q&A</h3>
		</div>
		<!-- 내용 부분 -->
	 	<div class="row">
			<div id="d_msg" class="panel panel-success">
				<!-- 본문 내용 -->
				<div class="panel-heading" align="left">
					<div class="row">
						<div class="col-lg-8">
							<h5>질문글 제목</h5>
						</div>
						<div class="col-lg-2">
							<h5>질문글 작성자</h5>
						</div>
						<div class="col-lg-2">
							<h5>질문글 작성 시간</h5>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-offset-0.3 col-lg-10">
							<h4>내용</h4>
						</div>
					</div>
					<div class="row" align="right" style="margin-right: 20px;">
						<button class="btn btn-warning" data-toggle="collapse" data-target="#writeAnswer">답변 쓰기</button>
					</div>
				</div>
				<!-- 댓글내용 -->
				<div class="collapse" id="writeAnswer">
					<div class="panel-body">
						<h5>댓글 내용</h5>
						<textarea class="easyui-textbox" placeholder="답변을 입력해주세요." 
							 		  id="a_content" name="a_content"
							 		  style="height: 100px; width: 900px;"></textarea>
						<br>
						
						작성일?????
					</div>
					<div class="panel-footer">
						<button class="btn btn-danger" onClick="sendAnswer(q_no)">답변 보내기</button>
					</div>
				</div>
				<!-- 댓글 내용 끝. -->
      		</div>
		<!-- 내용 부분  끝-->
    	</div>
	</div>
</div>
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>