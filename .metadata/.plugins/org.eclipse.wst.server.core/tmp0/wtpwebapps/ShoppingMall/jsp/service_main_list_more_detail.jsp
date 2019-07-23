<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SERVICE_LIST_MORE_DETAIL</title>
<style type="text/css">
	@font-face {
		font-family: 'KOMACON';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')format('woff');
		font-weight: normal;
		font-style: normal;
	}

	.serviceDetailDiv {
		font-family: 'KOMACON';
		margin: auto;
		margin-top: 50px;
		width: 80%;
	}
	.serviceDetailDiv table {
		border-collapse: collapse;
		width: 100%;
		text-align: center;
	}
	.serviceDetailDiv tr {
		height: 40px;
	}

	.btnDIv {}
	.btnDIv a {
		color: black;
		text-decoration: line-through;
	}
</style>
</head>
<body>

<div class="serviceDetailDiv">

	<table border="1">
		<tr>
			<th>제목</th>
			<td>
				${boardDetailVO.boardTitle }
			</td>
	
		<tr>
			<th>작성일</th>
			<td>
				${boardDetailVO.boardDate }
			</td>
		</tr>

		<tr height="65px">
			<td colspan="2">
				${boardDetailVO.boardContent }
			</td>
		</tr>
	</table>
	
	<div class="btnDIv">
		<a href="serviceMainListMore.do">&lt;&nbsp;리스트로 돌아가기</a>
	</div>

</div>

</body>
</html>