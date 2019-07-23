<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 스프링 테스트  </title>
</head>
<body>


<div align="center">
<table border="1">
	<tr>
		<td>ITEM_NUM</td>
		<td>ITEM_NAME</td>
		<td>ITEM_PRICE</td>
		<td>ITEM_AMOUNT</td>
	</tr>
	<c:forEach items="${list}" var="item">
	<tr>
		<td>${item.itemNum }</td>
		<td>${item.itemName }</td>
		<td>${item.itemPrice }</td>
		<td>${item.itemAmount }</td>
	</tr>
	</c:forEach>
</table>

<button type="button" onclick="location.href='jsp/testInsert.jsp'">추가</button>
</div>





</body>
</html>