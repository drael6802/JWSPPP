<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드 리스트</title>

<script type="text/javascript" src="../js/cart_list.js?ver=26" ></script>

<style type="text/css">
	#cartDiv{max-width:1200px; min-width 1000px; font-size: large; font-family: 'KOMACON';}
	#cartDiv table {
		width: 100%;
		border-left: none;
		border-right: none;
		text-align: center;
	}
	#cartDiv td {
		border-bottom: none;
		border-top: none;
		border-left: none;
		border-right: none;
		padding: 7px;
	
	}
	#cartDiv th {
		border-left: none;
		border-right: none;
		border-top: none;
		height: 35px;
		text-align: center;
	}
	
	#cartDiv img {padding: 5px;}
	
	button {
		border: 1px solid;
		background: none;
	}
	input[type="button"] {border: 1px solid; background: none; padding: 2px;}
	
	input[id="itemCount"] {width: 50px; text-align: center; border: 1px solid; line-height: 27px;}

	input[type="checkbox"] {display: none;}
	input[type="checkbox"]+em{
		display:inline-block;
		width: 26px;
		height: 26px;
		background: url("img/chbox_img.png") 0 0 no-repeat;
		vertical-align: middle;
		margin: 5px;
	}
	input[type="checkbox"]:checked + em {
		background-position: -28px;
	}
	.price {text-align: right; padding-right: 15px;}
</style>

</head>
<body>
<div style="height: 30px;"></div>
<div id="cartDiv" align="center" >
	<div align="left">
		<label style="margin-left: 25px;">
		<input id="checkAll" type="checkbox"/>
		<em></em>
		전체선택
		</label>

		<button id="ckDelBtn">선택삭제</button>
	
	</div>
		<table border="1">
			<tr>
				<th colspan="6"></th>
				<th width="150px">주문 금액</th>
				<th width="100px">할인율</th>
			</tr>
			<c:choose>
				<c:when test="${empty cartList }">
					<tr>
						<td colspan="9" align="center">장바구니에 상품이 없습니다.</td>
					</tr>			
				</c:when>
				<c:otherwise>
					<c:forEach items="${cartList }" var="cartVO">
						<tr>
							<td>
								<label style="margin-left: 10px;">
									<input class="ckBox" type="checkbox" data-cartCode="${cartVO.cartCode }" data-itemCode="${cartVO.itemCode }">
									<em></em>
								</label>
							</td>
							<td>							
								<a href="itemInfo.do?itemCode=${cartVO.itemCode }">
									<img alt="" src="../img/${cartVO.itemThumbnail }" style="width: 100px; height: 100px;">
								</a>
							</td>
							<td>${cartVO.itemName }</td>
							<td>${cartVO.options }</td>
							<td>							
								<input type="number" class="itemCount" id="itemCount" value="${cartVO.itemCount }" min="1" max="${cartVO.itemInventory }" data-itemPrice="${cartVO.itemPrice }" />
								<input type="button" class="countUpateBtn" value="변경" data-cartCode="${cartVO.cartCode }" data-userId="${userInfo.userId }"/>
							</td>
							<td class="price">${cartVO.itemPrice }원</td>
							
							<td class="price">
								<div id="itemPrice" class="afterPrice" >${cartVO.itemPrice * cartVO.itemCount }</div>원
							</td>
							<td>${cartVO.itemDiscount }%</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	</table>
	
	<div style="height: 10px;"></div>
	<div align="right" style="font-size: x-large;">
		주문 금액 :
		<div  id="totalPrice">
		 ${totalPrice }원
		</div>
			<button id="buyBtn" style="margin: 10px;">구매하기</button>
	</div>
	
</div>
</body>
</html>