<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      background-image: url('../../Style/images/banner/speedGate (2).jpg');
   }
   .jumbotron_Content a{
      font-size: 25px;
   }
   .Content_title h1{
      padding-top: 12px;
      padding-bottom: 12px;
       border-width: thick;
       margin-bottom: -10px;
   }
</style>
</head>
<body>
<script type="text/javascript">
   //검색하기
   function NoticeList(){
      alert("검색");
      var cb_search = $("#cb_search").val();
      var tb_search = $("#tb_search").val();
      alert("tb_search : "+tb_search);
       $("#tb_notice").bootstrapTable({
         alert("여기")
         //url:"/index/notice.ch4?cb_search="+cb_search+"&tb_search="+tb_search
      }); 
   }////////////////////////end of NoticeList
   $("#tb_notice").bootstrapTable({
      columns:[[
           {field:'n_no',title:'no'}
           ,{field:'n_title',title:'title'}
           ,{field:'n_date',title:'date'}
           ,{field:'n_writer',title:'writer'}
           ,{field:'n_hit',title:'hit'}
      ]]
      //,url:'/index/notice.ch4'
      ,pagination:'true'//페이지 네이션
      ,paginationPreText:"Previous"
      ,paginationNextText:"Next"
      ,pageSize:2//기본 페이지 사이즈
      ,pageList:[2, 4, 6, 8] //칸수
      ,onClickRow:function(row,$element,field){
         //$element.attr('data-index',10)
         $element.toggleClass('single-select');//로우 클릭했을 때 색 변함.
         //alert(row.N_NO);
       }
      ,onDblClickRow:function(row,$element,field){
         alert("상세조회 모달");
       }
   });////////////////end of bootstrapTable
</script>
   <!-- 미결과제 : 사진선택 디자인을 다시해야한다 게시판 형식 작성 -->
<!-- Top -->   <!-- 선택된 페이지 class : nav-item active // 나머지 페이지: nav-item -->
<%@ include file="/View/CommonForm/Top.jsp"%>
<!-- Banner -->
   <section class="banner_Content">
      <div class="jumbotron_Content">
         <div class="container_Banner_Content col-lg-offset-2 col-lg-3 col-lg-7" style="color: white;">
            <div class="row Content_title">
               <h1 style="font-size:60px; text-shadow: 4px 2px 2px gray; margin-top: 70px;">공지사항</h1><br>
            </div>
            <div class="row page_link" style="padding-left: 5px;">
               <a href="Index_Main.jsp">Home</a> → <a href="Index_Notice.jsp">Notice</a>
            </div>
         </div>
      </div> 
   </section>
   

<!-- 공지사항 게시판 -->
<div align="center">
   <div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
   <div style="margin-top: 30px;"></div>
      <div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
         <div class="row">
            <div class="well" style="margin-top: 10px;">
               <form>
                  <div class="row" align="left" style="margin-left: 60px;">
                     <label style="margin-right: 30px;">Search</label>
                     <select id="cb_search" name="cb_search" class="easyui-combobox" panelHeight="auto" style="width:200px">
                        <option selected value="">선택</option>       
                        <option value="n_title">제목</option>       
                        <option value="n_content">내용</option>       
                        <option value="n_writer">작성자</option>       
                      </select>
                       &ensp;&ensp;&ensp;
                     <input class="easyui-textbox" id="tb_search" name="tb_search" style="width:400px;">
                     <button onClick="javascript:NoticeList()" class="btn btn-info" id="btn_search" 
                           style="height: 30px;margin-left: 17px;">
                        검색
                     </button>
                  </div>
               </form>
            </div>
         </div>
         <div class="row">
            <table class="table table-bordered table-hover" id="tb_notice" >
               <thead style="background-color: #e1f1fd;">
                  <tr>
                     <td id="n_no" data-field="n_no" width="10%">NO</td>
                     <td id="n_title" data-field="n_title" width="40%">TITLE</td>
                     <td id="n_date" data-field="n_date" width="10%">DATE</td>
                     <td id="n_writer" data-field="n_writer" width="20%">WRITER</td>
                     <td id="n_hit" data-field="n_hit" width="10%">HIT</td>
                  </tr>
            </table>
         </div>
      </div>
   </div>
</div>
<!-- 공통 Footer -->
<%@ include file="/View/CommonForm/Footer.jsp"%>
</body>
</html>