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
        <link rel = "stylesheet" href = "resources/css/main.css">
        <link rel = "stylesheet" href = "resources/css/signup.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function(){
        	$("#email").attr("pattern", "[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*");
        	
        	// 회원가입 + 예외처리
        	var idText = "";
            var finId ="";
            
            var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        	
        	$("#btnP0").on("click", function(){
        		
        		id = $("#id").val();
        		pw = $("#pw").val();
        		name = $("#name").val();
        		email = $("#email").val();
        		phone = $("#phone").val();
        		auth = $("#auth").val();
        		
        		if(id == "" && pw == "" && name == "" && email == "" && phone == "" && auth == "" && $("#checkid").text()!="완료" && finId!=idText){
                     alert("값을 모두 입력해주세요.");
                     return false;
        		 }else if(regex.test(email) == false){
        			 alert("잘못된 이메일 형식입니다.");
        	         return false;
        		 }
        			 
        			 $.ajax({
                        type:"post",
                        url:"SignupData",
                        data: {"id" : id , "pw" : pw, "name" : name, "email" : email, "phone" : phone, "auth" : auth}
                     }).done(function(result){
                       alert("회원가입이 완료되었습니다. 로그인하세요.");
                       location.href = "model";
                       
                      });

        });
       
          
        	
        	
        	$("#btnP1").off().on("click", function(){
        		location.replace("model");
        	});
        	
        	$("#checkid").off().on("click", function(){
        		$("#id").attr("readonly",true).attr("disabled",false); // 아이디창 중복확인 예외처리
        		btnOverlap();
        	});
        	
        	$("#phone").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") ); }); // 전화번호 예외처리
        	
        	$("#id").keyup(function(){ $(this).val($(this).val().replace(/[^a-z0-9:\-_]/gi,'') ); }); // 아이디 예외처리
   });
        
//--------------------------아이디 중복확인---------------------------------------

        function btnOverlap(){
            var id = $("#id").val();
            
            if(id == ""){
               alert("아이디를 입력하세요!!");
               return false;
            }
            
            $.ajax({
               type : "post",
               url : "checkid",
               data:{"id" : id},
               datatype: "json"
            }).done(function(result){           
               if(result.checkid == null){
                   $("#checkid").text("완료");
                   alert("사용가능한 아이디입니다.");
                }else{
                   $("#checkid").text("중복확인");
                   $("#id").val("");
                   alert("사용중인 아이디 입니다.");
                }
            });
         }
//-------------------------------------------------------------------------- 
    	
    	
        </script>
    </head>
    <body>
        <!--중간미드부분-->
        <section>
            <div class="signupbody">
                <div class="signupcen">
                    <div class="signuptop">
                        <h1>SignUp</h1>
                    </div>
                    <div class="signupmid">
                        <div class="signupmid1">
                            <div class="signupmid1-1">
                                <h2>Id</h2>
                            </div>
                            <div class="signupmid1-x">
                                <input type="text" class="signupinputbox" placeholder="아이디" id="id" name="id" maxLength="20">
                       			<button type="button" class="loginButton" id="checkid">중복확인</button>
                            </div>
                        </div>
                        <div class="signupmid1">
                            <div class="signupmid1-1">
                                <h2>Password</h2>
                            </div>
                            <div class="signupmid1-2">
                                <input type="password" class="signupinputbox" placeholder="비밀번호" id="pw" name="pw" maxLength="20">
                            </div>
                        </div>
                        <div class="signupmid1">
                            <div class="signupmid1-1">
                                <h2>Name</h2>
                            </div>
                            <div class="signupmid1-2">
                                <input type="text" class="signupinputbox" placeholder="이름" id="name" name="name" maxLength="20">
                            </div>
                        </div>
                        <div class="signupmid1">
                            <div class="signupmid1-1">
                                <h2>Email</h2>
                            </div>
                            <div class="signupmid1-2">
                                <input type="email" class="signupinputbox" placeholder="이메일" id="email" name="email" maxLength="20">
                            </div>
                        </div>
                        <div class="signupmid1">
                            <div class="signupmid1-1">
                                <h2>Phone</h2>
                            </div>
                            <div class="signupmid1-2">
                                <input type="text" class="signupinputbox" placeholder="휴대전화" id="phone" name="phone" maxLength="20">
                            </div>
                        </div>
                        <div class="signupmid1">
                            <div class="signupmid1-1">
                                <h2>Auth</h2>
                            </div>
                            <div class="signupmid1-2">
                                <input type="text" class="signupinputbox" placeholder="권한" id="auth" name="auth" maxLength="20">
                            </div>
                        </div>
                    </div>
                    <div class="signupbtm">
                        <button type="button" class="loginButton1" id="btnP0">가입</button> 
                		<button type="button" class="loginButton2" id="btnP1">취소</button>
                    </div>
                </div>
            </div>
        </section>
        <!--미드부분종료-->
    </body>
</html>