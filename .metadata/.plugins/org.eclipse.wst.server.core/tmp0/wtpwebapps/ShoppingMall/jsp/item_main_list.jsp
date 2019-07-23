<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트 페이지</title>

<style type="text/css">
div {
	align-content: center;
}
.blueone {
  	border-collapse: collapse;
}  
.blueone td {
 	color: #669;
	border-bottom: 1px solid #ddd;
 	width: 300px;
	text-align: center;
}
.blueone td:hover {
	border: 1px solid #ddd;
	color: red;
	font-size: large;
}

img:hover {
	opacity: 0.7;

}
.blueone tr {
	height: 400px;
}

</style>

</head>
<body>
<!--  -->
<div align="center">
	<div>
		<h1>베스트 상품</h1>
	</div>
	<table class="blueone" >
		<c:choose>
			<c:when test="${empty itemBestList}" >
				<tr>
					<td colspan="4">
						<a style="text-align: center;">등록 상품이 없습니다.</a>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:set var="i" value="0" />
				<c:set var="j" value="4" />
				<c:forEach items="${itemBestList }" var="list">
					<c:if test="${i%j eq 0 }">
						<tr>
					</c:if>
						<td>
							<fieldset>
								<img src="${pageContext.request.contextPath}/img/${list.itemThumbnail}" onclick="location.href='itemInfo.do?itemCode=${list.itemCode }'" style="width: 80%; height: 90%;">
								<div><label>${list.itemName }</label></div>
								<div><label>${list.itemPrice }원</label></div>
							</fieldset>
						</td>
					<c:if test="${i%j eq j-1 }">
						</tr>
					</c:if>
					<c:set var="i" value="${i+1 }" />
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<div style="height: 50px;"></div>
<!--  -->
<hr>
<!--  -->
<div align="center">
	<div>
		<h1>새로운 상품</h1>
	</div>
	<table class="blueone" >
		<c:choose>
			<c:when test="${empty itemNewList }" >
				<tr>
					<td colspan="4">
						<a style="text-align: center;">등록 상품이 없습니다.</a>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:set var="i" value="0" />
				<c:set var="j" value="4" />
				<c:forEach items="${itemNewList }" var="list">
					<c:if test="${i%j eq 0 }">
						<tr>
					</c:if>
						<td>
							<fieldset>
								<img src="${pageContext.request.contextPath}/img/${list.itemThumbnail}" onclick="location.href='itemInfo.do?itemCode=${list.itemCode }'" style="width: 80%; height: 90%;">
								<div><label>${list.itemName }</label></div>
								<div><label>${list.itemPrice }원</label></div>
							</fieldset>
						</td>
					<c:if test="${i%j eq j-1 }">
						</tr>
					</c:if>
					<c:set var="i" value="${i+1 }" />
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<div style="height: 50px;"></div>
<!--  -->
<div style="height: 50px;"></div>
<!--  -->
</body>
</html>