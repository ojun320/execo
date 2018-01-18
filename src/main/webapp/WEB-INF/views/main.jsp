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
    	<link rel = "stylesheet" href = "resources/css/notice1.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script type="text/javascript">
    	
		var data = []; // 데이터 담을 배열 변수 선언
		var hash = location.hash; // url에서 hash값 가져오기.
		if(hash == ""){
			location.hash = "#mainsec"; // hash에 값이 없을때 초기값 설정
		}
		
		function htmlLoad(){
	  		var url = location.hash.substr(1, location.hash.length);
	  		loginCheck(url);
	  	}
		
        $(document).ready(function(){
        	var viewRow = 10; // 화면에 보여질 행 갯수
        	var page = 1; // 현재 페이지 값
        	var totCnt = 0; // 데이터 전체 객수
        	var pageGroup = 1; // 현재 페이지 값
        	var pageView = 5; // 페이징 버튼 객수
//         	var hash = location.hash;
        	var tag = "";
        	var slideIndex = 0;
        	
//         	function htmlLoad(){
//         		var url = location.hash.substr(1, location.hash.length);
//        		 	$("section").load(url);
//         	}
        	// 제품소개1 클릭했을시 hash전환
    		$(".midboxmid1").off().on("click", function(){
    			location.hash= "#introducelsr";
    	  		htmlLoad();
    	  	});
    		// 제품소개2 클릭했을시 hash전환
    		$(".midboxmid2").off().on("click", function(){
    			location.hash= "#introducelsr1";
    	  		htmlLoad();
    	  	});
    		// 제품소개3 클릭했을시 hash전환
    		$(".midboxmid3").off().on("click", function(){
    			location.hash= "#introducelsr2";
    	  		htmlLoad();
    	  	});
    		
//     		function createPaging(){
//     			var paging = totCnt/viewRow; 
//     			var end = (pageView * pageGroup); // 10 * 2 = 20 
//     			var start = (end - pageView); // 20 - 10 = 10
    			
//     			if(paging < end){
//     				end = paging;
//     			}
    			
//     			//전체 행 / 보여줄행 --> 페이지 수 
//     			$(".paging").empty(); // div 태그 속에 a 태그를 초기화 한다.
//     			var k = 0; // 소연이 보아라... 너무 힘들었도다... 어쩔... :( ★★
//     						//   :)  good
    			
//     			if(end > pageView){
//     				$(".paging").append('<a class="select" href="#' + ((start+1) - pageView) + '">이전페이지</a>');
//     				k = 1;
//     			}
    			
//     			for(var i = start; i < end; i++){
//     				$(".paging").append("<a href='#" + (i + 1) + "'>" + (i + 1) + "</a>");
//     				if(page == (i + 1)){
//     					$(".paging a").eq(k).addClass("chk");
//     				}
//     				k++;
//     			}
    			
//     			if(end >= pageView && paging > end){
//     				$(".paging").append('<a href="#' + (end + 1) + '">다음페이지</a>');
//     			}
    			
    			
//     			$(".paging a").off().on("click", function(){ //페이지 전환 이벤트를 작성 
//     				page = $(this).text();
//     				if(page == "다음페이지"){
//     					page = (pageGroup * pageView) + 1; 
//     					pageGroup++;
//     				}else if(page == "이전페이지"){
//     					page = (pageGroup * pageView) + 1;
//     					pageGroup--;
//     				}
//     				setTimeout(function(){
//     					initData(); // 디비에서 데이터 다시 가져 오기 위하여 함수 호출
//     				}, 100); // 0.1초 후에 실행 하기 위하여 setTimeout() 함수를 실행한다.
//     			});
//     		}
        	
        	function initData(){ //디비안에 있는 데이터 가져오기 
//     			var hash = location.hash; // a 태그의 이벤트로 발생한 hash 값을 가져온다.
//     			if(hash != ""){ // hash 값이 있을 경우 page 변수의 값으로 사용한다.
//     				page = hash.substr(1, hash.length);
//     				pageGroup = Math.ceil(page / pageView);
//     			}
    						
//     			var end = (viewRow * page); // 10 * 2 = 20 
//     			var start = (end - viewRow); // 20 - 10 = 10
    	
    			$.ajax({
    					type:"post", // post 방식으로 통신 요청
    					url:"listData", // Spring에서 만든 URL 호출
    					dataType :"json",
    					data:{"start":0, "viewRow":viewRow} // 파라메터로 사용할 변수 값 객체 넣기
    			}).done(function(result){ // 비동기식 데이터 가져오기
    				data = result.data; // JSON으로 받은 데이터를 사용하기 위하여 전역변수인 data에 값으로 넣기
//     				console.log(data);
//     				totCnt = result.totCnt.tot;
    				init(result.data);
//     				createPaging(); // 페이지 링크 표현하기 
    			});
        	}
        	
        	function showSlides() {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("dot");
                for (i = 0; i < slides.length; i++) {
                   slides[i].style.display = "none";  
                }
                slideIndex++;
                if (slideIndex > slides.length) {slideIndex = 1}    
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex-1].style.display = "block";  
                dots[slideIndex-1].className += " active";
                setTimeout(showSlides, 4000); // Change image every 2 seconds
            }
        	
        	
    		function init(data){
    				$("tbody").empty();
    				for(var i = 0; i < data.length; i++){
    				 	html = "<tr>"
    					html += '<td><a href="Detail?Qno=' + data[i].Qno + '">' + data[i].Qtitle + '</a></td>';
    					html += '</td>';
    					html += '</tr>'; 
    					$("tbody").append(html);
    				}

    				 if(data.length < 1){
    			           	var tag = "<tr class='list-text2'>"; 
    			   		    tag += "<td>데이터가 없습니다.</td>";
    			   		    tag += "</tr>";
    			           	$("tbody").append(tag);
    			    } 
    		}
    		
    		function createHtml1(){
  		      
  		      $(".form").empty();
  		      for(var i = 0; i<data.length; i++){
  		         tag = '<div class="listimgbox1">'+
  							'<img src="'+data[i].picPath+data[i].picName+ '">'+
  						'</div>'
  				$(".form").append(tag);
  		    }

  		    //클릭한 게시글을 찾아 자세히 보기 하기위하여 ajax 사용
  		      $(".listimgbox1").off();
  		      $(".listimgbox1").on("click",function(){
  		         var index = $(".listimgbox1").index(this);
  		         var newsNo = data[index].no;
  		         location.href = "detail1?newsNo=" + newsNo;
  		      });
  		         
  		   }
  		   
  		   function initData1(){ // 디비에서 데이터 가져오기 위한 함수
  		      var viewRow = 5;
  		      var hash = location.hash; // a 태그의 이벤트로 발생한 hash 값을 가져온다.
  		      if(hash != ""){ // hash 값이 있을 경우 page 변수의 값으로 사용한다.
  		         page = hash.substr(1, hash.length);
  		      }      
  		         
  		      var end = (viewRow * page); // 10 * 2 = 20 
  		      var start = (end - viewRow); // 20 - 10 = 10
  		      
  		      $.ajax({
  		            type:"post", 
  		            url:"newsData", // Spring에서 만든 URL 호출
  		            data:{"start":0, "viewRow":viewRow} // 파라메터로 사용할 변수 값 객체 넣기
  		      }).done(function(d){ // 비동기식 데이터 가져오기
  		         var result = JSON.parse(d);
  		         data = result.list;
//   		         totCnt = result.totCnt.tot;
  		         
  		         createHtml1(); // 화면에 표현하기 위하여 함수 호출

  		      });
  		   }
    		initData();
    		initData1();
    		showSlides();
        });
        </script>
        <style type="text/css">
			td A:link {text-decoration:none; color:#000000;}
			td A:visited {text-decoration:none; color:#000000;}
			td A:active {text-decoration:none; color:#000000;}
			td A:hover {text-decoration:none; color:#ff3f3f;}

			.eventsbox img {
				border : 0;
			}
			.eventsbox img:hover {
			opacity:0.2;
			filter:alpha(opacity=80);
			}
		</style>

    </head>
    
    <body>
        <!--중간미드부분1--> 
        <div class="slideshow-container">
            <div class="mySlides fade">
              <img src="resources/img/main1.JPG" style="width:1903px">
            </div>

            <div class="mySlides fade">
              <img src="resources/img/main2.JPG" style="width:1903px">
            </div>

            <div class="mySlides fade">
              <img src="resources/img/main3.JPG" style="width:1903px">
            </div>
        </div>

        <div style="text-align:center;display:none;">
          <span class="dot" onclick="currentSlide(0)"></span> 
          <span class="dot" onclick="currentSlide(1)"></span> 
          <span class="dot" onclick="currentSlide(2)"></span> 
        </div>
        
        <!--중간미드부분2-->
        <div class="mainmidbox2">
            <div class="centerbox">
                <div class="midbox1">
                    <div class="clear-midbox1"></div>
                    <div class="midbox1-1">
                        <div class="midboxtop-1">
                            <p>공지사항</p>
                        </div>
                        <div class="qnaboxx">
                            
                        </div>
                        <div class="mid">
                            <table class="qpsysub_news" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td><a href="#num"></a></td>
                                        <td></td>
                                        <td class="name"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="clear-midbox1"></div>
                    <div class="midbox1-2">
                        <div class="midboxtop-1">
                            <p>EXECO - 엑세코실업 rico Intro</p>
                        </div>
                        <div class="videobox">
                            <iframe width="318" height="180" src="//player.vimeo.com/video/116044275" frameborder="0" allowfullscreen="" webkitallowfullscreen="" mozallowfullscreen=""></iframe>
                        </div>
                    </div>
                    <div class="clear-midbox1"></div>
                    <div class="midbox1-3">
                        <div class="midboxtop-1">
                            <p>고객센터</p>
                        </div>
                        <div class="customimg">
                            <img src="resources/img/customcenterimg.JPG">
                        </div>
                    </div>
                    <div class="clear-midbox1"></div>
                </div>
                <div class="midbox2">
                    
                </div>
                <div class="midbox3">
                    <div class="clear-midbox2"></div>
                    <div class="midbox3-1">
                        <div class="midboxtop-2">
                            <p>제품소개</p>
                        </div>
                        <div class="midboxmid1">
                            <a href="javascript:void(0)"><img src="resources/img/mainlsrimg.JPG"></a>
                        </div>
                        <div class="midboxmid2">
                            <a href="javascript:void(0)"><img src="resources/img/mainsensorsimg.JPG"></a>
                        </div>
                        <div class="midboxmid3">
                            <a href="javascript:void(0)"><img src="resources/img/mainsolutionimg.JPG"></a>
                        </div>
                    </div>
                    <div class="clear-midbox2"></div>
                    <div class="midbox3-2">
                        <div class="midboxtop-2">
                            <p>자료실</p>
                        </div>
                        <div class="eventsbox">
                        	<div class="form">
                       			
                   			</div>
                        </div>
                    </div>
                    <div class="clear-midbox2"></div>
                </div>
            </div>
        </div>
        <!--미드부분종료-->
    </body>
</html>
