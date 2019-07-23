<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 게시판</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="../js/user_inquiry_board_list.js?ver=6"></script>

<style type="text/css">
	.menu table {
		margin: auto;
		font-size: 15px;
		width: 98%;
		text-align: center;
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
	
	.menu button {
		background: none;
		border: 1px solid;
		font-family: 'KOMACON';
	}

	.menu input {
		font-size: 13px;
		text-align: center;
		font-family: 'KOMACON';
	}
	.menu .insertBtnDiv {
		background: #ed6161;
		width: 150px;
		line-height: 40px;
		float: right;
		margin: 10px;
		border-radius: 5px;
	}
	.menu .deleteBtnDiv {
		background: #ed6161;
		width: 150px;
		line-height: 40px;
		float: right;
		margin: 10px;
		border: none;
		border-radius: 5px;
	}
	
	.BtnDiv button {
		font-size: 20px;
		font-family: 'Binggrae-Bold';
		border: none;
		background: none;
	}

	.BtnDiv a {
		font-size: 20px;
		font-family: 'Binggrae-Bold';
		color: black;
		text-decoration: none;
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
	
	
	.dialog {font-family: 'Binggrae-Bold';}
	.dialog input {width: 100%; padding: 3px;}
	.dialog table {width: 95%;}
	.dialog tr {padding: 5px; height: 40px;}
	.dialog th {text-align: center;}

	.updateDialog {}
	.updateDialog button {background: none; border: 1px solid; float: right; margin: 10px; margin-bottom: 0px;}

	.viewDialog input {border: none;}
	
</style>
</head>
<body>
<!-- boardCode
, itemCode
, boardTitle
, boardContent
, boardDate
, boardScore
, boardView
, boardPassword -->
<div class="menu">

	<span class="title" onclick="location.href='buyListInfo.do'">내가 한 질문</span>

	<div style=" height : 800px; overflow: auto;">

		<table>
			<tr>
				<th>
					<input type="checkbox" id="checkAll"/>
				</th>
				<th>제목</th>
				<th>내용</th>
				<th>날짜</th>
				<th></th>
			</tr>
				<c:choose>
					<c:when test="${empty inquiryBoardList }">
						<tr>
							<td colspan="3">
								<div class="emptyList">
									등록 된 문의사항이 없습니다.
								</div>
							</td>
						</tr>					
					</c:when>
					<c:otherwise>
						<c:forEach items="${inquiryBoardList }" var="inquiry">
							<tr>
								<td>
									<input type="checkbox" class="cbBox" value="${inquiry.boardCode }"/>
								</td>
								<td>
									${inquiry.boardTitle }
								</td>
								<td>
									${inquiry.boardContent }
								</td>
								<td>
									${inquiry.boardDate }
								</td>
								<td>			
									<c:choose>
										<c:when test="${empty inquiry.boardReply || inquiry.boardReply == ''}">
											<button class="updateOpener"
											data-boardTitle="${inquiry.boardTitle }"
											data-boardContent="${inquiry.boardContent }"
											data-boardCode="${inquiry.boardCode }"
											data-boardReply="${inquiry.boardReply }">
												수정하기
											</button>
										</c:when>
										<c:otherwise>
											<button class="viewOpener"
											data-boardTitle="${inquiry.boardTitle }"
											data-boardContent="${inquiry.boardContent }"
											data-boardCode="${inquiry.boardCode }"
											data-boardReply="${inquiry.boardReply }">
												답변보기
											</button>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>				
						</c:forEach>
		
					</c:otherwise>
				</c:choose>
		</table>
		
		<div class="BtnDiv">
			<label for="insertBtn" class="insertBtnDiv">
			  	<a id="insertBtn" href="adviceService.do" onclick="winPop(this.href, {name:'팝업1',width:800,height:600}); return false;"> 문의 등록</a>
			</label>
			<label for="deleteBtn" class="deleteBtnDiv">
				<button id="deleteBtn">삭제하기</button>
			</label>
		</div>

	</div>	
	<!-- 수정하기 모달 -->		
	<div id="updateDialog" title="수정하기" class="dialog updateDialog">
		<input type="hidden" id="updateBoardCode"/>
		
		<table>
			<tr>
				<th>제목 : </th>
				<td><input type="text" id="updateBoardTitle"/></td>
			</tr>
			<tr>
				<th>문의내용 : </th>
				<td><input type="text" id="updateBoardContent"/></td>
			</tr>
			<tr>
				<td colspan="2"><button id="updateBtn">수정하기</button></td>
			</tr>
		</table>
	</div>

	<!-- 답변보기 모달 -->
	<div id="viewDialog" title="답변보기" class="dialog viewDialog">
		<input type="hidden" id="viewBoardCode"/>
		
		<table>
			<tr>
				<th>제목 : </th>
				<td><input type="text" id="viewBoardTitle" readonly/></td>
			</tr>
			<tr>
				<th>문의내용 : </th>
				<td><input type="text" id="viewBoardContent" readonly/></td>
			</tr>
			<tr>
				<th>답변 : </th>
				<td><input type="text" id="viewBoardReply" readonly/></td>
			</tr>
		</table>
	</div>

</div>
</body>
</html>