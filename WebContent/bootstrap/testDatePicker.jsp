<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
​<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="../js/bootstrap-datetimepicker.js"></script>
<link rel="stylesheet" type="text/css" href="../css/datetimepickerstyle.css" /> -->
<%@ include file="/common/BootstrapCommon.jsp" %>
</head>
<body>
<script type="text/javascript">
//부트스트랩 datetimepicker 셋팅과 두개씩 링크
// minDate : 오늘 이후의 날짜값만 셋팅될 수 있도록
$(document).ready(function(){
	$('.dateTimePicker').datetimepicker({
		format:"YYYY-MM-DD",
		minDate : moment()
	});
    $('#datepicker1').datetimepicker({
        useCurrent: false
    });
    $('#datepicker2').datetimepicker({
        useCurrent: false
    });
   
    $("#datepicker1").on("dp.change", function (e) {
        $('#datepicker2').data("DateTimePicker").minDate(e.date);
    });
   
    $("#datepicker2").on("dp.change", function (e) {
        $('#datepicker1').data("DateTimePicker").maxDate(e.date);
    });
}); 
</script>
<div class="form-group">
    <div class='col-sm-4'>
        <div class="form-group">
            <div class='input-group date dateTimePicker' id="datepicker1">
                <input type='text' class="form-control" name="openDate" required="required"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
    <div class='col-sm-1'>
        <h4 align="center"><b>~</b></h4>
    </div>
    <div class='col-sm-4'>
        <div class="form-group">
            <div class='input-group date dateTimePicker' id="datepicker2">
                <input type='text' class="form-control" name="closeDate" required="required"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
</div>
</body>
</html>