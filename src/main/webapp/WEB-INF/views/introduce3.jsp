<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>
        엑세코실업 [EXECO]
    </title>
	<head>
        <link rel ="stylesheet" href ="resources/css/main.css">
        <link rel = "stylesheet" href ="resources/css/introduce3.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- <script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script> -->
        <script>
        	$(document).ready(function(){
        		new daum.roughmap.Lander({
        			"timestamp" : "1515459018798",
        			"key" : "m9su",
        			"mapWidth" : "600",
        			"mapHeight" : "300"
        		}).render();
        	});
        </script>
    </head>

    <body>
	 <!--중간미드부분-->
        <div class="introducebody3">
            <div class="introduceimg">
                <img src="resources/img/introduce1.JPG">
            </div>
            <div class="introduce1">
                <h1>오시는길</h1>
            </div>
            <div class="introduce2">
                <div class="daumapi">
                    <!-- * Daum 지도 - 지도퍼가기 -->
					<div id="daumRoughmapContainer1515459018798" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                </div>
            </div>
            <div class="introduce3">
                
            </div>
            <div class="introduce4">
                <img src="resources/img/introduce4.png">
            </div>
            <div class="introduce5">
                
            </div>
        </div>
        <!--중간미드종료-->
    </body>
</html>