<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 관리 페이지</title>
<style type="text/css">
	.userManager {
		padding-left: 10px;
		padding-right: 10px;
	}
	.userManager table {
		width: 100%;
		text-align: center;
		border-collapse: collapse;
		border: 2px solid;
	}
	.userManager th {
		background: #D0D0D0;
	}	
	.userManager tr {
		height: 30px;
	}	
	.userManager .searchDiv {
		background: #D0D0D0;
		border: 2px solid;
		width: 100%;
		height: 60px;
	}
	.searchDiv input {
		width: 200px;
		height: 27px;
		border: 1px solid;
	}
	.searchDiv button {
		width: 50px;
		height: 32px;
		border: none;
		background: none;
		
	}
</style>
</head>
<body>
<div class="userManager">
<h2>회원 목록</h2>
 <!-- 검색 -->
<div class="searchDiv">
	<form action="userManager.do">
		<div style="height: 12px;"></div>
		<select name="searchState">
			<option>아이디</option>
			<option>이름</option>
		</select>
		<input type="text" id="search" name="searchKeyword"/>
		<button type="submit">검색</button>
	</form>
</div>
<div style="height: 20px;"></div>
<!-- 유저정보리스트 -->
<div>
	<table border="1">
		<tr>		
			<th>
				아이디
			</th>
			<th>
				연락처
			</th>
			<th>
				생년월일
			</th>
			<th>
				가입일자
			</th>
		</tr>
		<c:forEach items="${userList }" var="userVO">
			<tr onclick="location.href='userManagerDetail.do?userId=${userVO.userId }'" style="cursor: pointer;">
				<td>
					<a >${userVO.userId }</a>
				</td>
				<td>
					${userVO.userPhone }
				</td>
				<td>
					${userVO.userBirth }
				</td>
				<td>
					${userVO.userJoinday }
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</div>
</body>
</html>