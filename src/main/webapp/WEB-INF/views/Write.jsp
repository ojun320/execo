<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<meta charset = "UTF-8">
<head>
	<link rel="stylesheet" href ="resources/css/main.css">
    <link rel="stylesheet" href= "resources/css/Write.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
    
         $(document).ready(function(){
        	 
           $("form").on("submit", function( event ) {
             event.preventDefault(); //submit이 안되게 막는다 
             						//ajax 사용하기 때문
             						
             /* 값 넣으라는 예외처리(null값일 경우 경고창 띄움) */
			 if($("#Qtitle").val() == ""){ 
				alert("제목을 입력해주세요.");
				return false;
			 }else if($("#QContents").val() ==""){
				 alert("내용을 입력해주세요.");
					return false;
			 }
             
             $.ajax({
                    url:"WriteData", 
                    data: $(this).serialize()
              }).done(function(result){
                 data = JSON.parse(result);
                 if(data.status == 1){
                    alert("작성되었습니다.");
                 }else {
                    alert("다시 작성해주세요.");
                 }
              });
        });
           
//----------------------------------------------- 작성버튼 클릭시 부분전환-------------------------------------------------------------

			$(".qpsywritebtn").off().on("click",function(){
				hash = "#notice";
				htmlLoad();
			});
			
			function htmlLoad(){
		  		var url = "/web/" + hash.substr(1, hash.length)
		  		$("section").load(url);
		  	}

//------------------------------------------------------------------------------------------------------------------------------

//----------------------------------------------- 취소버튼 클릭시 부분전환-------------------------------------------------------------

			$(".qpsywriteback").off().on("click",function(){
				hash = "#notice";
				htmlLoad();
			});
			
			function htmlLoad(){
		  		var url = "/web/" + hash.substr(1, hash.length)
		  		$("section").load(url);
		  	}

//------------------------------------------------------------------------------------------------------------------------------
      });

    </script>
</head>

<body>
		<div class="qmidbox">
		<div class="qemptybox"></div>
            <div class="qpsywriteBox">
            <form>
                <div class="qpsywriteTop">
                    <span><b>제 목</b> : <input type="text" name="Qtitle" id="Qtitle" style="width: 200px; height: 25px;"></span>
                </div>
                <div class="qpsywriteMiddle">
                    <p><b>내 용</b></p>
                    <textarea rows="35" cols="98" maxlength="98" name="QContents" id="QContents" style="margin: 0px 0px 0px 50px; width: 805px; height: 420px;"></textarea>
                </div>
                <div class="qpsywriteBottom">
                   <button type="submit" class="qpsywritebtn">작 성</button>
                   <button type="button" class="qpsywriteback">취 소</button>
                </div>
              </form>
            </div>
		</div>
</body>

</html>