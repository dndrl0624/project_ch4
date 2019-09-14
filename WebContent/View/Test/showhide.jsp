<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Test</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                 
                //검색하고 나서 결과를 보여줄때 검색 조건을 그대로 노출
                //if("${serviceType}" == "sports"){ //serviceType 이 sport 일 경우 셋팅
                if("sports" == "sports"){
                 
                    //라디오 버튼 값으로 선택
                    $('input:radio[name="serviceType"][value="sports"]').prop('checked', true);
                    //셀렉트 박스 값으로 선택
                    $("select[name='sportsMainCategory']").val("2").attr("selected", "selected");
                    //공연/전시 카테고리 hide
                    $( "#viewConcertCategory" ).hide();
                    //스포츠 카테고리 show
                    $( "#viewSportCategory" ).show();
                    //스포츠 일때 담당MD 비활성화
                    $( "#mdName" ).prop( "disabled", true );
                    //담당MD 입력값 초기화;
                    $( "#mdName" ).val("");
                }
                 
                //라디오 버튼 변경시 이벤트
                $("input[name='serviceType']:radio").change(function () {
                        //라디오 버튼 값을 가져온다.
                        var serviceType = this.value;
                                         
                        if(serviceType == "sports"){//스포츠인 경우
                            //스포츠 일때 공연/전시 카테고리 hide
                            $( "#viewConcertCategory" ).hide();
                            //스포츠 일때 스포츠 카테고리 show
                            $( "#viewSportCategory" ).show();
                            //스포츠 일때 담당MD 비활성화
                            $( "#mdName" ).prop( "disabled", true );
                            $( "#mdName" ).val("");
                        }else if(serviceType == "concert"){//공연/전시인 경우
                            //공연/전시 일때 공연/전시 카테고리 show
                            $( "#viewConcertCategory" ).show();
                            //공연/전시 일때 스포츠 카테고리 show
                            $( "#viewSportCategory" ).hide();
                            //공연/전시 일때 담당 MD 활성화
                            $( "#mdName" ).prop( "disabled", false );
                        }
                                         
                    });
            });
        </script>
    </head>
    <body>
        <input type="radio" name="serviceType" value="concert" checked><span> 공연/전시</span>
        <input type="radio" name="serviceType" value="sports"><span> 스포츠</span>
        <br>
        <br>
        <span id="viewConcertCategory">
            공연/전시 카테고리: 
            <select class="form-control concertMainCategory" name="concertMainCategory" style="width:200px">
                <option value="">전체</option>
                <option value="1">뮤지컬</option>
                <option value="2">콘서트</option>
            </select>
        </span>
        <span id="viewSportCategory" style="display:none">
            스포츠 카테고리: 
            <select class="form-control sportsMainCategory" name="sportsMainCategory" style="width:200px">
                <option value="">전체</option>
                <option value="1">야구</option>
                <option value="2">농구</option>
                <option value="3">축구</option>
            </select>
        </span>
        <br>
        <br>
        담당MD <input type="text" class="form-control" id="mdName" name="mdName" value="husk"/>
    </body>
</html>
