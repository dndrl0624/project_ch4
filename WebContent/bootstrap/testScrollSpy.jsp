<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/BootstrapCommon.jsp" %>
<style>
  ul.nav-pills {
    top: 100px;
    position: fixed;
  }
  #section1 {
  	color: #000;
  	height:1000px;
  	margin: 20px 0px;
  }
  #section2 {
  	color: #000;
  	height:250px;
  	margin: 20px 0px;
  }
  #section3 {
  	color: #000;
  	height:250px;
  	margin: 20px 0px;
  }
  #section4 {
  	color: #000;
  	height:250px;
  	margin: 20px 0px;
  }
</style>
<script type="text/javascript">
	var visitNum = 1;
</script>
</head>
<body>
<script>
	$(document).ready(function(){
		$('#tabs').tabs({
			plain : true,
			narrow : true,
		});
		$("#week_type").radiobutton({
			disabled : true
		})
		$("#day").radiobutton({
			disabled : true
		})
		$("#term_type").radiobutton({
			onChange : function(checked){
				alert("sdf");
			}
		});
		//모든 button태그에 대한 click이벤트 처리
		//아이디 별로 따로 이벤트를 설정하면 동적태그에 대한 이벤트를 처리할 수 없음.
		//따라서 .on()을 이용하여 dom안의 모든버튼에 이벤트를 걸었음.
		//이에대한 분기는 value값을 참조하여 if문을 이용.
		$(document).on('click','button',function(e){
			var index = $(this).attr('value');
			//'추가'인 경우
			if(index=='add_visit'){
				//입력칸 갯수 증가
				visitNum = visitNum + 1;
				//입력칸 html구문 작성
				var tag = "<br><input id='visit"+visitNum+"' class='easyui-datebox' label='방문"+visitNum+"' labelPosition='left' style='width:80%;'>"
						+"<button id='del_visit"+visitNum+"' type='button' class='btn' value='"+visitNum+"'>삭제</button></div>";
				//최하단 입력칸에 신규 입력칸 추가
				$("#visit"+(visitNum-1)).after(tag);
			}
			//'삭제'인 경우
			else{
				//해당 순번의 입력칸 제거
				$('#form'+index).remove();
				//해당 순번 이후의 입력칸 순번 재정렬(-1씩 해주기)
				//태그의 아이디,text값,value값 변경
				for(var i = index ; i<=inputnum ; i++){
					$('#form'+i).attr('id','form'+(i-1));
					$('#lb'+i).text('Name'+(i-1));
					$('#lb'+i).attr('id','lb'+(i-1));
					$('#usr'+i).attr('id','usr'+(i-1));
					$('#del_btn'+i).attr('value',(i-1));
					$('#del_btn'+i).attr('id','del_btn'+(i-1));
				}
				//입력칸 갯수 감소
				inputnum = inputnum - 1;
			}
		});
	});
</script>
<div class="container">
  <div>
    <h1>방문 신청</h1>
  </div>
  <div class="row">
  	<nav class="col-sm-2" id="myScrollspy">
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">기본 방문정보</a></li>
        <li><a href="#section2">방문자 등록</a></li>
        <li><a href="#section3">반입기기</a></li>
        <li><a href="#section4">차량등록</a></li>
      </ul>
    </nav>
    <div class="col-sm-10">
  <div class="panel-group">
    <div class="panel panel-info">
      <div class="panel-heading">신청정보</div>
      <div class="panel-body"  data-spy="scroll" data-target="#myScrollspy" data-offset="300" style="overflow-y:scroll; height:500px">
      	<div id="section1" align="center">    
        <h1>기본 방문정보</h1><br>
         <select class="easyui-combobox" name="desti" label="방문지" labelPosition="left" style="width:50%;">
             <option value="none">(선택하세요)</option>
             <option value="code1">삼성-본사</option>
             <option value="code2">삼성-지사</option>
             <option value="code3">애플-본사</option>
             <option value="code4">애플-지사</option>
             <option value="code5">LG전자</option>
             <option value="code6">월드메르디앙</option>
         </select><br><br>
         <select class="easyui-combobox" name="desti" label="목적지" labelPosition="left" style="width:50%;">
             <option value="none">(선택하세요)</option>
             <option value="code1">삼성-본사</option>
             <option value="code2">삼성-지사</option>
             <option value="code3">애플-본사</option>
             <option value="code4">애플-지사</option>
             <option value="code5">LG전자</option>
             <option value="code6">월드메르디앙</option>
         </select><br><br>
         <input class="easyui-textbox" label="담당자 " labelPosition="left" style="width:50%;"><br><br>
         <input class="easyui-textbox" label="방문목적" labelPosition="left" style="width:50%;"><br><br>
         <input class="easyui-textbox" label="신청인 " labelPosition="left" style="width:50%;"><br><br>
         <input class="easyui-textbox" label="연락처 " labelPosition="left" style="width:50%;"><br><br>
         <div id="tabs" class="easyui-tabs" style="width:50%;">
	        <div title="일일방문" align="center">
	            <input class="easyui-datebox" label="방문일 " labelPosition="left" style="width:80%;">
	        </div>
	        <div title="기간방문" align="center">
	            <input class="easyui-datebox" label="시작일 " labelPosition="left" style="width:80%;"><br>
	            <h4>~</h4>
	            <input class="easyui-datebox" label="최종일 " labelPosition="left" style="width:80%;">
	        </div>
	        <div title="정기방문" align="center">
	            <input class="easyui-datebox" label="시작일 " labelPosition="left" style="width:80%;"><br>
	            <h4>~</h4>
	            <input class="easyui-datebox" label="최종일 " labelPosition="left" style="width:80%;"><br><br>
	            <select class="easyui-combobox" name="term_type" label="방문주기" labelPosition="top" style="width:50%;">
             		<option value="none">(선택하세요)</option>
             		<option value="code1">매주</option>
             		<option value="code2">격주</option>
             		<option value="code3">(매월)첫째주</option>
             		<option value="code4">(매월)둘째주</option>
             		<option value="code5">(매월)셋째주</option>
             		<option value="code6">(매월)넷째주</option>
        		 </select><br><br>
	            <select class="easyui-combobox" name="day" label="요일" labelPosition="top" style="width:50%;">
             		<option value="none">(선택하세요)</option>
             		<option value="code1">월요일</option>
             		<option value="code2">화요일</option>
             		<option value="code3">수요일</option>
             		<option value="code4">목요일</option>
             		<option value="code5">금요일</option>
             		<option value="code6">토요일</option>
             		<option value="code6">일요일</option>
        		 </select><br><br>
	        </div>
	        <div title="선택방문" align="center">
	            <button id="add_visit" type="button" class="btn" value="add_visit">추가</button><br><br>
				<input id="visit1" class="easyui-datebox" label="방문1" labelPosition="left" style="width:80%;">
	        </div>
    	</div>
      </div>
      <div id="section2" align="center">         
        <h1>방문자등록</h1>
        <p>Try to scroll this section and look at the navigation list while scrolling!</p>
      </div>
      <div id="section3" align="center">         
        <h1>반입기기</h1>
        <p>Try to scroll this section and look at the navigation list while scrolling!</p>
      </div>
      <div id="section4" align="center">         
        <h1>차량등록</h1>
        <p>Try to scroll this section and look at the navigation list while scrolling!</p>
      </div>      
      </div>
    </div>
   </div>
  </div>
</div>
</body>
</html>