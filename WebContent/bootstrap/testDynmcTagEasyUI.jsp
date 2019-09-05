<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/BootstrapCommon.jsp" %>
<script type="text/javascript">
	var visitNum = 1;
	var visitDate;
	var visitList = new Array();
</script>
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
			if(index=='add_visit'){
				//입력칸 갯수 증가
				var date = $('#visit').val();
				for(var i=1;i<visitNum;i++){
					var existDate = visitList[i];
					if(existDate==date){
						alert('이미 추가된 날짜입니다.');
						break;
					}
				}
				var parent = document.getElementById('parent');
				var newVisit = document.createElement("div");
				newVisit.innerHTML = "<label id='lb_date"+visitNum+"' for='date"+visitNum+"'>방문"+visitNum+"</label>&nbsp&nbsp"
									+"<span id='date"+visitNum+"'>"+date+"</span>&nbsp&nbsp"
									+"<button id='del_visit"+visitNum+"' type='button' class='btn' value='"+visitNum+"'>삭제</button>";
				newVisit.setAttribute('id','visit'+visitNum);
				newVisit.setAttribute('style','width:80%;');
				parent.appendChild(newVisit);
				visitList[visitNum] = date;
				visitNum = visitNum + 1;
			}
			//'삭제'인 경우
			else{
				//해당 순번의 입력칸 제거
				$('#visit'+index).remove();
				//해당 순번 이후의 입력칸 순번 재정렬(-1씩 해주기)
				//태그의 아이디,text값,value값 변경
				for(var i = index ; i<=visitNum ; i++){
					$('#lb_date'+i).text("방문"+(i-1));
					$('#lb_date'+i).attr('id','lb_date'+(i-1));
					$('#date'+i).attr('id','date'+(i-1));
					$('#visit'+i).attr('id','visit'+(i-1));
					$('#del_visit'+i).attr('value',(i-1));
					$('#del_visit'+i).attr('id','del_visit'+(i-1));
				}
				//입력칸 갯수 감소
				visitNum = visitNum - 1;
			}
		});
	});
</script>
<button id="add_visit" type="button" class="btn" value="add_visit">추가</button><br><br>
<div id="parent">
	<input id="visit" class="easyui-datebox" label="방문일 선택" labelPosition="left" style="width:80%;">
</div>
</body>
</html>