<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	
%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8"> 
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
<title>고객지원 페이지</title>
<style type="text/css">
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
	background-image: url('../../Style/images/banner/banner_top.jpg');
}
.container_Banner_Content {
	color: white;
}

.jumbotron_Content a {
	font-size: 25px;
}

.Content_title h1 {
	padding-top: 12px;
	padding-bottom: 12px;
	border-width: thick;
	margin-bottom: -10px;
}

#index_notice {
	font-size: 60px;
	text-shadow: 4px 2px 2px gray;
	margin-top: 70px;
	font-family: Spoqa Han Sans, Sans-serif;
	font-weight: 800;
}

.well {
	margin-top: 30px;
	padding-left: 100px;
}
label {
	margin-right: 10px;
}
#cb_search{
	width:200px;
}
#tb_search {
	width:400px;
}
img {
	margin-right: 5px;
}
span {
	width: auto;
	font-size: 15px;
}
p {
	margin: 4px 10px;
}
table thead tr{
	background-color: #ff6969;
	color: white;
	font-size: 18px;
}
.modal-head {
	padding-top: 50px;
	padding-left: 60px;
	padding-right: 60px;
	padding: 30px;
	border-bottom: groove;
	background-color: #ffb6b6;
}
.modal-body {
	padding-left: 60px;
	padding-right: 60px;
}
.modal table #tb_grade{
	width:5%; 
}
.modal table #tb_hit{
	width:10%; 
	vertical-align: top;
}
.modal table td{
	width:87%; 
}
.modal_title {
	font-size: 30px;
	border-bottom: solid;
    border-color: black;
}
#_easyui_textbox_input2 {
	width: 780px;
	margin-left: 15px;
	height: 300px;
	margin-bottom: 10px;
}
#_easyui_textbox_input3 {
	width: 400px;
	margin-left: 15px;
}
#contentarea {
	margin-bottom: 10px;
}
.pagination>li>a, .pagination>li>span {
    color: #ff6969;
    background-color: #fff;
    border: 1px solid #ff6969;
}
.pagination>.active>a{
	background-color: #ff6969;
    border-color: #ff6969;
}
</style>
</head>
<body>
<script type="text/javascript">
var grade;
	$(document).ready(function(){
		$("#tb_notice").bootstrapTable({
			columns:[
		        {field:'n_no',title:'no'}
		        ,{field:'n_title',title:'title'}
		        ,{field:'n_date',title:'date'}
		        ,{field:'n_file',title:'file'}
		        ,{field:'n_writer',title:'writer'}
		        ,{field:'n_hit',title:'hit'}
		   ]
			,url:'/project_ch4_pojo/View/Test/jsonNoticeList.json'
			//,url:'/index/notice.ch4'
			,pagination:'true'//페이지 네이션
			,paginationPreText:"Previous"
			,paginationNextText:"Next"
			,pageSize:5//기본 페이지 사이즈
			,pageList:[5, 10, 15, 20] //칸수
			,onClickRow:function(row,$element,field){
				//$element.attr('data-index',10)
				$element.toggleClass('single-select');//로우 클릭했을 때 색 변함.
				var n_no = $element.find("td:first").html();
				$.ajax({
 					type: 'get',
 					dataType: 'json',
 					url: '/project_ch4_pojo/View/Test/jsonNoticeDetail.json',
 					success: function(data){
 						 $.each(data,function(index,item){
	 						$("#n_title").text(item.n_title);
	 						$("#n_date").text(item.n_date);
	 						$("#n_writer").text(item.n_writer);
	 						$("#n_content").textbox('setValue',item.n_content);
	 						$("#n_file").textbox('setValue',item.n_file);
	 						$("#n_hit").text(item.n_hit); 
	 						grade = item.n_grade;
	 						if(grade!=null){
	 							var img = "<img src='../../Style/images/write-board.png' style='margin-right: 20px;' >";
	 							$("#tb_grade").html(img);
	 						}
 						});
 					}
 				});
				$("#DetailNotice").modal('show');
			 }
		});////////////////end of bootstrapTable
	});

</script>
<script type="text/javascript">
	//검색하기
	function NoticeList(){
		alert("검색");
		var cb_search = $("#cb_search").val();
		var tb_search = $("#tb_search").val();
		alert("tb_search : "+tb_search);
		 $("#tb_notice").bootstrapTable({
			//alert("여기");
			url:"/index/notice.ch4?cb_search="+cb_search+"&tb_search="+tb_search
		}); 
	}////////////////////////end of NoticeList
	
	
</script>
<!-- Top -->	<!-- 선택된 페이지 class : nav-item active // 나머지 페이지: nav-item -->
<%@ include file="/View/CommonForm/Top.jsp"%>
<!-- Banner -->
<section class="banner_Content">
	<div class="jumbotron_Content">
		<div class="container_Banner_Content col-lg-offset-2 col-lg-3 col-lg-7">
			<div class="row Content_title">
				<h1 id="index_notice">공지사항</h1>
			</div>
			<div class="row page_link">&nbsp;
				<a href="Index_Main.jsp">Home</a> → <a href="Index_Notice.jsp">Notice</a>
			</div>
		</div>
	</div> 
</section>
<!-- 공지사항 게시판 -->
<div align="center">
	<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
		<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
			<div class="row">
				<div class="well">
					<form id="notice_search">
						<div class="row" align="left">
							<label>Search</label>
							<select id="cb_search" name="cb_search" class="easyui-combobox" panelHeight="auto" >
								<option selected value="">선택</option>    	
								<option value="n_title">제목</option>    	
								<option value="n_content">내용</option>    	
								<option value="n_writer">작성자</option>    	
					    	</select>
							  &ensp;&ensp;&ensp;
							<input class="easyui-textbox" id="tb_search" name="tb_search" >
							<button class="btn btn-danger" id="btn_search" onClick="javascript:NoticeList()" type="button">
								검색
							</button>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered table-hover" id="tb_notice" >
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
<!-- 상세조회 모달 창 -->
<div class="modal fade" id="DetailNotice" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form id="f_Detail">
				<div class="modal-head">
					<table id="tb_modal_head">
						<tr>
							<th id="tb_grade"></th>
							<td class="modal_title" id="n_title" name="n_title" colspan="3">
							</td>
						</tr>
						<tr>
							<th rowspan="2"></th>
							<td>
								<p>
								<span value="n_writer" id="n_writer" name="n_writer" ></span></p>
							</td>
							
							<th rowspan="2" id="tb_hit">
								<img src='../../Style/images/open-eye.png'>
								<span class="badge" value="n_hit" id="n_hit" name="n_hit" ></span>
							</th>
						</tr>
						<tr>
							<td>
								<p id="date">작성일 : 
								<span value="n_date" id="n_date" name="n_date"></span></p>
							</td>
						</tr>
					</table>
				</div>
					<!-- Modal body -->
				<div class="modal-body">
					<div class="row" id="contentarea">
						<input class="easyui-textbox" multiline="true"
							   id="n_content" name="n_content" readonly="readonly">
					</div>
					<div class="row">
						<input class="easyui-textbox" id="n_file" name="n_file" 
							   readonly="readonly">
					</div>
				</div>
					<!-- Modal footer -->
				<div class="modal-footer" style="margin-right: 61px;">
					<button role="button" class="btn btn-danger" id="closeDetail" name="closeDetail"  data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
