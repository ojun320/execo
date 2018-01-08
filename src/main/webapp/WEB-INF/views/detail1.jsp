<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String newsNo = request.getParameter("newsNo");
%>
<!doctype html>
<html>
<meta charset = "UTF-8">  
<head>
    <link rel = "stylesheet" href ="resources/css/main.css">
    <link rel = "stylesheet" href ="resources/css/Detail.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function(){
        	var dt = [];
            var newsNo = <%=newsNo%>;
            
            
            $.ajax({
                url : "newsDetail",
                data : {"newsNo" : newsNo}            
             }).done(function(d){
            	var result = JSON.parse(d);
            	dt = result.data;
				console.log(dt);
                listHtml(); 
                
             });
            
			function htmlLoad(){
		  		var url = "/web/" + hash.substr(1, hash.length)
		  		$("section").load(url);	
		  	}
			
			/********************** 회사소개 hash전환 **************************/
			// 회사소개-인사말 클릭했을시 hash전환
			$("#introduce1").off().on("click", function(){
				hash= "#introduce1";
		  		htmlLoad();
		  	});
			
			// 회사소개-회사연혁 클릭했을시 hash전환
			$("#introduce2").off().on("click", function(){
				hash= "#introduce2";
		  		htmlLoad();
		  	});
			
			// 회사소개-오시는길 클릭했을시 hash전환
			$("#introduce3").off().on("click", function(){
				hash= "#introduce3";
		  		htmlLoad();
		  	});
			
			// 회사소개-해외사업협력사 클릭했을시 hash전환
			$("#introduce4").off().on("click", function(){
				hash= "#introduce4";
		  		htmlLoad();
		  	});
	/**************************************************************/
	/********************** 회사소개 hash전환 **************************/
			// 사업분야1 클릭했을시 hash전환
			$("#business1").off().on("click", function(){
				hash= "#business1";
		  		htmlLoad();
		  	});
		  	
			// 사업분야2 클릭했을시 hash전환
			$("#business2").off().on("click", function(){
				hash= "#business2";
		  		htmlLoad();
		  	});
			
			// 사업분야3 클릭했을시 hash전환
			$("#business3").off().on("click", function(){
				hash= "#business3";
		  		htmlLoad();
		  	});
			
			// 사업분야4 클릭했을시 hash전환
			$("#business4").off().on("click", function(){
				hash= "#business4";
		  		htmlLoad();
		  	});
	/**************************************************************/
	/********************** 회사소개 hash전환 **************************/
			// 제품소개1 클릭했을시 hash전환
			$("#introducelsr").off().on("click", function(){
				hash= "#introducelsr";
		  		htmlLoad();
		  	});
			// 제품소개2 클릭했을시 hash전환
			$("#introducelsr1").off().on("click", function(){
				hash= "#introducelsr1";
		  		htmlLoad();
		  	});
			// 제품소개3 클릭했을시 hash전환
			$("#introducelsr2").off().on("click", function(){
				hash= "#introducelsr2";
		  		htmlLoad();
		  	});
			// 제품소개4 클릭했을시 hash전환
			$("#introducelsr3").off().on("click", function(){
				hash= "#introducelsr3";
		  		htmlLoad();
		  	});
			
			// 제품소개5 클릭했을시 hash전환
			$("#introducelsr4").off().on("click", function(){
				hash= "#introducelsr4";
		  		htmlLoad();
		  	});
	/**************************************************************/
	/********************** 공지사항 hash전환 **************************/
			// 제품소개5 클릭했을시 hash전환
			$("#notice").off().on("click", function(){
				hash= "#notice";
		  		htmlLoad();
		  	});
	/**************************************************************/
	/********************** 고객지원 hash전환 **************************/
			// 제품소개5 클릭했을시 hash전환
			$("#customer").off().on("click", function(){
				hash= "#customer";
		  		htmlLoad();
		  	});
	/**************************************************************/			

			// 취소버튼 눌렀을때 model로 돌아가기
			$(".qpsyQbtn2").off().on("click", function(){
				location.replace("model");
			});

			function listHtml(){

	             console.log("title"+dt.title);
	             var jam = (dt.title).substring(0,50); 
	              $(".jam h2").html(jam);
	              
	             var day = dt.days;
	              $(".day .dayp").html(day);
	              
	             var contents = dt.contents
	              $("#c_title span").html(contents);
	             
	             tag = '<div class="listimgbox-1">'+
					'<img src="/web/'+dt.picPath+dt.picName+ '">'+
				'</div>'
				$(".showimg").append(tag);
			}
			
			
			// 시작 부분...
			function inita(){
		           
			$.post("LoginCheck").done(function(result1){
				if(result1.status == 1){
					var usercheck = [];
					
					usercheck = result1.user;
					console.log(usercheck);
					var userdata = [];
					userdata = usercheck.data;
					console.log(userdata);
					userid = "";
					userid = userdata.id;
					console.log(userid);
					
					$(".logoutbox").show();
					$(".loginbox").hide();
					$("#idspan").append(userid);  
					Username = userid; 
					
				}else{
					$(".loginbox").show();
					$(".logoutbox").hide();            
				}
			});
			
			}
			inita();    

			htmlLoad();
		});
    </script>

</head>
	<body>
	
		<!--상단헤더부분-->
	    <header>
            <div class="maintopbox">
                <div class="maintopimg">
                	<a href = "model"><img src="/web/resources/img/TITLE_LOGO_1420616575.png"></a>
                </div>
                <nav>
                    <ul>
                        <li id="introduce1"><a href="#" class="sgintroduce1">회사소개</a>
                            <ul>
                                <li id="introduce1"><a href="#" class="sgintroduce1">인사말</a></li>
                                <li id="introduce2"><a href="#" class="sgintroduce2">회사연혁</a></li>
                                <li id="introduce4"><a href="#" class="sgintroduce4">해외사업협력사</a></li>
                                <li id="introduce3"><a href="#" class="sgintroduce3">오시는길</a></li>
                            </ul>
                        </li>
                        <li id="business1"><a href="#" class="sgbusiness1">사업분야</a>
                            <ul>
                                <li id="business1"><a href="#" class="sgbusiness1">액상실리콘사출성형</a></li>
                                <li id="business2"><a href="#" class="sgbusiness2">특수센서</a></li>
                                <li id="business3"><a href="#" class="sgbusiness3">품질관리솔루션</a></li>
                                <li id="business4"><a href="#" class="sgbusiness4">액상수지공급시스템</a></li>
                            </ul>
                        </li>
                        <li id="introducelsr"><a href="#" class="introducelsr">제품소개</a>
                            <ul>
                                <li id="introducelsr"><a href="#" class="introducelsr">액상실리콘사출성형</a>
                                	<ul>
                                        <li id="introducelsr"><a href="#" class="introducelsr">재료공급펌프</a></li>
                                        <li id="introducelsr1"><a href="#" class="introducelsr1">정밀금형</a></li>
                                        <li id="introducelsr2"><a href="#" class="introducelsr2">대형금형</a></li>
                                    </ul>
                                </li>
                                <li id="introducelsr3"><a href="#" class="introducelsr3">특수센서</a></li>
                                <li id="introducelsr4"><a href="#" class="introducelsr4">품질관리솔루션</a></li>
                            </ul>
                        </li>
                        <li id="notice"><a href="#" class="notice">공지사항</a>
                            <ul>
                                <li id="notice"><a href="#" class="notice">공지사항</a></li>
                                <li><a href="#">채용정보</a></li>
                            </ul>
                        </li>
                        <li id="customer"><a href="#" class="customer">고객지원</a>
                            <ul>
                                <li><a href="#">카탈로그</a></li>
                                <li id="customer"><a href="#" class="customer">new&events</a></li>
                                <li><a href="#">질문과 답변</a></li>
                                <li><a href="#">사진</a></li>
                                <li><a href="#">견적문의</a></li>
                            </ul>
                        </li>
                        
                    </ul>
                </nav>
                
                <nav1>
                    <ul class="loginbox">
                        <li id ="login"><a href="#" class="sglogin">Login</a></li>
                        <li id ="signup"><a href="#" class="sgbtn">Signup</a></li>
                    </ul>
                    <ul class="logoutbox">
                        <li id ="logout"><a href="/web/Logout" class="sglogout">Logout</a></li>
                        <li id ="label"><span id = "idspan"></span>&nbsp;&nbsp;님<hr>환영합니다</li>
                    </ul>
                </nav1>
            </div>
        </header>
	    <!--헤더부분종료-->
		
		<!--중간미드부분-->
		<section>
        <div class="Dmidbox">
		    <div class="Demptybox"></div>
		    <div class="Dbox">
		        <div class="qpsydatailTop1">
                    <span>new&events</span>
                </div>
                <hr>
                <div class = "jam">
                	<h2></h2>
                </div>
                <hr>
                <div class = "day">
                	<p class = dayp></p>
                </div>
                <hr>
                <div class="showimg">
                
                </div>
                <hr>
                <div class="dtextbox" id="c_title">
					<span  style="overflow:hidden; text-overflow:ellipsis; white-space: normal;  word-wrap: break-word; -webkit-line-clamp: 3;"></span>
                </div>
                <hr>
                <div class ="boxheight">
                    <input type="button" class="qpsyQbtn2" value="목록">
                </div>
		    </div>
        </div>
        </section>
        <!--중간미드종료-->
        
        <!--바닥푸터부분-->
    	<footer>
            <div class="mainbtmbox">
                <div class="mainbtmimg">
                    <a href = "model"><img src="/web/resources/img/TITLE_logo2_1420519158.png"></a>
                </div>
                <div class="mainbtmtxt">
                    <div class="btmtxt">상호 : 엑세코실업 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 대표자 : 한두원 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 사업장주소 : 경기도 고양시 일산동구 하늘마을로 158 대방트리플라온 B동 702호</div>
                    <div class="btmtxt">대표안내전화 : 031-908-3280 FAX : 031-905-3288 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 사업자번호 : 105-43-83318</div>
                    <div class="btmtxt">Copyright ⓒ 2017 EXECO. All rights reserved.</div>
                </div>
            </div>
        </footer>
    	<!--푸터부분종료-->
	</body>
</html>
