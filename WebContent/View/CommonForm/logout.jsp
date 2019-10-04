<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="width:30%; float: right;"> 
	<!-- 관리자명 --><%session.getAttribute("CMNG_NAME"); %>님 환영합니다.
<!-- 로그아웃 기능 + 로그인하는 페이지로 이동 --><!-- 로그아웃 기능 + 로그인하는 페이지로 이동 --><!-- 로그아웃 기능 + 로그인하는 페이지로 이동 --><!-- 로그아웃 기능 + 로그인하는 페이지로 이동 -->
	<a class="logout" onclick="javascript:logout()">로그아웃</a> 
</div>
<script type="text/javascript">
	function logout(){
		//세션만료
		<% session.invalidate(); %>
		herf = Company_Login.jsp;
	}
</script>
<!-- 로그아웃 온클릭 이벤트 주기 -->

