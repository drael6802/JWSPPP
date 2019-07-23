<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>USER_MANAGER_DETAIL</title>
<style type="text/css">
	.userDetail {
		padding-left: 10px;
		padding-right: 10px;
	}
	.userDetail table {
		border-collapse: collapse;
		text-align: center;
		padding: 5px;
		width: 80%;
	}
	.userDetail th {
		width: 100px;
		background: #D0D0D0;
	}
	.userDetail th,td {
		height: 50px;
	}
</style>
</head>
<body>

<div class="userDetail">
<div>
	<h2>${userVO.userId } 고객님의 상세정보</h2>
</div>
<div>
	<table border="1">
		<tr>
			<th>
				아이디
			</th>
			<td>
				${userVO.userId }
			</td>
			<th>
				비밀번호
			</th>
			<td>
				${userVO.userPassword }
			</td>
		</tr>
		<tr>
			<th>
				주소
			</th>
			<td colspan="3">
				${userVO.userAddress }
			</td>
		</tr>
		<tr>
			<th>
				연락처
			</th>
			<td>
				${userVO.userPhone }
			</td>
			<th>
				이메일
			</th>
			<td>
				${userVO.userEmail }
			</td>
		</tr>
		<tr>
			<th>
				생년월일
			</th>
			<td>
				${userVO.userBirth }
			</td>
			<th>
				가입일자
			</th>
			<td>
				${userVO.userJoinday }
			</td>
		</tr>
	</table>
</div>
<div style="height: 15px;"></div>
<div>
	<a href="userManager.do">뒤로가기</a>
</div>
</div>
</body>
</html>