<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종합 출력 리스트</title>
<style type="text/css">
   .menu table {
      margin: 5px auto;
      font-size: 15px;
      width: 98%;
   }
   .menu th {
      border-bottom: 1px solid;
      text-align: center;
      font-family: 'Binggrae-Bold';
      font-size: 18px;
      padding-top: 10px;
      height: 55px;
   }
   .menu td {font-family: 'KOMACON';}
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

   span[class="title"] + div {height: 840px;}
</style>
</head>
<body>
<div class="menu">
	<c:choose>
		<c:when test="${buyList ne null }">
					<span class="title" onclick="location.href='buyListInfo.do'">최근 주문 내역</span>
			
					<div style=" height : 800px; overflow: auto;">
						<c:choose>
							<c:when test="${empty buyList }">
								<div>
									<span style="position: relative; top: 100px;">
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
						<!-- 페이징처리 -->
						<div align="center">
							<c:forEach begin="1" end="${totalPage }" var="page">
								<a href="buyListInfo.do?pageIndex=${page }" style=" color: #ed6161;">
								<c:if test="${pageIndex eq page}">
									<b style="font-size:xx-large; ">${page }</b>
								</c:if>
								<c:if test="${pageIndex ne page}">
									${page }
								</c:if>	
								</a>
							</c:forEach>
						</div>
					</div>
			</c:when>
		<c:when test="${likeList ne null }">
			<span class="title"  onclick="location.href='likeListInfo.do'">내가 찜한 상품</span>
				<c:choose>
					<c:when test="${empty likeList }">
						<div>
							<span style="position: relative; top: 100px;">
								아직 찜한 상품이 없어요! <a href="#">상품 찜하러 가기</a>
							</span>
						</div>
					</c:when>
					<c:otherwise>
						<div>
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
							<!-- 페이징처리 -->
							<div align="center">
								<c:forEach begin="1" end="${totalPage }" var="page">
									<a href="likeListInfo.do?pageIndex=${page }" style=" color: #ed6161;">
										<c:if test="${pageIndex eq page}">
											<b style="font-size:xx-large; ">${page }</b>
										</c:if>
										<c:if test="${pageIndex ne page}">
											${page }
										</c:if>	
									</a>
								</c:forEach>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			
		</c:when>
		<c:when test="${boardList ne null }">
				<div class="menu"  >
					<span class="title" onclick="location.href='reviewListInfo.do'" >내가 쓴 리뷰</span>
					<div>
						<table>
							<tr style="height: 20px;">
								<th width="120px">상품명</th>
								<th width="110px">리뷰</th>
								<th width="100px">별점</th>
								<th width="90px"></th>
							</tr>
								<c:forEach items="${boardList }" var="boardList">
									<tr>
										<td><label style="font-size: small;">${boardList.itemName  }</label></td>
										<td>${boardList.boardContent  }</td>
										<td>
											${boardList.boardTitle  }
											&nbsp;&nbsp;&nbsp;&nbsp;
											<span>
												<c:forEach begin="1" end="5" varStatus="status">
													<c:choose>
														<c:when test="${boardList.boardScore >= status.index }">
															<img alt="" src="img/star_notEmpty.png" width="15px" height="15px"/>							
														</c:when>
														<c:otherwise>
															<img alt="" src="img/star_empty.png" width="15px" height="15px"/>							
														</c:otherwise>
													</c:choose>
												</c:forEach>										
											</span>
										</td>
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
						<!-- 페이징처리 -->
						<div align="center">
							<div style="height: 20px;"></div>
							<c:forEach begin="1" end="${totalPage }" var="page">
								<a href="reviewListInfo.do?pageIndex=${page }">${page }</a>
							</c:forEach>
							<div style="height: 20px;"></div>
						</div>
					</div>
				</div>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>