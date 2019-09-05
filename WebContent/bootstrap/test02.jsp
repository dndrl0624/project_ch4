<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/BootstrapCommon.jsp" %>
<%
	int i = 70;
%>
<style>
  ul.nav-pills {
    top: 20px;
    position: fixed;
  }
 
  #section1 {color: #fff; background-color: #1E88E5; height:250px}
  #section2 {color: #fff; background-color: #673ab7; height:250px}
  #section3 {color: #fff; background-color: #ff9800; height:250px}
  #section4 {color: #fff; background-color: #00bcd4; height:250px}
  
  @media screen and (max-width: 810px) {
    #section1, #section2, #section3, #section4 {
      margin-left: 150px;
    }
  }
   #myInput {
    padding: 20px;
    margin-top: -6px;
    border: 0;
    border-radius: 0;
    background: #f1f1f1;
  </style>
</head>
<body>
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%= i %>"
  aria-valuemin="0" aria-valuemax="100" style="width:<%= i %>%">
    <%= i %>% Complete (success)
  </div>
</div>
<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">기간유형
  <span class="caret"></span></button>
  <ul class="dropdown-menu">
    <li><a href="#">매월</a></li>
    <li><a href="#">매달</a></li>
  </ul>
</div>
<div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
        일일 방문</a>
      </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse in">
      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat.</div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
        장기 방문</a>
      </h4>
    </div>
    <div id="collapse2" class="panel-collapse collapse">
      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat.</div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
        선택 방문</a>
      </h4>
    </div>
    <div id="collapse3" class="panel-collapse collapse">
      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat.</div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">
        정기 방문</a>
      </h4>
    </div>
    <div id="collapse4" class="panel-collapse collapse">
      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat.</div>
    </div>
  </div>
</div>
<ul class="nav nav-tabs">
  <li><a data-toggle="tab" href="#menu1">일일 방문</a></li>
  <li><a data-toggle="tab" href="#menu2">장기 방문</a></li>
  <li><a data-toggle="tab" href="#menu3">선택 방문</a></li>
  <li><a data-toggle="tab" href="#menu4">정기 방문</a></li>
</ul>

<div class="tab-content">
  <div id="menu1" class="tab-pane fade">
    <h3>일일 방문</h3>
    <p>Some content in menu 1.</p>
  </div>
  <div id="menu2" class="tab-pane fade">
    <h3>장기 방문</h3>
    <p>Some content in menu 2.</p>
  </div>
  <div id="menu3" class="tab-pane fade">
    <h3>선택 방문</h3>
    <p>Some content in menu 3.</p>
  </div>
  <div id="menu4" class="tab-pane fade">
    <h3>정기 방문</h3>
    <p>Some content in menu 4.</p>
  </div>
</div>
<label class="radio-inline"><input type="radio" name="optradio" checked>일일 방문</label>
<label class="radio-inline"><input type="radio" name="optradio">장기 방문</label>
<label class="radio-inline"><input type="radio" name="optradio">선택 방문</label>
<label class="radio-inline"><input type="radio" name="optradio">정기 방문</label>
<div class="form-group">
  <label for="pwd">Password:</label>
  <input type="password" class="form-control" id="pwd" placeholder="Enter password">
  <span class="help-block">This is some help text...</span>
</div>
<div class="panel panel-default">
  <div class="panel-body">Panel Content</div>
  <div class="panel-footer">Panel Footer</div>
</div>
<div class="container">
  <h2>Filterable Dropdown</h2>
  <p>Open the dropdown menu and type something in the input field to search for dropdown items:</p>
  <p>Note that we have styled the input field to fit the dropdown items.</p>
  <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <input class="form-control" id="myInput" type="text" placeholder="Search..">
      <li><a href="#">HTML</a></li>
      <li><a href="#">CSS</a></li>
      <li><a href="#">JavaScript</a></li>
      <li><a href="#">jQuery</a></li>
      <li><a href="#">Bootstrap</a></li>
      <li><a href="#">Angular</a></li>
    </ul>
  </div>
</div>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $(".dropdown-menu li").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>
</html>