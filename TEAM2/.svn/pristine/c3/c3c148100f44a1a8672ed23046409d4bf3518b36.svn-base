<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이템 상세보기</title>
<script type="text/javascript" src="../js/item_info.js?ver=45"></script>

<!-- 탭메뉴 -->
<style type="text/css">	
	input[type="radio"] {
		display: none;
	}
	
	input[type="radio"]+label {
		display: inline-block;
		cursor: pointer;
		font-size: 20px;
		background: #F5BAAB;
		color: #F1EFEE;
		font-family: 'Binggrae-Bold';
		height: 40px;
		width: 100px;
		text-align: center;
		margin: 0px;
		padding: 0px;
		padding-top: 5px;
		margin-left: 5px;
		border-radius: 5px 5px 0px 0px;
	}
	
	input[type="radio"]:checked+label {
		background: #ed6161;
		color: #fff;
	}
	
	.conBox {
		display: none;
		width: 100%;
		margin: 0 auto;
		padding-bottom: 30px;
		border-top: 5px solid #ed6161;
		text-align: center;
	}
	
	input[id="btn01"]:checked ~ .con01 {display: block;}
	input[id="btn02"]:checked ~ .con02 {display: block;}

</style>

<style>
	#main {
		font-family: 'KOMACON';
		margin: auto;
	}
	
	#main .itemLeft {
		display: inline-block;
		float: left;
		width: 50%;
	}
	
	#main .itemRight {
		padding-left: 50px;
		margin-top: 50px;
		width: 50%;
		float: left;
		height: 500px;
	}
	
	.itemRight table {
		padding-left: 30px;
		font-size: large;
		width: 100%;
	}
	
	.itemRight tr {
		height: 40px;
	}
	
	.itemRight th {
		padding-left: 20px;
		padding-right: 30px;
	}
	
	.itemRight input {
		width: 60px;
		height: 25px;
		text-align: center;
		font-family: 'KOMACON';
	}
	
	.itemRight select {
		width: 100px;
		height: 25px;
		text-align: center;
		font-family: 'KOMACON';
	}
	
	.buttonDiv {margin-bottom: 50px;}
	
	.buttonDiv button {
		border: 1px solid;
		background: none;
		width: 165px;
		height: 45px;
		font-size: 20px;
		background: #ed6161;
		color: #fff;
		font-family: 'Binggrae-Bold';
	}
	
		#item_menu {
			display: block;
			border: 1;
		}
	
		input[type="checkbox"] {display: none;}
		input[id="likeBtn"] + em{
			display:inline-block;
			width: 80px;
			height: 80px;
			background: url("img/like.png") 0 0 no-repeat;
			vertical-align: middle;
		}
		input[id="likeBtn"]:checked + em {
			background-position: -90px;
		}
	</style>
	<style type="text/css">
		.content {
	/* 		border: 1px solid;
	 */		min-height: 100px;
			margin: 10px;
		}
		
		.emptyList {
			display: inline-block;
			width: 100%;
			position: relative;
			top: 35px;
			font-family: 'KOMACON';
			font-size: large;
		}
		
		.starAVG {
			float: right;
			margin-right: 20px;
			margin-bottom: 0px;
			padding-bottom: 0px;
			font-family: 'KOMACON';
		}
	
		.review {}
		.review p {}
		.review table {
			font-family: 'KOMACON';
			font-size: medium;
			margin: 10px;
			margin-top: 20px;
		}
		.review tr {height: 35px;}
		.review th {border-bottom: 1px solid; text-align: center;}

		.itemQnA {}
		.itemQnA button {
			border: 1px solid;
			font-size: 18px;
		}
</style>

<style type="text/css">	
	.show-on-scroll { visibility: hidden; }
	.show-on-scroll.shown { visibility: visible; }
	
	.upBtnDiv {
		float: right; 
		width: 200px; 
		position: fixed;
		top: 80%;
		right: 5px;
	}
	.upBtnDiv a {
		font-size: 20px;
		color: black;
		text-decoration: none;
	}
</style>

<!-- upBtn 일정 스크롤 이상 내려가야 나오게하는 js -->
<script type="text/javascript">
/* javascript */
window.addEventListener('scroll', function() {
  var el = document.querySelector('.show-on-scroll');
  
  if(window.scrollY >= 800) el.classList.add('shown');
  else el.classList.remove('shown');
});
</script>
<!-- 팝업 -->
<script type="text/javascript">
	function winPop(url, opts) {
		var popupName = opts.name || 'popup';
		var options = '';
		options += 'width=' + (opts.width ? opts.width : 200) + ', height=' + (opts.height ? opts.height : 200);
		options += opts.left && opts.width ? ', left=' + opts.left : ', left=' + ((screen.availWidth - opts.width) / 2);
		options += opts.top && opts.height ? ', top=' + opts.top : ', top=' + ((screen.availHeight - opts.height) / 2);
		options += opts.scrollbars ? ', scrollbars=' + opts.scrollbars : ', scrollbars=no';
		options += opts.resizable ? ', resizable=' + opts.resizable : ', resizable=no';
		console.log(popupName);
		window.open(url, popupName, options);
	}
</script>
</head>
<body>
	<div align="center" style="width: 1000px;">
		<input type="hidden" id="itemCode" value="${itemInfo.itemCode }">
		<input type="hidden" id="userId" value="${sessionScope.userInfo.userId}">
		<input type="hidden" id="itemInventory" value="${itemInfo.itemInventory }">
		<input type="hidden" id="itemcategory03Code" value="${itemInfo.category03Code }">
		<div id="main">

			<!-- 카테고리 -->
			<div align="left" style="font-size: medium;">
				<div style="height: 20px;"></div>
					<div id="categoryMenu">
					
					</div>
				<div style="height: 30px;"></div>
			</div>

			<!-- 상품 이미지 -->
			<div class="itemLeft">
				<img src="../img/${itemInfo.itemThumbnail }" id="itemThumbnail" data-itemThumbnail="${itemInfo.itemThumbnail }" style="width: 500px; height: 500px;">
			</div>
			<div class="itemRight">
				<table>
					<tr>
						<td>
							<!-- 상품 정보 -->
							<table>
								<tr>
									<td>
										<div style="padding-left: 10px; padding-right: 10px;">
											<div id="itemName" style="font-size: 28px;">${itemInfo.itemName }</div>
										</div>
									</td>
									<td rowspan="2">
										<label class="like">
											<input type="checkbox" id="likeBtn" />
											<em></em>
										</label>
									</td>
								</tr>
								<tr>
									<td style="padding-left: 10px;">
										<label>판매량${itemInfo.itemSales }</label>
										<label id="itemInventory" data-itemInventory="${itemInfo.itemInventory }">재고량${itemInfo.itemInventory }</label>
										<label>조회수${itemInfo.itemView }</label>
									</td>
								</tr>
							</table>
							<hr style="height: 1px; background-color: #585858;">
							<div>
								<table>
									<tr>
										<th>판매가</th>
										<td><label id="itemPrice">${itemInfo.itemPrice }</label>원</td>
									</tr>
									<tr>
										<th>할인판매가</th>
										<td>
											<div>
												<label id="itemDiscountPrice"> </label> 원 [<label
													id="itemDiscount">${itemInfo.itemDiscount }</label>%]
											</div>
										</td>
									</tr>
									<tr>
										<th>옵션선택</th>
										<td>
										<select id="optionSelect">
												<option>선택</option>
												<c:choose>
													<c:when test="${empty optionsVO }">
														<option>옵션 없음</option>
													</c:when>
													<c:otherwise>
														<option>${optionsVO.options01 }</option>
														<c:if test="${optionsVO.options02 != null }">
															<option>${optionsVO.options02 }</option>
														</c:if>
														<c:if test="${optionsVO.options03 != null }">
															<option>${optionsVO.options03 }</option>
														</c:if>
														<c:if test="${optionsVO.options04 != null }">
															<option>${optionsVO.options04 }</option>
														</c:if>
														<c:if test="${optionsVO.options05 != null }">
															<option>${optionsVO.options05 }</option>
														</c:if>
													</c:otherwise>
												</c:choose>
											</select>
										</td>
									</tr>
								</table>
								<form action="itemCart" method="post">
									<div align="center" id="finalSelect" style="overflow: auto; width: 100%; height: 170px;"></div>
								</form>
							</div>
						</td>
				</table>
				<!-- 버튼 -->
				<div class="buttonDiv">
					<!--<input type="button" id="buyBtn" value="바로구매" />
					<input type="button" id="cartBtn" value="장바구니" />
					<input type="button" id="" value="관심상품" />-->
					<button id="buyBtn">바로구매</button>
					<button id="cartBtn">장바구니</button>
				</div>
			</div>


			<div style="width: 100%; height: 100px;"></div>
		</div>

		<!-- 탭메뉴 -->
		<div class="tab_menu" align="left">
			<input type="radio" name="menubtn" id="btn01" checked/>
			<label for="btn01">상세보기</label> 
			<input type="radio" name="menubtn" id="btn02"/>
			<label for="btn02">리뷰</label>


			<span class="starAVG">
				평균 별점 : 
				<c:forEach begin="1" end="5" varStatus="status">
					<c:choose>
						<c:when test="${starAVG >= status.index }">
							<img alt="" src="img/star_notEmpty.png" width="15px" height="15px"/>							
						</c:when>
						<c:otherwise>
							<img alt="" src="img/star_empty.png" width="15px" height="15px"/>							
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${empty scoreAVG }">
						(0점/0명 참여)
					</c:when>
					<c:otherwise>
						(${scoreAVG }점/${reviewList.size() }명 참여)
					</c:otherwise>
				</c:choose>
			</span>


			<!-- 페이지1 -->
			<div class="conBox con01">
				<div style="height: 30px;"></div>
				<!-- 상품상세이미지 -->
				<div>
					<img alt="" src="../img/${itemInfo.itemImage }" style="width: 750px;">
				</div>
			</div>

			<!-- 리뷰 -->
			<div class="conBox con02 review">				
				
				<div class="content">
				
					<c:choose>
						<c:when test="${empty reviewList }">
							<div class="emptyList">
 								<span>등록된 상품후기가 없습니다! 고객님의 상품후기를 기다립니다~!</span>
 							</div>
						</c:when>
						<c:otherwise>
												
						<table style="margin: 10 auto; width: 100%;">
							<tr>
								<th width="80px">만족도</th>
								<th width="150px;">별점</th>
								<th>상품평</th>
								<th width="150px;">게시일</th>
							</tr>
							<c:forEach items="${reviewList }" var="review">
								<tr>
									<td>
										${review.boardTitle }
									</td>
									<td>
										<div style="display: inline;" class="starDiv">
											<c:forEach begin="1" end="5" varStatus="status">
												<c:choose>
													<c:when test="${review.boardScore >= status.index }">
														<img alt="" src="img/star_notEmpty.png" width="15px" height="15px"/>							
													</c:when>
													<c:otherwise>
														<img alt="" src="img/star_empty.png" width="15px" height="15px"/>							
													</c:otherwise>
												</c:choose>
											</c:forEach>										
										</div>
									</td>
									<td>
										<p>${review.boardContent }</p>			
									</td>
									<td>
										${review.boardDate }
									</td>
								</tr>
							</c:forEach>
						</table>
								
						</c:otherwise>
					</c:choose>

				</div>
			</div>

		</div>
	</div>
	<!-- 위로 올라가는버튼 -->
	<div class="upBtnDiv">
		<div class="show-on-scroll">
			<a href="#main">
				<img src="img/up_button.png" width="50px" height="50px">
				<br>TOP
			</a> 
		</div>
	</div>
	
	<div style="width: 100%; height: 150px;"></div>
</body>
</html>