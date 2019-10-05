<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>
$(function () {
//동적으로 원격에 있는 JSON 파일(결과값)을 로드
	$.ajax({
			url : "testJson.json",
			//data: $("#폼 태그 아이디").serialize();
			//type : 'post',
			dataType : "json",
			success : function(data) {
				//받아온 JSON을 테이블에 출력
				$.each(data, function() {
					$('#tablList').append(
							"<tr><td>" + this.Num + "</td><td>" + this["Name"]
									+ "</td></tr>");
				});
				$.each(data, function(index, entry) {
					$('#tablList').append(
							"<tr><td>" + entry.Num + "</td><td>"
									+ entry["Name"] + "</td></tr>");
				});
			},
			error : function() {
				alert("에러발생");
			}
		});
	});
</script>
</head>
<body>
<table id="tablList" border="1">
	<tr>
		<td>번호</td>
		<td>이름</td>
	</tr>
</table>
</body>
</html>