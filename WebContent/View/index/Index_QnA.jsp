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
<title>Index_QnA</title>
<style type="text/css">
	div .textbox {
		margin-top:7px;
	}
	label {
		margin-top: 14px;
	}
	.panel-heading {
		padding : 10px;
		padding-left: 15px;
	}
	h2 {
		text-align: left;
		padding-left: 20px;
		border-left: solid 7px;
		color: black;
 	}
	.banner_Content {
		margin-top: 0px;
		padding-top: 10px;
		height: 300px;
		background-image: url('../../Style/images/banner/speedGate (2).jpg');
	}
	.jumbotron_Content a{
		font-size: 25px;
	}
	.Content_title h1{
		padding-top: 12px;
		padding-bottom: 12px;
	    border-width: thick;
	    margin-bottom: -10px;
	}
	#index_qna{
		font-size: 60px;
		text-shadow: 4px 2px 2px gray;
		margin-top: 70px;
		font-family: Spoqa Han Sans, Sans-serif;
		font-weight: 800;
	}
	#qa_title{
		background-color: #5c5c5c;
	}
	#fontO{
		color:tomato;
		font-family: fantasy;
	}
	#fontW {
		color: white;
		font-family: fantasy;
	}
	#boardQnA {
		margin-top: 30px;
	}
	.well {
		padding-left: 50px;
		padding-right: 50px;
	}
	#f_question #q_email {
		width: 100%;
	}
	#f_question #q_title, #q_writer, #q_content, #q_content{
		width: 90%;
	}
	#btn_write {
		margin-top: 20px;
	}
	
</style>
<script type="text/javascript">
	function q_write(){
		alert("여기");
		if($("#q_title").val()==""){
			alert("제목을 입력해주세요.")
			$("#q_title").textbox('textbox').focus();
			return;
		}
		if($("#q_writer").val()==""){
			alert("작성자를 입력해주세요.")
			$("#q_writer").textbox('textbox').focus();
			return;
		}
		if($("#q_email").val()==""){
			alert("이메일을 입력해주세요.")
			$("#q_email").textbox('textbox').focus();
			return;
		}
		if($("#q_content").val()==""){
			alert("문의사항을 입력해주세요.")
			$("#q_content").textbox('textbox').focus();
			return;
		}
		//url보내기
		$('#f_write').attr("method","post");
		$('#f_write').attr("action","index/question.ch4"); //전송을 하는 곳.
		$('#f_write').submit();
		
	}
</script>
</head>
<body>
<%@ include file="/View/CommonForm/Top.jsp"%>
<!-- Banner -->
<section class="banner_Content">
	<div class="jumbotron_Content">
		<div class="container_Banner_Content col-lg-offset-2 col-lg-2 col-lg-8" 
			 style="color: white;">
			<div class="row Content_title">
				<h1 id="index_qna">Q&A</h1>
			</div>
			<div class="row page_link">
				<a href="Index_Main.jsp">Home</a> → <a href="Index_QnA.jsp">Q&A</a>
			</div>
		</div>
	</div> 
</section>
	<div class="well col-lg-offset-2 col-lg-8 col-lg-offset-2" id="qa_title" >
		<h1><font id="fontO">1:1문의</font><font id="fontW">게시판</font></h1>
		<p><font id="fontW">서비스를 이용하시는 중 궁금한 사항 및 불편한 사항을 문의해주세요.<br>
		      문의하신 내용의 처리 및 답변은 평일기준 24시간 이내 처리됩니다.</font></p>
	</div>
<!-- 카드 시작 -->
<div class="container" >
    <div class="col-lg-offset-1 col-lg-10 col-lg-offset-1" id="boardQnA">
    <!-- 메세지 입력 부분 -->
	    <div class="row">
		    <div class="well" align="center" style="text-align: center; ">
				<form id="f_question">
					<input type="hidden" name="q_no" value="0">
					<input type="hidden" name="q_date" value="0">
					<input type="hidden" name="msg_date" value="0">
					<div class="row" style="vertical-align: middle;">
						<div class="col-lg-2" align="center">
							<label for="q_title" >제 목</label>
						</div>
						<div class="col-lg-10" align="left">
							<input class="easyui-textbox" type="text" prompt="Enter your Title" 
								 	id="q_title" name="q_title"></input>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2" >
							<label for="q_writer" >작성자</label>
						</div>
						<div class="col-lg-4" align="left">
							<input class="easyui-textbox" placeholder="Enter your name"  
								  id="q_writer" name="q_writer" ></input>	
						</div>
						<div class="col-lg-1">
							<label for="q_email" >이메일</label>
						</div>
						<div class="col-lg-4" align="left">
							<input class="easyui-textbox" placeholder="Enter your email" 
									  id="q_email" name="q_email"></input>							
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2">
							<label for="q_content" >문의사항</label>
						</div>
						<div class="col-lg-10" align="left">
							<textarea class="easyui-textbox" placeholder="문의사항을 입력해주세요." 
							 		  id="q_content" name="q_content" style="height: 200px;"></textarea>
						</div>
					</div> 
			 		<div class="row">
			 			<button class="btn btn-success btn-m text-light" id="btn_write" name="btn_write"
			 					onClick="q_write()" type="button">글쓰기
			 			</button>
					</div>
				</form>
			</div>
	    </div>
		<!-- 메세지 입력 부분 끝 -->
	</div>
</div>
<!-- 카드 시작 끝 -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>