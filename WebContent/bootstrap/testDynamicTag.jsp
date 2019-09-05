<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/BootstrapCommon.jsp" %>
<script type="text/javascript">
	var inputnum = 1;
</script>
<style type="text/css">
	div.form-group {
		border:none;
	}
	input.form-control {
		display:inline;
		width:300px;
	}
</style>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		//모든 button태그에 대한 click이벤트 처리
		//아이디 별로 따로 이벤트를 설정하면 동적태그에 대한 이벤트를 처리할 수 없음.
		//따라서 .on()을 이용하여 dom안의 모든버튼에 이벤트를 걸었음.
		//이에대한 분기는 value값을 참조하여 if문을 이용.
		$(document).on('click','button',function(e){
			var index = $(this).attr('value');
			//'추가'인 경우
			if(index=='add'){
				//입력칸 갯수 증가
				inputnum = inputnum + 1;
				//입력칸 html구문 작성
				var tag = "<div id='form"+inputnum+"' class='form-group'>"
						+"<label id='lb"+inputnum+"' for='usr"+inputnum+"'>Name"+inputnum+"</label>&nbsp&nbsp"
						+"<input type='text' class='form-control' id='usr"+inputnum+"'>&nbsp&nbsp&nbsp&nbsp"
						+"<button id='del_btn"+inputnum+"' type='button' class='btn' value='"+inputnum+"'>삭제</button></div>";
				//최하단 입력칸에 신규 입력칸 추가
				$("#form"+(inputnum-1)).after(tag);
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
<button id="add_btn" type="button" class="btn" value="add">추가</button>
<br>
<br>
<div id="form1" class="form-group">
  <label for="usr1">Name1</label>&nbsp&nbsp
  <input type="text" class="form-control" id="usr1">
</div>
</body>
</html>