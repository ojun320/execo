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
        <link rel="stylesheet" href="resources/css/customer.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript">
		$(document).ready(function(){
//----------------------------------------------- 작성버튼 클릭시 부분전환-------------------------------------------------------------
		     $(".loginButton1").off().on("click",function(){
	               hash = "#Write1";
	               htmlLoad();
	            });
	            
	            function htmlLoad(){
	                 var url = hash.substr(1, hash.length)
	                 $("section").load(url);
	              }
//------------------------------------------------------------------------------------------------------------------------------
		   var data = [];      
		   var viewRow = 6;   
		   var tag = "";
		   var tag1= "";
		   var page = 1;
		   var totCnt = 0;
		   var user = {};
		   
			
		   $.ajax({
	            url:"LoginCheck",
	            data:data,
	            datatype:"json",
	            type:"post"
	            }).done(function(result){         
	            data = result.list;
	            checkid = result.user.data.id;
	            console.log(checkid);
	            if(checkid == "admin"){
	            	$(".loginButton1").show();
	            }else{
	            	$(".loginButton1").hide();
	            }    
	         });
		   
		   function createHtml(){ // ul(부모) 태그 속에 li(자식) 태그 넣기 위한 함수
		      
		      $(".form").empty(); // ul 태그의 자식들를 초기화가 필요하다.
		      for(var i = 0; i<data.length; i++){
		         tag =  '<div class="listimgbox">'+
						      	'<img src="'+data[i].picPath+data[i].picName+ '">'+
						      '</div>'+
						      '<div class="listtextbox">'+
						      	'<hr>'+
							      '<div class="text-form0">'+
										'<div class="label2">제목 :</div>'+
										'<div class="data_title">'+
										'<span>'+
											data[i].title.substring(0,50)+
											'</span>'+
										'</div>'+  
								  '<div class="listday">'+
										'<div class="data_days">'+
											data[i].days+
										'</div>'+
								  '</div>'+
							  '</div>'+
							  '<hr>'+
								'<div class="text-form">'+
									'<span class="p2">'+data[i].contents.substring(0,150)+'</span>'+
								'</div>'+
							  '</div>';
					     $(".form").append(tag);
		      }
		      
		      
		      //-----------------------------------------------------------------------------------------------------------------
		      //-----------------------------------------------------------------------------------------------------------------
		      var ea = totCnt + "건";
		      $("#paginationTotalCnt").empty();
		      $("#paginationTotalCnt").append(ea);
		      
		      
		    //클릭한 게시글을 찾아 자세히 보기 하기위하여 ajax 사용
		      $(".listimgbox").off();
		      $(".listimgbox").on("click",function(){
		         var index = $(".listimgbox").index(this);
		         var newsNo = data[index].no;
		         location.href = "detail1?newsNo=" + newsNo;
		      });
		         
		   }
		   function createPaging(){
		      
		      var paging = totCnt / viewRow;
		      // 전체의 행의 수에서 보여줄 행을 나누면 페이지의 갯수를 알 수 있다.
		      $(".page").empty(); // div 태그 속에 a 태그를 초기화 한다.
		      for(var i = 0; i < paging; i++){
		         $(".page").append("<a href='#" + (i + 1) + "'>" + (i + 1) + "</a>")
		      }      
		      
		      $(".page a").eq(page - 1).addClass("bg"); 
		      
		      $(".page a").off().on("click", function(){ // 페이지 전환 이벤트를 작성 한다.
		            // a 태그 중에 몇번째 페이지인지 알면 리스트 화면를 다시 보여 줄 수 있다. page 변수 활용 할것!
		            page = $(this).text(); // 선택한 페이지의 text 추출
		            
		            var a = page+"page";
		          $("#paginationCurrentPage").empty();
		          if($("#paginationCurrentPage").text()==null){
		             $("#paginationCurrentPage").text("1page");
		          }else{
		             $("#paginationCurrentPage").append(a);
		          }
		            setTimeout(function(){ 
		               initData(); // 디비에서 데이터 다시 가져 오기 위하여 함수 호출
		            }, 100); // 타이머가 완료된 뒤 지정 함수가 실행 됨
		         });
		      
		   }
		   
		   function initData(){ // 디비에서 데이터 가져오기 위한 함수
		      
		      var hash = location.hash; // a 태그의 이벤트로 발생한 hash 값을 가져온다.
		      if(hash != ""){ // hash 값이 있을 경우 page 변수의 값으로 사용한다.
// 		    	  	console.log("hash : " ,hash);
		      		if(hash == "#customer"){
		      			page = 1;
		      		}else{
		      			page = hash.substr(1, location.hash.length);
		      		}
// 		      		console.log("page : " ,page);
		      }      
		         
		      var end = (viewRow * page); // 10 * 2 = 20 
		      var start = (end - viewRow); // 20 - 10 = 10
		      
		      $.ajax({
		            type:"post", 
		            url:"newsData", // Spring에서 만든 URL 호출
 		            data:{"start":start, "viewRow":viewRow} // 파라메터로 사용할 변수 값 객체 넣기
		      }).done(function(d){ // 비동기식 데이터 가져오기
		         var result = JSON.parse(d);
		         data = result.list;
		         totCnt = result.totCnt.tot;
		         
		         createHtml(); // 화면에 표현하기 위하여 함수 호출
		         
		         createPaging(); // 페이지 링크 표현하기 우하여 함수 호출
		      })
		   }
		   initData();
		});
		</script>
    </head>
    <body>
        <!--중간미드부분-->
        <div class="customerbody">
            <div class="customermenuimg">
                <img src="resources/img/customermenuimg.JPG">
            </div>
            <div class="customertxt">
                <h1>자료실</h1>
            </div>
            
            
            
            <div class="customerbox">
                   <div class="bod-count">
			                        총 게시물 : <strong id="paginationTotalCnt"> </strong> / 페이지 :  <span id="paginationCurrentPage"> </span>
                   </div>
                   
                   <div class="form">
                       
                   </div>
                   
                   <hr>
                   <div class="page">
                       
                   </div>
            </div>
            
            
            
            
            <div class="customerbtn">
                <a href="#"><input class="loginButton1" type="submit" value="작성"/></a>
            </div>
        </div>
        <!--중간미드종료-->
    </body>
</html>