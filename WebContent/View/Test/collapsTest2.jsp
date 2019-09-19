<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--meta charset tags --> 
<meta charset="utf-8"> 
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<title>22 좌측 네비게이션바 넣은 페이지 22</title>
<!-- Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
<!-- CSS Style Import --> 
<style type="text/css"> 
/* 사이드바 설정 */
aside {
    width: 15%;
    height: 80%;
    position: fixed;
    background: #2f323a;
    overflow: auto;
}
/* 스크롤바 안보이게 하기 */
aside::-webkit-scrollbar { 
    display: none; 
}
/* 하부/내부 메뉴 설정 */
.side-sub {
	margin-left: 15%;
	margin-top: 15px;
	margin-bottom: 15px;
	font-size: 20px;
}
</style>
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>

<!-- Side Bar -->



<aside>
	<div class="sidebar" role="tablist">
     <div class="panel panel-info" role="tab" id="headingz" style="margin-top:100px;" data-toggle="collapse" href="#mainz" aria-controls="mainz">
     	<h4>메인메뉴0</h4></a>
      <div id="mainz" class="panel-collapse collapse show">
       	<div class="side-sub"><!-- 스타일 설정 -->
		      	<a>sub0</a><br>
		      	<a>sub1</a><br>
		      	<a>sub2</a><br>
		      	<a>sub3</a><br>
		</div>
      </div>
      </div>
</div>

	<div class="sidebar" role="tablist">
		<div class="panel panel-info" style="margin-top:100px;"><!-- 스타일설정 -->
	    	<div class="panel-heading" role="tab" id="headingOne">
		      	<h4 class="side-main">
		        	<a class="collapsed" data-toggle="collapse" href="#mainOne" aria-controls="mainOne">
		        	 	 메인메뉴1
		        	</a>
		      	</h4>
	    	</div>
		    <div id="mainOne" class="panel-collapse collapse">
		      <div class="side-sub"><!-- 스타일 설정 -->
		      	<a>sub0</a><br>
		      	<a>sub1</a><br>
		      	<a>sub2</a><br>
		      	<a>sub3</a><br>
		      </div>
		    </div>
		</div>
		  
		<div class="panel panel-info">
		    <div class="panel-heading" role="tab" id="headingTwo">
		      <h4 class="side-main">
		        <a class="collapsed" data-toggle="collapse" href="#mainTwo" aria-expanded="false" aria-controls="mainTwo">
		          	 메인메뉴2
		        </a>
		      </h4>
		    </div>
		    <div id="mainTwo" class="panel-collapse collapse">
		      <div class="side-sub">
		      	<a>sub0</a><br>
		      	<a>sub1</a><br>
		      	<a>sub2</a><br>
		      	<a>sub3</a><br>
		      </div>
		    </div>
		</div>
		  
		<div class="panel panel-info">
			<div class="panel-heading" role="tab" id="headingThree">
		      <h4 class="side-main">
		        <a class="collapsed" data-toggle="collapse" href="#mainThree" aria-expanded="false" aria-controls="mainThree">
		          	메인메뉴3
		        </a>
		      </h4>
		    </div>
		    <div id="mainThree" class="panel-collapse collapse">
		      <div class="side-sub">
		      	<a>sub0</a><br>
		      	<a>sub1</a><br>
		      	<a>sub2</a><br>
		      	<a>sub3</a><br>
		      </div>
			</div>
		</div>
		
		<div class="panel panel-info">
			<div class="panel-heading" role="tab" id="headingFour">
		      <h4 class="side-main">
		        <a class="collapsed" data-toggle="collapse" href="#mainFour" aria-expanded="false" aria-controls="mainFour">
		          	메인메뉴4
		        </a>
		      </h4>
		    </div>
		    <div id="mainFour" class="panel-collapse collapse">
		      <div class="side-sub">
		      	<a>sub0</a><br>
		      	<a>sub1</a><br>
		      	<a>sub2</a><br>
		      	<a>sub3</a><br>
		      </div>
			</div>
		</div>
		
	<div style="margin-bottom:100px;"></div>
	</div>
</aside>





	<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%></div>
</body>
</html>