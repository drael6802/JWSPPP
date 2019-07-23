<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이템 기본 리스트</title>

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
<!--검색 메뉴  -->
<!-- <div>
	<form action="">
		<input type="search" >
		<input type="submit" value="검색">
	</form>
</div> -->

<div align="center">
	<div>
		<h1>${CategoryName }</h1>
	</div>
	<table class="blueone" >
		<c:choose>
			<c:when test="${empty itemList }" >
				<tr>
					<td colspan="4">
						<a style="text-align: center;">등록 상품이 없습니다.</a>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:set var="i" value="0" />
				<c:set var="j" value="4" />
				<c:forEach items="${itemList }" var="list">
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
<!-- 페이징처리 -->
	<div align="center">
		<div style="height: 20px;"></div>
			<c:forEach begin="1" end="${totalPage }" var="page">
				<c:choose>
					<c:when test="${itemVO.category03Code ne 0 }">
						<a href="itemMenuCategory.do?pageIndex=${page }&category03Code=${itemVO.category03Code }" style=" color: #ed6161;">
							<c:if test="${pageIndex eq page}">
								<b style="font-size:xx-large; ">${page }</b>
							</c:if>
							<c:if test="${pageIndex ne page}">
								${page }
							</c:if>	
						</a>
					</c:when>
					<c:when test="${itemVO.categoryCode ne 0 }">
						<a href="itemMenuCategory.do?pageIndex=${page }&categoryCode=${itemVO.categoryCode }" style=" color: #ed6161;">
							<c:if test="${pageIndex eq page}">
								<b style="font-size:xx-large; ">${page }</b>
							</c:if>
							<c:if test="${pageIndex ne page}">
								${page }
							</c:if>	
						</a>
					</c:when>
					<c:otherwise>
						<a href="itemMenuCategory.do?pageIndex=${page }" style=" color: #ed6161;">
							<c:if test="${pageIndex eq page}">
								<b style="font-size:xx-large; ">${page }</b>
							</c:if>
							<c:if test="${pageIndex ne page}">
								${page }
							</c:if>	
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		<div style="height: 20px;"></div>
	</div>
<div style="height: 30px;">

</div>
</body>
</html>