<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD</title>
<link rel="stylesheet" href="css/bootstrap.css" >
</head>
<body>
<div align="center"style="height: 200px;">게시판</div>
<div align="center" >
	<div class="container btn btn-light ">
		<div align="center">
			<form action="boardList.do" method="post">
				<select class="btn btn-dark" name="searchCondition">
					<c:forEach items="${conditionMap }" var="option">
						<option value="${option.value }">${option.key }
					</c:forEach>
				</select>
				<input class="btn btn-dark" type="text" name="searchKeyword">
				<input class="btn btn-dark" type="submit" value="검색"><br>
				${boardVO.searchCondition }
				${boardVO.searchKeyword }
			</form>		
		</div>		
		<div align="right">
			<%-- ${userVO.id } --%>
			${id } 님 환영합니다.
			<input class="btn btn-danger" type="button" onclick="location.href='boardInsert.do'" value="글쓰기" />&nbsp;
			<input class="btn btn-info" type="button" onclick="location.href='logout.do'" value="로그아웃" />
		</div>
		<div style="background: pink;">
			<table class="table table-hover rounded ">
				<thead class="thead thead-dark " >
					<tr>
						<th>No</th>		
						<th>제목</th>		
						<th>작성자</th>		
						<th>작성일자</th>		
						<th>조회수</th>		
					</tr>
				</thead>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="5" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="board" varStatus="1">
							<tr>
								<td>${board.seq }</td>
								<td>
									<a href="boardInfo.do?seq=${board.seq}"> ${board.title }</a>
								</td>
								<td>${board.writer }</td>
								<td>${board.regDate }</td>
								<td>${board.readCnt }</td>
							</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
			</table>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>