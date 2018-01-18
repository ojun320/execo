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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="resources/img/execologo.png">
    <script type = "text/javascript">
        
    var ui = "";
	var Username = "";
	var hash = location.hash; // url에서 hash값 가져오기.
	if(hash == "" || hash == "#mainsec"){
		location.hash = "#mainsec"; // hash에 값이 없을때 초기값 설정
		loginCheck();
	}
	
	function htmlLoad(){
  		var url = location.hash.substr(1, location.hash.length);
  		loginCheck(url);
  	}
	
	// 시작 부분...
	function loginCheck(){
		var url = location.hash.substr(1, location.hash.length);
		$.post("LoginCheck").done(function(result1){
			console.log(result1.status);
			if(result1.status == 1){
				var usercheck = [];
				usercheck = result1.user;
				var userdata = [];
				userdata = usercheck.data;
				userid = "";
				userid = userdata.id;
				
				$(".logoutbox").show();
				$(".loginbox").hide();
				
				$("#idspan").text(userid);  
				$("section").load(url);
				
			}else{
				if(url == "notice" || url == "customer" || url == "customer1" || url == "customer2"){
					alert("login 후 이용 가능합니다.");
				 	location.replace("/");
				} else {
					$("section").load(url);
				}
				$(".loginbox").show();
				$(".logoutbox").hide();
			}
		});
	
	}
	
	$(document).ready(function(){
		var data = [];
		
// 		function htmlLoad(url){
// 	  		var url = hash.substr(1, hash.length);
// 	  		$("section").load(url);
// 	  	}
		
		// 회원가입 클릭했을시 hash전환
		$("#signup").off().on("click", function(){
			location.hash= "#signup";
	  		htmlLoad();
	  	});
		
		// 로그인 클릭했을시 hash전환
		$("#login").off().on("click", function(){
			location.hash= "#login";
	  		htmlLoad();
	  	});
/********************** 회사소개 hash전환 **************************/
		// 회사소개-인사말 클릭했을시 hash전환
		$(".sgintroduce1").off().on("click", function(){
			location.hash= "#introduce1";
	  		htmlLoad();
	  	});
		
		// 회사소개-회사연혁 클릭했을시 hash전환
		$(".sgintroduce2").off().on("click", function(){
			location.hash= "#introduce2";
	  		htmlLoad();
	  	});
		
		// 회사소개-오시는길 클릭했을시 hash전환
		$(".sgintroduce3").off().on("click", function(){
			location.hash= "#introduce3";
	  		htmlLoad();
	  	});
		
		// 회사소개-해외사업협력사 클릭했을시 hash전환
		$(".sgintroduce4").off().on("click", function(){
			location.hash= "#introduce4";
	  		htmlLoad();
	  	});
/**************************************************************/
/********************** 회사소개 hash전환 **************************/
		// 사업분야1 클릭했을시 hash전환
		$(".sgbusiness1").off().on("click", function(){
			location.hash= "#business1";
	  		htmlLoad();
	  	});
	  	
		// 사업분야2 클릭했을시 hash전환
		$(".sgbusiness2").off().on("click", function(){
			location.hash= "#business2";
	  		htmlLoad();
	  	});
		
		// 사업분야3 클릭했을시 hash전환
		$(".sgbusiness3").off().on("click", function(){
			location.hash= "#business3";
	  		htmlLoad();
	  	});
		
		// 사업분야4 클릭했을시 hash전환
		$(".sgbusiness4").off().on("click", function(){
			location.hash= "#business4";
	  		htmlLoad();
	  	});
/**************************************************************/
/********************** 회사소개 hash전환 **************************/
		// 제품소개1 클릭했을시 hash전환
			$(".introducelsr").off().on("click", function(){
				location.hash= "#introducelsr";
		  		htmlLoad();
		  	});
			// 제품소개2 클릭했을시 hash전환
			$(".introducelsr1").off().on("click", function(){
				location.hash= "#introducelsr1";
		  		htmlLoad();
		  	});
			// 제품소개3 클릭했을시 hash전환
			$(".introducelsr2").off().on("click", function(){
				location.hash= "#introducelsr2";
		  		htmlLoad();
		  	});
			// 제품소개4 클릭했을시 hash전환
			$(".introducelsr3").off().on("click", function(){
				location.hash= "#introducelsr3";
		  		htmlLoad();
		  	});
			
			// 제품소개5 클릭했을시 hash전환
			$(".introducelsr4").off().on("click", function(){
				location.hash= "#introducelsr4";
		  		htmlLoad();
		  	});
/**************************************************************/
/********************** 공지사항 hash전환 **************************/
		// 제품소개5 클릭했을시 hash전환
		$("#notice").off().on("click", function(){
			location.hash= "#notice";
	  		htmlLoad();
	  	});
/**************************************************************/
/********************** 고객지원 hash전환 **************************/
		// 고객지원1 클릭했을시 hash전환
		$(".customer").off().on("click", function(){
			location.hash= "#customer";
	  		htmlLoad();
	  	});
		// 고객지원2 클릭했을시 hash전환
		$(".customer1").off().on("click", function(){
			location.hash= "#customer1";
	  		htmlLoad();
	  	});
		// 고객지원3 클릭했을시 hash전환
		$(".customer2").off().on("click", function(){
			location.hash= "#customer2";
	  		htmlLoad();
	  	});
/**************************************************************/
		
	});
    </script>	
</head>
<body>

	<!--상단헤더부분-->
    <header>
            <div class="maintopbox">
                <div class="maintopimg">
                	<a href = ""><img src="resources/img/TITLE_LOGO_1420616575.png"></a>
                </div>
                <nav>
                    <ul>
                        <li id="introduce1"><a href="javascript:void(0)" class="sgintroduce1">회사소개</a>
                            <ul>
                                <li id="introduce1"><a href="javascript:void(0)" class="sgintroduce1">인사말</a></li>
                                <li id="introduce2"><a href="javascript:void(0)" class="sgintroduce2">회사연혁</a></li>
                                <li id="introduce4"><a href="javascript:void(0)" class="sgintroduce4">해외사업협력사</a></li>
                                <li id="introduce3"><a href="javascript:void(0)" class="sgintroduce3">오시는길</a></li>
                            </ul>
                        </li>
                        <li id="business1"><a href="javascript:void(0)" class="sgbusiness1">사업분야</a>
                            <ul>
                                <li id="business1"><a href="javascript:void(0)" class="sgbusiness1">액상실리콘사출성형</a></li>
                                <li id="business2"><a href="javascript:void(0)" class="sgbusiness2">특수센서</a></li>
                                <li id="business3"><a href="javascript:void(0)" class="sgbusiness3">품질관리솔루션</a></li>
                                <li id="business4"><a href="javascript:void(0)" class="sgbusiness4">액상수지공급시스템</a></li>
                            </ul>
                        </li>
                        <li id="introducelsr"><a href="javascript:void(0)" class="introducelsr">제품소개</a>
                            <ul>
                                <li id="introducelsr"><a href="javascript:void(0)" class="introducelsr">액상실리콘사출성형</a>
                                	<ul>
                                        <li id="introducelsr"><a href="javascript:void(0)" class="introducelsr">재료공급펌프</a></li>
                                        <li id="introducelsr1"><a href="javascript:void(0)" class="introducelsr1">정밀금형</a></li>
                                        <li id="introducelsr2"><a href="javascript:void(0)" class="introducelsr2">대형금형</a></li>
                                    </ul>
                                </li>
                                <li id="introducelsr3"><a href="javascript:void(0)" class="introducelsr3">특수센서</a></li>
                                <li id="introducelsr4"><a href="javascript:void(0)" class="introducelsr4">품질관리솔루션</a></li>
                            </ul>
                        </li>
                        <li id="notice">
                        <a href="javascript:void(0)" class="notice">공지사항</a>
                            <ul>
                                <li id="notice">
                                	<a href="javascript:void(0)" class="notice">공지사항</a>
                                </li>
                            </ul>
                        </li>
                        <li id="customer"><a href="javascript:void(0)" class="customer">고객지원</a>
                            <ul>
                                <li id="customer"><a href="javascript:void(0)" class="customer">자료실</a></li>
                                <li id="customer1"><a href="javascript:void(0)" class="customer1">견적문의</a></li>
                                <li id="customer2"><a href="javascript:void(0)" class="customer2">카탈로그</a></li>
                            </ul>
                        </li>
                        
                    </ul>
                </nav>
                
                <nav1>
                    <ul class="loginbox">
                        <li id ="login"><a href="javascript:void(0)" class="sglogin">Login</a></li>
                        <li id ="signup"><a href="javascript:void(0)" class="sgbtn">Signup</a></li>
                    </ul>
                    <ul class="logoutbox">
                        <li id ="logout"><a href="Logout" class="sglogout">Logout</a></li>
                        <li id ="label"><span id = "idspan"></span>&nbsp;&nbsp;님<hr>환영합니다</li>
                    </ul>
                </nav1>
            </div>
        </header>
    <!--헤더부분종료-->
	
	<section>
    </section>
    
    <!--바닥푸터부분-->
    <footer>
            <div class="mainbtmbox">
                <div class="mainbtmimg">
                    <a href = ""><img src="resources/img/TITLE_logo2_1420519158.png"></a>
                </div>
                <div class="mainbtmtxt">
                    <div class="btmtxt">상호 : <b>엑세코실업</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 대표자 : 한두원 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 사업장주소 : 경기도 고양시 일산동구 하늘마을로 158 대방트리플라온 B동 702호</div>
                    <div class="btmtxt">대표안내전화 : 031-908-3280 FAX : 031-905-3288 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 사업자번호 : 105-43-83318</div>
                    <div class="btmtxt"><b>Copyright ⓒ 2017 EXECO. All rights reserved.</b></div>
                </div>
            </div>
        </footer>
    <!--푸터부분종료-->
    
</body>
</html>
