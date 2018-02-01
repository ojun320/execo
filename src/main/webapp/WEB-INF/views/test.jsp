<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<title>
       	엑세코실업 [EXECO]
    </title>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel ="stylesheet" href ="resources/css/main.css">
	    <link rel="stylesheet" href="resources/css/customer2.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<script type ="text/javascript">
			$(document).ready(function(){ 
				
				
				function initData(){	    	
	    			$.ajax({
	    					type:"post",
	    					url:"listData",
	    					dataType :"json",
	    					data:{"start":0, "viewRow":viewRow}
	    			}).done(function(result){
	    				data = result.data;
	    				init(result.data);
	    			});
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
	  							'<a href="detail1?newsNo=" + newsNo><img src="'+data[i].picPath+data[i].picName+ '"></a>'+
	  						'</div>'
	  				$(".form").append(tag);
	  		    }

// 	  		      $(".listimgbox1").off();
// 	  		      $(".listimgbox1").on("click",function(){
// 	  		         var index = $(".listimgbox1").index(this);
// 	  		         var newsNo = data[index].no;
// 	  		         location.href = "detail1?newsNo=" + newsNo;
// 	  		      });
	  		         
// 	  		   }
	  		   
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
	  		         
	  		         createHtml1(); // 화면에 표현하기 위하여 함수 호출

	  		      });
	  		   }
	  		   
	    		initData();
	    		initData1();
	    		showSlides();
			});
		</script>
	
	</head>
	<body>
		<a href="mailto:ojun321@naver.com">메일 보내기</a>
	</body>
</html>