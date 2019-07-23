<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이템 관리</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="../js/item_manager.js?ver=15"></script>
</head>
<body>

<table border="1">
	<tr>
		<td>썸네일</td>
		<td>이름</td>
		<td>가격</td>
		<td>재고</td>
		<td>판매량</td>
		<td>할인</td>
		<td>조회수</td>
		<td></td>
	</tr>
	<c:forEach items="${list }" var="list">
		<tr>
			<td><img alt="" src="../img/${list.itemThumbnail }" style="width: 25px; height: 25px;"></td>
			<td><label class="opener" id="" data-itemPrice="${list.itemPrice }" data-itemInventory="${list.itemInventory }" data-itemDiscount="${list.itemDiscount }"  data-itemCode="${list.itemCode }" >${list.itemName }</label></td>
			<td>${list.itemPrice }</td>
			<td>${list.itemInventory }</td>
			<td>${list.itemSales }</td>
			<td>${list.itemDiscount }</td>
			<td>${list.itemView }</td>
			<td><input type="button" value="삭제" class="delBtn"  data-itemCode="${list.itemCode }"></td>
		</tr>
	</c:forEach>
</table>
<!-- 페이징처리 -->
<div align="center">
	<div style="height: 20px;"></div>
	<c:forEach begin="1" end="${totalPage }" var="page">
		<a href="itemManager.do?pageIndex=${page }">${page }</a>
	</c:forEach>
	<div style="height: 20px;"></div>
</div>

<div id="dialog" title="상품 변경">
	<div align="center">
		<input type="hidden" id="itemCode" value="">
		<label id="itemName"></label>
		<table>
		  <tr>
		    <td>가격</td>
		    <td><input type="text" id="itemPrice" value=""></td>
		  </tr>
		  <tr>
		    <td>재고</td>
		    <td><input type="text" id="itemInventory" value=""></td>
		  </tr>
		  <tr>
		    <td>할인</td>
		    <td><input type="text" id="itemDiscount" value=""></td>
		  </tr>
		</table>
		<input type="button" id="updateBtn" value="변경">
	</div>
</div>
 
</body>
</html>