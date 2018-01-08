<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>
        엑세코실업 [EXECO]
    </title>
    <head>
        <link rel ="stylesheet" href ="resources/css/main.css">
        <link rel="stylesheet" href="resources/css/login.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script>
        
        var ui = "";
        
       		$(document).ready(function(){
       			$("#loginbtn").off().on("click", function(){
       	 			login();
       	 	    });
       			
       			$("#logincns").off().on("click", function(){
       				location.href ="model";
       	 	    });
       		});
       		
       		
		/* 로그인 */
		function login(){ 	   
		 		
			var id = $("#id").val();
			var pw = $("#pw").val();	          
		 	             
			if(id == "" || pw == ""){
			alert("아이디 또는 비밀번호가 입력되지 않았습니다!!");
			return false;
		}	             
			$.ajax({
			type:"post", 
			url:"LoginData",
			data:{"id": id, "pw": pw},	                
			datatype:"json"  
			}).done(function(data){
			var result = data;
			ui = id;
			             		 
		if(result.data != null){  	            		 	            		 
			//ui = session.getAttribute("user");		            		
			alert(ui + "님 환영합니다.");
			//$('#sjloginbtn').removeClass('m_col_disb').addClass('m_col_disn');
			//$('#sjSignup').removeClass('m_col_disb').addClass('m_col_disn');
			//$('#sjlogoutbtn').addClass('m_col_disb');
			//$('#sjlabel').addClass('m_col_disb');
			location.href ="model";
		}else{
			alert("로그인 실패");
			//location.replace("Logout"); // 로그인실패시 보낼 경로
		}
		
		}).fail(function(x){
			alert("오류 다시로그인하세요."); 	                
		});
		 				            
		}
        </script>
    </head>
    <body>
        <!--중간바디부분-->
        <div class="loginbody">
            <div class="logincen">
                <div class="logintop">
                    <h1>Login</h1>
                </div>
                <div class="loginmid-1">
                   <div class="loginbox1-1">
                       <h2>Id</h2>
                   </div>
                   <div class="loginbox1-2">
                       <input type="text" class="logininputbox" id="id" name="loginid">
                   </div>
                </div>
                <div class="loginmid-2">
                    <div class="loginbox2-1">
                       <h2>Password</h2>
                   </div>
                   <div class="loginbox2-2">
                       <input type="password" class="logininputbox" id="pw" name="loginpw">
                   </div>
                </div>
                <div class="loginbtm">
                    <button type="button" class="loginButton1" id="loginbtn">확인</button> 
                	<button type="button" class="loginButton2" id="logincns">취소</button>
                </div>
            </div>
        </div>
        <!--중간바디종료-->
    </body>
</html>