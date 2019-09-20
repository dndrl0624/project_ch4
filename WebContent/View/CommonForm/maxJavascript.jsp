<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

/* 테이블 data insert 기능 */
$(function () {
		$.ajax({
				url : "/project_ch4_pojo/json/logGoodsJson.json",
				//data: $("#폼 태그 아이디").serialize();
				//type : 'post',
				dataType : "json",
				success : function(data) {
					$.each(data, function() {
						$('#logGoodsTable').append(
								"<tr><td>" + this["GMNG_NO"]
								+ "</td><td>" + this["APLG_NAME"]
								+ "</td><td>" + this["APLG_HP"]
								+ "</td><td>" + this["COM_NAME"]
								+ "</td><td>" + this["APLG_DESTI"]
								+ "</td><td>" + this["APLG_REASON"]
								+ "</td><td>" + this["APLG_TRANS_DATE"]
								+ "</td><td>" + this["GMNG_NAME"]
								+ "</td><td>" + this["GMNG_TYPE"]
								+ "</td><td>" + this["GMNG_QUAN"]
								+ "</td><td>" + this["GMNG_NOTES"]
								+ "</td></tr>");
					});
					$.each(data, function(index, entry) {
						$('#logGoodsTable').append(
								"<tr><td>" + entry["GMNG_NO"]
								+ "</td><td>" + entry["APLG_NAME"]
								+ "</td><td>" + entry["APLG_HP"]
								+ "</td><td>" + entry["COM_NAME"]
								+ "</td><td>" + entry["APLG_DESTI"]
								+ "</td><td>" + entry["APLG_REASON"]
								+ "</td><td>" + entry["APLG_TRANS_DATE"]
								+ "</td><td>" + entry["GMNG_NAME"]
								+ "</td><td>" + entry["GMNG_TYPE"]
								+ "</td><td>" + entry["GMNG_QUAN"]
								+ "</td><td>" + entry["GMNG_NOTES"]
								+ "</td></tr>");
					});
				},
				error : function() {
					alert("에러발생");
				}
			});
});

/* 검색방법 콤보박스로 textbox name값 변경 */
$(document).ready(function(){
	$('#SearchType').combobox({
		onChange: function(newVal){
			$("#searchText").textbox('textbox').attr('name',newVal);
			$("#searchText").attr('textboxname',newVal);
			$("span.textbox > .textbox-value").attr('name',newVal);
		}
	});
});

/* 검색버튼 기능 */
function btn_search(){
	alert(
			 "콤보:검색  :"+$('#SearchType').combobox('getValue')
			 +"// text Name : "+$("span.textbox > .textbox-value").attr('name')
			 +"// text value :"+document.getElementById("searchText").value
			 +"// 콤보:상태 :"+$('#state').combobox('getValue')
			 +"// 시작일  :"+$('#datepicker1').datebox('getValue')
			 +"// 종료일   :"+$('#datepicker2').datebox('getValue')
	)};
	
//combobox 직접입력 방지
$.fn.combobox.defaults.editable = false

//datebox 날짜형식 YYYY-MM-DD로 설정
$.fn.datebox.defaults.formatter = function(date){
    var y = date.getFullYear();
    var m = date.getMonth()+1;
    var d = date.getDate();
    return y+'-'+(m<10 ? "0"+m:m)+'-'+(d<10 ? "0"+d:d);
}  
//datebox parser설정
$.fn.datebox.defaults.parser = function(s){
    var t = Date.parse(s);
    if (!isNaN(t)){
       return new Date(t);
    } else {
       return new Date();
    }
}
//datebox 한글화
$.fn.datebox.defaults.currentText = '오늘'
$.fn.datebox.defaults.closeText = '닫기'
$.fn.calendar.defaults.weeks = ['일','월','화','수','목','금','토']
$.fn.calendar.defaults.months = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']

$(document).ready(function(){
    ///////////////////////// 방문날짜 이벤트  //////////////////////////
    $("#visit_term").combobox("disable");
    $("#visit_day").combobox("disable");
    //방문유형 선택시 입력폼 Enable,Disable
    $("#visit_type").combobox({
       onChange: function(newValue){
          if("일일방문"==newValue){   //datebox 1개만 Enable
             $("#visit_term").combobox("disable");
             $("#visit_day").combobox("disable");
             $("#visit_date2").datebox("disable");
          }
          else if("기간방문"==newValue){   //datebox 2개만 Enable
             $("#visit_term").combobox("disable");
             $("#visit_day").combobox("disable");
             $("#visit_date2").datebox("enable");
          }
          else {   //정기방문 : 전부 Enable
             $("#visit_term").combobox("enable");
             $("#visit_day").combobox("enable");
             $("#visit_date2").datebox("enable");
          }
       }
    });
    //방문시작일 선택시 마지막일 선택범위 (시작일+1~내년 당일) 제한
    $('#visit_date1').datebox({
       onSelect: function(date){
          firstDate = date;
          $('#visit_date2').datebox().datebox('calendar').calendar({
                validator: function(date){
                    var now = new Date();
                    var d1 = new Date(firstDate.getFullYear(), firstDate.getMonth(), firstDate.getDate()+1);
                    var d2 = new Date(now.getFullYear()+1, now.getMonth(), now.getDate());
                    return d1<=date && date<=d2;
                }
            });
          //최소기간을 정해버리면 disable이 풀림.....
          //그래서 '일일방문'에선 다시 사용못하게 막아야함
          if("일일방문"==$("#visit_type").val()){
             $("#visit_date2").datebox("disable");
          }
       }
    });
    //방문일자 선택범위 (당일~내년 당일) 제한
    $('#visit_date1').datebox().datebox('calendar').calendar({
          validator: function(date){
              var now = new Date();
              var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
              var d2 = new Date(now.getFullYear()+1, now.getMonth(), now.getDate());
              return d1<=date && date<=d2;
          }
      });
    //방문일자 마지막일 범위 초기세팅
    $('#visit_date2').datebox().datebox('calendar').calendar({
          validator: function(date){
              var now = new Date();
              var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate()+1);
              var d2 = new Date(now.getFullYear()+1, now.getMonth(), now.getDate());
              return d1<=date && date<=d2;
          }
      });
    $("#visit_date2").datebox("disable");
    //방문일자  초기세팅 당일로 : js와 충돌 : DB에서 값 받아서 넣어주기
    $('#visit_date1').datebox('setValue',now.getFullYear()+'-'+now.getMonth()+'-'+(now.getDate()+1));
});