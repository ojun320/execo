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
        <link rel = "stylesheet" href ="resources/css/introduce3.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>

    <body>
	 <!--중간미드부분-->
        <div class="introducebody3">
            <div class="introduceimg">
                <img src="/web/resources/img/introduce1.JPG">
            </div>
            <div class="introduce1">
                <h1>오시는길</h1>
            </div>
            <div class="introduce2">
                <div class="daumapi">
                    <!-- * Daum 지도 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1514268971754" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1514268971754",
		"key" : "m3q2",
		"mapWidth" : "600",
		"mapHeight" : "300"
	}).render();
</script>
                </div>
            </div>
            <div class="introduce3">
                
            </div>
            <div class="introduce4">
                <img src="/web/resources/img/introduce4.png">
            </div>
            <div class="introduce5">
                
            </div>
        </div>
        <!--중간미드종료-->
    </body>
</html>