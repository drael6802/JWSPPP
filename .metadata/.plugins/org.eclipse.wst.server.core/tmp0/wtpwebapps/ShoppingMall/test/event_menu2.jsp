<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>스크롤하면 상단 영역 고정</title>
	<!-- 제이쿼리 -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<!--제이쿼리 스크립트 경로 -->
	<script type="text/javascript" src="../js/event_menu.js"></script>
	<!--CSS속성  -->
	<link rel="stylesheet" href="../css/event_menu.css" >
	
<style media="screen">
* {
	margin: 0;
	padding: 0;
}

header {
	min-width: 300px;
	height: 80px;
	background-color: #F15B42;;
	font-size: 30px;
	color: white;
	position: relative;
}

header p {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translateX(-50%) translateY(-50%);
}

#dm_ul {
	min-width: 300px;
	background-color: #F15B42;;
	text-align: center;
}

.dropmenu ul ul {
	position: absolute;
	display: none;
	z-index: 2;
}

.dropmenu ul ul li {
	display: block;
	background-color: #F15B42;;
	color: white;
}

.dropmenu ul li {
	display: inline-block;
	margin-left: -5.5px;
}

.dropmenu ul li a {
	display: block;
	width: 150px;
	color: white;
	line-height: 43px;
	text-decoration: none;
}

.dropmenu ul li a:hover {
	background-color: #F15B42;;
	color: gray;
}
</style>

</head>
<body>
	<section>
		<div class="dropmenu">
			<ul id="dm_ul">
				<li><a href="templateMain.do">메인폼</a></li>
				<li><a href="#">상품1</a>
					<ul>
						<li><a href="dovinPage.do">도빈</a></li>
						<li><a href="jsp/ddmenu.jsp">ddmenu.html</a></li>
						<li><a href="">test3</a></li>
						<li><a href="">test4</a></li>
					</ul>
				</li>
				<li><a href="#">메뉴2</a>
					<ul>
						<li><a href="">test1</a></li>
						<li><a href="">test2</a></li>
						<li><a href="">test3</a></li>
						<li><a href="">test4</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</section>
</body>
</html>
