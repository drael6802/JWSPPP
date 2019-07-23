<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SERVICE_MAIN_LIST_MORE</title>
<style type="text/css">
	@font-face {
		font-family: 'KOMACON';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')format('woff');
		font-weight: normal;
		font-style: normal;
	}
	.board_main {
		font-family: 'KOMACON';
		padding: 10px;
	}
	.board_main table {
		width: 100%;
		border-collapse: collapse;
		border-left: none;
		border-right: none;
		border-top: none;
		text-align: center;
	}
	.board_main th, td {
		border-top: none;
		border-right: none;
		border-left: none;
		height: 35px;
	}
	.board_main a {
 		text-decoration: none;
		color: black;
 	}
</style>
</head>
<body>

	<div class="board_main">
		<!-- 공지사항 -->
		<h1 align="center">공지사항</h1>

		<div style="height: 10px;"></div>

		<div style="min-height: 420px;">
			<table border="1">
				<tr>
					<th style="width: 100px;">번호</th>
					<th>제목</th>
					<th style="width: 150px;">등록일</th>
				</tr>
				<c:choose>
					<c:when test="${empty noticeListMore }">
						<tr>
							<td colspan="3" style="height: 50px;">작성된 글이 없습니다.</td>
						</tr>
					</c:when>

					<c:otherwise>
						<c:forEach items="${noticeListMore }" var="notice">
								<tr>
									<td>${notice.rowNum }</td>
									<td>
										<a href="noticeListDetail.do?boardCode=${notice.boardCode }">
										${notice.boardTitle }</a>	
									</td>
									<td>${notice.boardDate }</td>
								</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<div style="height: 40px;"></div>

		<!-- 페이징처리 -->
		<div align="center">
			<c:if test="${totalPage > 1 }">
				<c:forEach begin="1" end="${totalPage }" var="page">
					<a href="serviceMainListMore.do?pageIndex=${page }">${page }</a>
				</c:forEach>
			</c:if>
		</div>
		
	</div>

</body>
</html>