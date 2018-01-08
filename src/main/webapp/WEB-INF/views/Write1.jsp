<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   String newsNo = request.getParameter("newsNo");
%>
<!doctype html>
<html>
<head>
	<link rel="stylesheet" href ="resources/css/main.css">
    <link rel="stylesheet" href= "resources/css/Write.css">
    <link rel="stylesheet" href= "resources/css/Write1.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
    
         $(document).ready(function(){
          	 var dt = [];
             var newsNo = <%=newsNo%>;
            
             function button(){
               $(".btn1").off().on("click", function(ev){ // 글쓰기 페이지(write) 전환 이벤트를 작성 한다.
                  		
  						var form = document.forms[0];
                        var formData = new FormData(form);
                        if(!form.content.value){
                            alert("내용을 입력해주세요.");
                            form.content.focus();
                         }else if(!form.title.value){
                            alert("제목을 입력해주세요.");
                            form.title.focus();
                         }else if(!form.days.value){
                         alert("날짜를 지정해주세요.");
                         form.days.focus();
                         }else if(!form.file.value){
                         alert("파일을 선택해주세요.");
                         form.file.focus();
                         }else{
                         	console.log("수정 완료!");
                         	$.ajax({
        	                     type:"post",
        		                     url:"updatewrite",
        		                     enctype: 'multipart/form-data',
        		                     processData: false,
        		                     contentType: false,
        		                     cache: false,
        		                     data: formData          
        	                      }).done(function(d){
        	                         dt = d.data;
        	                        location.href="detail?newsNo="+newsNo;
        	                      });
                         	ev.preventDefault();
        	                 
                         }
               });

               $(".btn2").off().on("click", function(){ // 저장

                       var form = document.forms[0];
                       var formData = new FormData(form);
                       console.log("ddd");
                       if(!form.content.value){
                           alert("내용을 입력해주세요.");
                           form.content.focus();
                           return false;
                        }else if(!form.title.value){
                           alert("제목을 입력해주세요.");
                           form.title.focus();
                           return false;
                        }else if(!form.days.value){
 	                       alert("날짜를 지정해주세요.");
 	                       form.days.focus();
 	                       return false;
                        }else if(!form.file.value){
 	                       alert("파일을 선택해주세요.");
 	                       form.file.focus();
 	                       return false;
                        }else{
                     	   
                            $.ajax({
                                type:"post",
                                url:"inwriting",
                                enctype: 'multipart/form-data',
                                processData: false,
                                contentType: false,
                                cache: false,
                                data: formData
                             }).done(function(d){
                            	 console.log("ssss");
                          	   var num = JSON.parse(d);

                             });
                        }
                       
                       hash = "#customer";
          				htmlLoad();
                 });
               
               function htmlLoad(){
      		  		var url = "/web/" + hash.substr(1, hash.length)
      		  		$("section").load(url);
      		  	}
               
               $("#fileName").off().on("click", function(){
                  window.open(dt.filePath);
               });
            }
             
             if(newsNo == null){
            	 console.log("버튼()");
            	 button();
                
             }else{
            	 console.log("로드()");
            	 button();
            	 
             }        	 
      
// 			button();
// 			console.log("좆같네");
//----------------------------------------------- 취소버튼 클릭시 부분전환-------------------------------------------------------------

 			$(".qpsywriteback").off().on("click",function(){
 				hash = "#customer";
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
<div id="content">
		<div class="qmidbox">
		<div class="qemptybox"></div>
            <div class="mainbox">
                   <div class="title">
                       <span>글쓰기</span>
                   </div>
                   <div class="write">
                       <form action="inwriting" method="post" enctype="multipart/form-data">
                        <div class="form1">
                           <span>Title : </span>
                           <input type="hidden" name ="no" value="<%=newsNo %>">
                           <input type="text" placeholder="입력하세요." name="title" id="title">
                           <span>Date : </span>
                           <input type="date" placeholder="선택하세요" name="days" id="days" min="2017-01-01" max="2018-12-31"> 
                        </div>
                        <div class="form2">
                            <textarea name="content" id="content2"></textarea>
                        </div>
                        <div class="upload">
                            <div>
                               <label for="fileName">첨부 파일 :</label>
                               <input type="file" name="file" id="file" value="파일"  >
                               <span id="fileName"></span>
                            </div>
                            <div>
                               <label for="img">이미지 :</label>
                               <input type="file" name="img" id="img" value="이미지"  accept="image/*">
                               <span id="imgName"></span>
                            </div>
                        </div>
                        <div class="Button">
                          <button type="button" class="btn2">저장</button>
                          <button type="button" class="qpsywriteback">취 소</button>
                      	</div>
                     </form>
                   </div>
                </div>
		</div>
		</div>
</body>

</html>