<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="/Style/common/HeadUI.jsp"%> 
<title>Admin_info</title>
<style type="text/css">
	body{
		padding-left: 0px;
	}
	.table thead{
		background-color: #337ab7;
		color: white;
	}
	
	.nav-link{
		font-size: 20px;
	}
	.sidebar-sticky{
		margin-top: 130px;
	}
	
	#side-bar{
		height: 1000px;
		background-color: black;
	}
	
	.container-fluid {
		padding-left: 0px;
	}
	#contentArea {
		padding-left: 50px;
		padding-right: 50px;
	}
	#title {
		font-weight: 700;	
		margin-bottom: 20px;
	}
</style>
<script type="text/javascript">
	function moveQnA(){
		alert("여기");
		location.href="admin/qnaBoard.ch4";
	}

</script>
</head> 
<body>
<script type="text/javascript">
	$(document).ready(function(){
		jQuery.fn.bootstrapTable.columnDefaults.halign="center"
		$("#admin_info").bootstrapTable({
			columns:[
		        {field:'com_name',title:'회사명', width:'150', widthunit:'px'}
		        ,{field:'com_reg_date',title:'가입일', width:'80', widthunit:'px'}
		        ,{field:'com_addr',title:'주소', width:'200', widthunit:'px'}
		        ,{field:'com_hp',title:'전화번호', width:'80', widthunit:'px'}
		        ,{field:'com_type',title:'업종', width:'50', widthunit:'px'}
		        ,{field:'com_card_use',title:'출입증<br>사용여부', width:'50', widthunit:'px'}
		        ,{field:'com_bizno',title:'사업자번호', width:'100', widthunit:'px'}
		   ]
			,search:'true'
			//,url:'/project_ch4_pojo/View/Test/jsonAdminInfoList.json'
			,url:'admin/adminInfo.ch4'
			,pagination:'true'//페이지 네이션
			,paginationPreText:"Previous"
			,paginationNextText:"Next"
			,pageSize:10//기본 페이지 사이즈
			,pageList:[10, 15, 20] //칸수
		});
	});
</script>
<%@ include file="/View/CommonForm/Top.jsp"%>
<div class="container-fluid">
	<div class="col-lg-2" id="side-bar">
		<div class="sidebar bg-light">
			<div class="sidebar-sticky">
				<ul class="nav flex-column">
					<li class="nav-item">
			            <a class="nav-link" href="#">
			              <span data-feather="file"></span>
							고객정보관리
			            </a>
					</li>
					<li class="nav-item">
			            <a class="nav-link" href="javascript:moveQnA()">
			              <span data-feather="file"></span>
			              	QnA
			            </a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-lg-10" id="contentArea">
		<div class="row">
			<h1 id="title">고객 정보 관리</h1>
		</div>
		<table id="admin_info" class="table"></table>
	</div>
</div>
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>