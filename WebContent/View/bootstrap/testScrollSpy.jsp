<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../Style/common/BootstrapCommon.jsp" %>
<style>
  ul.nav-pills {
    top: 100px;
    position: fixed;
  }
 
  #section1 {color: #fff; background-color: #1E88E5; height:500px}
  #section2 {color: #fff; background-color: #673ab7; height:250px}
  #section3 {color: #fff; background-color: #ff9800; height:250px}
  #section4 {color: #fff; background-color: #00bcd4; height:250px}
  
  </style>
</head>
<body>
 
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
      	<div id="section1">    
        <h1>기본 방문정보</h1>
        <p>Try to scroll this section and look at the navigation list while scrolling!</p>
      </div>
      <div id="section2"> 
        <h1>방문자 등록</h1>
        <p>Try to scroll this section and look at the navigation list while scrolling!</p>
      </div>        
      <div id="section3">         
        <h1>반입기기</h1>
        <p>Try to scroll this section and look at the navigation list while scrolling!</p>
      </div>
      <div id="section4">         
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