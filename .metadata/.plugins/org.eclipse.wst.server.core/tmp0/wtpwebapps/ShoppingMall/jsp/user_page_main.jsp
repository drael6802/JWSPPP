<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/user_page_main.js?ver=4"></script>
<style type="text/css">
	.menu table {
		display: inline-block;
		margin: 5px auto;
		font-size: 15px;
	}
	.menu th {
		border-bottom: 1px solid;
		text-align: center;		
		font-family: 'Binggrae-Bold';
		font-size: 18px;
		padding-top: 10px;
		height: 55px;
	}
	.menu td {font-family: 'KOMACON'; text-align: left;}
	.menu tr {height: 60px;}
	
	.menu input {
		font-size: 13px;
		text-align: center;
		font-family: 'KOMACON';
	}
	
	.emptyList {
		text-align: center;		
		font-family: 'Binggrae-Bold';
		font-size: 20px;
	}
	.emptyList span {
		position: relative;
		top: 150px;
	}
	
	input[type="number"] {width: 35px;}
	input[type="submit"] {width: 40px; background: none;}
	input[type="button"] {
		width: 70px;
		background: none;
		border: 0.5px solid;
	}

	span[class="title"] + div {height: 365px;}
</style>
</head>
<body>
	<div class="menu">
		<span class="title" onclick="location.href='buyListInfo.do'">최근 주문 내역</span>

		<div>
			<c:choose>
				<c:when test="${empty buyList }">
					<div class="emptyList">
						<span>
							최근 구매한 상품이 없어요! <a href="#">인기 상품 보러가기</a>
						</span>
					</div>
				</c:when>
				<c:otherwise>
					<!-- 최근 구매한 상품이 있을경우 -->
					<table>
						<tr style="height: 20px;">
							<th width="50px"></th>
							<th width="160px;">상품명</th>
							<th width="90px">옵션</th>
							<th width="70px">가격</th>
							<th width="50px">수량</th>
							<th width="70px">총 가격</th>
							<th width="120px">주문일자</th>
							<th width="90px"></th>
						</tr>
						<c:forEach items="${buyList }" var="buyList">
							<tr>
								<td>
									<img alt="" src="../img/${buyList.itemThumbnail }" 
									style="width: 45px; height: 45px;">
								</td>
								<td><a href='itemInfo.do?itemCode=${buyList.itemCode }'>${buyList.itemName }</a></td>
								<td>${buyList.options }</td>
								<td>${buyList.itemPrice }원</td>
								<td>${buyList.itemCount }개</td>
								<td>${buyList.totalPrice }원</td>
								<td>${buyList.buyDate }</td>
								<td>
										<c:if test="${buyList.boardReviewState != 'Y' || buyList.boardReviewState == null }">
										<input type="button" value="리뷰쓰기" id="reviewInset" class="opener" 
											data-itemCode="${buyList.itemCode }" 
											data-itemPrice="${buyList.itemPrice }" 
											data-options="${buyList.options }" 
											data-itemCount="${buyList.itemCount }" 
											data-itemThumbnail="${buyList.itemThumbnail }" 
											data-itemName="${buyList.itemName }" 
											data-buyCode="${buyList.buyCode }" 
										/>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<div class="menu" style="width: 48%; float: left;  margin-left: 10px; margin-right: 10px;">
		<span class="title"  onclick="location.href='likeListInfo.do'">내가 찜한 상품</span>
		<div>
				<c:choose>
					<c:when test="${empty likeList }">
						<div class="emptyList">
							<span>
								아직 찜한 상품이 없어요!<br>
								<a href="templateMain.do">상품 찜하러 가기</a>
							</span>
						</div>
					</c:when>
					<c:otherwise>
						<table>
							<tr style="height: 20px;">
								<th width="50px"></th>
								<th width="160px;">상품명</th>
								<th width="70px">가격</th>
								<th width="90px"></th>
							</tr>
							<c:forEach items="${likeList }" var="likeList">
								<tr>
									<td>
										<img alt="" src="../img/${likeList.itemThumbnail }"  style="width: 45px; height: 45px;">
									</td>
									<td><a href='itemInfo.do?itemCode=${likeList.itemCode }' >${likeList.itemName }</a></td>
									<td>${likeList.itemPrice }원</td>
									<td>
										<input type="button" class="likeDelBtn" value="삭제하기" data-itemCode="${likeList.itemCode }" />
									</td>
								</tr>
						</c:forEach>
						</table>
							<a href="likeListInfo.do" style="">더 보기</a>
					</c:otherwise> 
				</c:choose>
		</div>
	</div>
	
	<div class="menu" style="width: 48%; float: left;">
		<span class="title" onclick="location.href='reviewListInfo.do'" >내가 쓴 리뷰</span>
		<c:choose>
			<c:when test="${empty boardList }">
				<div class="emptyList">
					<span>
						최근 작성한 리뷰가 없습니다.
					</span>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<table>
						<tr style="height: 20px;">
							<th width="40px"></th>
							<th width="180px;">상품명</th>
							<th width="70px">점수</th>
							<th width="90px"></th>
							<th width="90px"></th>
						</tr>
						<c:forEach items="${boardList }" var="boardList">
							<tr>
								<td></td>
								<td><label style="font-size: small;">${boardList.itemName  }</label></td>
								<td>${boardList.boardTitle  }</td>
								<td>${boardList.boardScore  }</td>
								<td>
									<input type="button" id="reviewUpdate" class="opener" value="수정하기" 
										data-boardCode="${boardList.boardCode }" 
										data-boardTitle="${boardList.boardTitle }" 
										data-boardContent="${boardList.boardContent }" 
										data-boardScore="${boardList.boardScore }" 
										data-itemName="${boardList.itemName }" 
									/>
								</td>
							</tr>
						</c:forEach>
					</table>
					<a href="reviewListInfo.do" style="">더 보기</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>