<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 회원정보 수정</title>
	<!-- 제이쿼리 -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<!--제이쿼리 스크립트 경로 -->
	<script type="text/javascript" src="../js/user_page_infoUpdate.js?ver=13"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style type="text/css">
	.userInfo table {
		width: 90%;
		margin: 5px auto;
		text-align: left;
	}
	
	.userInfo tr {height: 35px; border: none;}
	
	span[class="title"] + div {height: 840px;}
	input[type="password"] {font-family: sans-serif;}
</style>
</head>
<body>

	<div class="menu userInfo">
		<span class="title">회원정보</span>
		<div>
			<div style="height: 30px;"></div>
			<form action="userInfoUpdateProc.do" method="post">
				<table border="1">
					<tr>
						<th>이름</th>
						<td>${userInfo.userName }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${userInfo.userId }</td>
					</tr>
					<tr>
						<th>기존 비밀번호</th>
						<td>
							<input type="password" id="originUserPassword" name="userPassword" class="userPassword"/>
						</td>
					</tr>
					<tr>
						<th rowspan="2">비밀번호 변경</th>
						<td>
							<input type="password" id="updatePassword" name="userPassword" class="userPassword"/>
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" id="userPasswordCheck" maxlength="20" required/>
							<label class="danger pwCheck" id="danger" style="color: red;">비밀번호가 일치하지 않습니다.</label>
							<label class="success pwCheck" id="success" style="color: green;">비밀번호가 일치합니다.</label>
						</td>
					</tr>
					<tr>
						<th>
							주소
						</th>
						<td class="addrDiv">
							<input type="text" id="userAddress" value="${userInfo.userAddress }" readonly style="width: 400px;">
							<button type="button" id="opener">주소변경</button>
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${userInfo.userPhone }</td>
						
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${userInfo.userBirth }</td>
					<tr>
						<th>
							이메일
						</th>
						<td>
							${userInfo.userEmail }
						</td>
					</tr>
				</table>
			</form>
			<div style="margin-top: 50px;">
				<button type="button" id="userUpdateBtn" >비밀번호 수정</button>
				<button>회원 탈퇴</button>
			</div>			
		</div>
	</div>
	
	<div id="dialog" title="주소변경">
		<div style="text-align: left;">
			<input type="text" id="sample6_postcode" placeholder="우편번호" readonly/>
			<div style="height: 5px;"></div>
			<input type="text" id="sample6_address" placeholder="주소" readonly/>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소" maxlength="50"/>
			<input type="text" id="sample6_extraAddress" placeholder="참고항목" readonly/>
			<button onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
			<button type="button" id="addressBtn" >확인</button>
		</div>
	</div>
 

</body>
</html>