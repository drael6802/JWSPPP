<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD_MANAGER</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="../js/board_manager.js?ver=5"></script>


<!-- 탭메뉴 -->
<style type="text/css">
	input[type="radio"] {display: none;}
	input[type="radio"] + label {
		display: inline-block;
		cursor: pointer;
		padding: 5px;
		font-size: 14px;
		background: #F5BAAB;
		color: #F1EFEE;
	}
	input[type="radio"]:checked + label {
		background: #F15B42;
		color: #fff;
	}
	.conBox {
		width: 500px;
		min-height: 500px;
		border-top: 5px solid #F15B42;
		margin: 0 auto;
		display: none;
	}
	input[id="btn01"]:checked ~ .con01 {display: block;}
	input[id="btn02"]:checked ~ .con02 {display: block;}
	input[id="btn03"]:checked ~ .con03 {display: block;}
</style>

<style type="text/css">
	@font-face {
		font-family: 'KOMACON';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')format('woff');
		font-weight: normal;
		font-style: normal;
	}
	.board_list {
		font-family: 'KOMACON';
		padding: 10px;
	}
	.board_list table {
		width: 100%;
		border-collapse: collapse;
		border-left: none;
		border-right: none;
		border-top: none;
		text-align: center;
	}
	.board_list th, td {
		border-top: none;
		border-right: none;
		border-left: none;
		height: 35px;
	}
	.board_list a {
 		text-decoration: none;
		color: black;
 	}
 	.board_list button {
 		background: none;
 		font-family: 'KOMACON';
 		border: 1px solid;
 		font-size: medium;
 	}
 	
 	.board_insert {font-size: large; font-family: 'KOMACON';}
 	.board_insert table {border-collapse: collapse;}
 	.board_insert td {padding: 5px;}
 	.board_insert input {width: 403px; height: 30px; font-family: 'KOMACON'; font-size: large;}
 	.board_insert textarea {width: 400px; height: 200px; font-family: 'KOMACON';  font-size: large;}
 	.board_insert button {
 		font-family: 'KOMACON';
 		font-size: large; 
 		width: 80px; 
 		height: 30px;
 		background: none;
 		border: 1px solid;
 	}
 	
 	input[type="checkbox"] {
 		size: 15px;
 	}
 	
</style>

</head>
<body>

<div style="height: 30px;"></div>

	<!-- 보드관리 상단메뉴 -->
	<div class="tab_menu">
		<input type="radio" name="menubtn" id="btn01" checked />
		<label for="btn01">NOTICE_LIST</label>
		
		<input type="radio" name="menubtn" id="btn02" />
		<label for="btn02">NOTICE_INSERT</label>
		
		<input type="radio" name="menubtn" id="btn03" />
		<label for="btn03">QnA_ANSWER</label>

		<!-- 공지사항 리스트 -->
		<div class="conBox con01 board_list">
			<h2 align="center">공지사항</h2>
			
			
	
			<div style="min-height: 420px; text-align: center;">
				<table border="1">
					<tr>
						<th><input type="checkbox" id="checkAll"/></th>
						<th style="width: 100px;">번호</th>
						<th>제목</th>
						<th style="width: 150px;">등록일</th>
					</tr>
					<c:choose>
						<c:when test="${empty noticeList }">
							<tr>
								<td colspan="4" style="height: 50px;">작성된 글이 없습니다.</td>
							</tr>
						</c:when>
	
						<c:otherwise>
							<c:forEach items="${noticeList }" var="notice">
								<tr>
									<td><input type="checkbox" class="cbBox" value="${notice.boardCode }"/></td>
									<td>${notice.rowNum }</td>
									<td><a class="opener" data-boardContent="${notice.boardContent }" data-boardCode="${notice.boardCode }"  >${notice.boardTitle }</a></td>
									<td>${notice.boardDate }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<div style="height: 10px; float: right;">
				<button id="deleteBtn">삭제</button>
			</div>
			
			
				<!-- 페이징처리 -->
				<div align="center">
					<div style="height: 20px;"></div>
					<c:forEach begin="1" end="${totalPage }" var="page">
						<a href="boardManager.do?pageIndex=${page }">${page }</a>
					</c:forEach>
					<div style="height: 20px;"></div>
				</div>
		</div>

		<!-- 공지사항 등록 -->
		<div class="conBox con02 board_insert">
			
			<div style="height: 15px;"></div>
				<h2>공지사항 등록</h2>			
			<form action="insertNotice.do" method="post">
				<table border="1">
					<tr>
						<th width="80px;">제목:</th>
						<td><input type="text" id="boardTitle" name="boardTitle" value="[공지사항]" /></td>
					</tr>
					<tr>
						<th style="vertical-align: top;">내용:</th>
						<td><textarea id="boardContent"name="boardContent"></textarea></td>
					</tr>
				</table>
				<div style="margin-top: 10px; text-align: right;">
					<button type="submit">등록하기</button>
					<button type="reset">다시작성</button>
				</div>
			</form>
		</div>

		<!-- QnA 답변 -->
		<div class="conBox con03 board_list">
			<div style="height: 15px;"></div>
			<h2 align="center">답변등록</h2>
	
			<div style="min-height: 420px; text-align: center;">
				<table border="1">
					<tr>
						<th width="60px">질문자</th>
						<th width="150px">제목</th>
						<th width="100px">등록일</th>
						<th width="150px">답변등록</th>
					</tr>
					<c:choose>
						<c:when test="${empty QnAList }">
							<tr>
								<td colspan="4" style="height: 50px;">작성된 글이 없습니다.</td>
							</tr>
						</c:when>
	
						<c:otherwise>
							<c:forEach items="${QnAList }" var="qna">
								<tr>
									<td>${qna.userId }</td>
									<td>${qna.boardTitle }</td>
									<td>${qna.boardDate }</td>
									<td>									
										<c:choose>
											<c:when test="${empty qna.boardReply || qna.boardReply == ''}">
												<button class="inquiryOpener"
												data-boardTitle="${qna.boardTitle}"
												data-boardContent="${qna.boardContent }"
												data-boardCode="${qna.boardCode }"
												data-boardReply="${qna.boardReply }">
													답변하기
												</button>
											</c:when>
											<c:otherwise>
												<button class="inquiryOpener"
												data-boardTitle="${qna.boardTitle}"
												data-boardContent="${qna.boardContent }"
												data-boardCode="${qna.boardCode }"
												data-boardReply="${qna.boardReply }">
													수정하기
												</button>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
				<!-- 페이징처리 -->
				<div align="center">
					<div style="height: 20px;"></div>
					<c:forEach begin="1" end="${totalPage }" var="page">
						<a href="boardManager.do?pageIndex=${page }">${page }</a>
					</c:forEach>
					<div style="height: 20px;"></div>
				</div>
		</div>
	</div>

	<div id="dialog" title="공지사항 수정">
		<div align="center">
			<input type="hidden" id="updateBoardCode" value="" />
			<table>
				<tr>
					<th width="80px;">제목:</th>
					<td><input type="text" id="updateBoardTitle" name="boardTitle" /></td>
				</tr>
				<tr>
					<th style="vertical-align: top;">내용:</th>
					<td><textarea id="updateBoardContent" name="boardContent"></textarea></td>
				</tr>
			</table>
			<div style="margin-top: 10px; text-align: right;">
				<button type="button" id="updateNoticeBtn">등록하기</button>
				<button type="reset">다시작성</button>
			</div>
		</div>
	</div>
	
	<div id="dialogInquiry" title="답변등록">
		
		<input type="hidden" id="inquiryBoardCode"/>
		
		<table>
			<tr>
				<th>질문 제목</th>
				<td><input type="text" id="inquiryBoardTitle" name="boardTitle"/></td>
			</tr>
			<tr>
				<th>질문 내용</th>
				<td><input type="text" id="inquiryBoardContent" name="boardContent"/></td>
			</tr>
			<tr>
				<th>답변</th>
				<td>
					<input type="text" id="inquiryBoardReply" name="boardReply"/>
				</td>			
			</tr>
		</table>
		
		<div style="margin-top: 10px; text-align: right;">
			<button id="inquiryBtn">확인</button>
		</div>

	</div>

</body>
</html>