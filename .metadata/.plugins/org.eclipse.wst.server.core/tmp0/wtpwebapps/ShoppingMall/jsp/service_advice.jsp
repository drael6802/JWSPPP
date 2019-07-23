<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 상담신청</title>
<style type="text/css">
@font-face {
	font-family: 'Binggrae-Bold';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}
@font-face {
	font-family: 'KOMACON';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')format('woff');
	font-weight: normal;
	font-style: normal;
}

.advice {font-family: 'KOMACON';}
.advice table {
	width: 100%;
	border-collapse: collapse;
	text-align: left;
	border-left: none;
	border-right: none;
}
.advice tr {border: none;}
.advice th {
	width: 80px;
	padding-left: 10px;
	height: 40px;
}

.titleDiv {
	background: #ed6161;
	height: 80px;
	padding-top: 30px;
	padding-left: 20px;
	color: #fff;
}
.titleDiv span {
	display: inline-block;
}
.titleDiv .maintitle {font-family: 'Binggrae-Bold'; font-size: 30px;}


.advice td {padding-left: 5px;}
.advice input {width: 76.5%; margin: 5px; height: 30px; font-size: 17px;}
.advice select {width: 18%; margin: 5px; margin-right: 0px; height: 35px; font-size: 17px; text-align: center;}
.advice textarea {width: 96%; margin: 5px; margin-bottom: 0px; height: 200px; font-size: 17px; font-family: 'KOMACON';}
.advice button {border: none; width: 49%; height: 55px; font-size: large; background: #ed6161; color: #fff; font-family: 'Binggrae-Bold';}
.advice ul {padding: 0px;}

.advice .btnDiv {padding: 0px;}

</style>
</head>
<body>
<div class="advice">
	<c:choose>
		<c:when test="${empty sessionScope.userInfo.userId }">
			<div style="height: 30px;"></div>
			<h2>로그인 후 이용가능합니다.</h2>
		</c:when>
		<c:otherwise>
			<div style="height: 20px;"></div>
			<div>
				<div class="titleDiv">
					<span class="maintitle">1:1상담신청</span>
					<br>
					고객님의 문제해결을 위하여 최선을 다하겠습니다.
				</div>
			</div>
			<div style="height: 10px;"></div>
			<ul>
				<li>문의하실 분야를 선택하신 후 내용을 입력하신 다음 "신청하기" 버튼을 눌러주세요.</li>
				<li>한번 등록한 상담내용은 수정이 불가합니다. 수정을 원하시는 경우, 삭제 후 재등록 하셔야 합니다.</li>
			</ul>
			<div>
			<form action="insertQuestion.do" method="post">
				<input type="hidden" id="userId" value="${sessionScope.userInfo.userId }"/>
					<table border="1">
						<tr>
							<th>주문자</th>
							<td>&nbsp;${sessionScope.userInfo.userName }</td>
							<th>아이디</th>
							<td>&nbsp;${sessionScope.userInfo.userId }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3">
								<select id="boardTitle1" name="boardTitle1">
									<option value="">문의항목</option>
									<option value="[배송]">배송</option>
									<option value="[교환]">교환</option>
									<option value="[환불]">환불</option>
									<option value="[기타]">기타</option>
								</select>
								<input type="text" id="boardTitle2" name="boardTitle2"/>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea id="boardContent" name="boardContent"></textarea></td>
						</tr>
					</table>
					<div style="height: 10px;"></div>
					<div align="center" class="btnDiv">
						<button type="submit">신청하기</button>
						<button type="reset">다시작성</button>
					</div>
				</form>
			</div>
		</c:otherwise>
	</c:choose>
</div>	
</body>
</html>