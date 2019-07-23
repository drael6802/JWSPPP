<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빨간맛</title>
<style type="text/css">
	@font-face {
		font-family: 'KOMACON';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')format('woff');
		font-weight: normal;
		font-style: normal;
	}
	@font-face {
		font-family: 'Binggrae-Bold';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
</style>
</head>
<body>
	<!--메인 DIV  -->
	<div align="center">
		<!-- 상단 -->
		<div style="">
			<jsp:include page="menu_top.jsp"></jsp:include><br>
			<jsp:include page="menu_search.jsp"></jsp:include>
			<jsp:include page="menu_main.jsp"></jsp:include>
		</div>
		<!--오른쪽 고정 배너  -->
		<div>
			<jsp:include page="banner_right.jsp"></jsp:include>
		</div>
		<!-- 중앙 -->
		<c:choose>
			<c:when test="${main == 'main' }">
				<div align="center">
					<!--배너 -->
					<div style="width: 1000px">
						<jsp:include page="banner_poto.jsp"></jsp:include>
					</div>
					<!--메인 상품 뷰 페이지  -->
					<div>
						<jsp:include page="${viewPage }"></jsp:include>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<!--메인 상품 뷰 페이지  -->
				<div>
					<jsp:include page="${viewPage }"></jsp:include>
				</div>
			</c:otherwise>
		</c:choose>
		<!--하단  -->
		<div>
			<jsp:include page="bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>