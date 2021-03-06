<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN</title>
	<!-- 제이쿼리 -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<!--제이쿼리 스크립트 경로 -->
	<script type="text/javascript" src="../js/user_join.js?ver=6"></script>
	<!--CSS속성  -->
	<link rel="stylesheet" href="" >
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
// 주소 카카오 api js
function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우

						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("sample6_extraAddress").value = extraAddr;

					} else {
						document.getElementById("sample6_extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_detailAddress")
							.focus();
				}
			}).open();
}

</script>
	
<style type="text/css">
	.joinForm {width: 1000px; font-size: large;}
	.joinForm .topTitle {
		font-family: 'KOMACON';
		font-size: large;
	}
	.topTitle h1 {font-family: 'Binggrae-Bold';}
	.joinForm table {
		margin: auto;
		width: 100%;
		text-align: left;
		border-collapse: collapse;
		border: none;		
	}	
	.joinForm tr {border: none;}
	.joinForm th,td {
		border-color: #D0D0D0;
		border-left: none;
		border-right: none;
		padding: 5px;
	}
	.joinForm th {
		width: 200px;
		height: 50px;
		padding-left: 60px;
		font-family: 'Binggrae-Bold';
	}	
	.joinForm td {
		padding-left: 15px;
		font-family: 'KOMACON';
	}
	.joinForm hr {
		height: 3px;
		background-color: #ed6161;
		border-radius: 10px;
		margin: 5px;
	}
	.joinForm input {
		width: 180px;
		height: 30px;
		font-size: large;
		font-family: 'KOMACON';
		padding-left: 10px;
	}	
	.joinForm button {
		font-size: medium;
		border: none;
		height: 30px;
		width: 85px;
		font-family: 'Binggrae-Bold';
		vertical-align: middle;
	}	
	.joinForm select {
		font-size: medium;
		height: 32px;
		width: 130px;
		font-family: 'KOMACON';
	}
	.addrDiv {
		height: 90px;
	}	
	.addrDiv input {width: 200px;}
	.addrDiv button {
		width: 120px;
	}	
	.pwCheck {
		font-size: medium;
	}
	.joinBtn{
		margin-top: 20px;
	}
	.joinBtn button {
		height: 50px;
		width: 200px;
		font-size: x-large;
		background: #ed6161;
		color: #fff;
	}
	
	input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button {-webkit-appearance: none;}
	input[type="password"] {font-family: sans-serif; padding-right: 30px;}
</style>
</head>
<body>
<div class="joinForm">
	<div style="height: 100px;" ></div>
	<div align="left" class="topTitle">
		<h1>회원가입</h1>
		<div>
			빨간맛에 오신 것을 환영합니다.
		</div>
	</div>
	<div style="height: 20px;" ></div>
	<hr>
<form action="userJoinProc.do" method="post">

	<table border="1">
		<tr>
			<th style="border: none;">
				아이디
			</th>
			<td style="border: none;">
				<div id="idContentDIV">
					<input type="text" id="userId" name="userId" maxlength="15" required/>
					<!-- <input type="button" id="idCheckBtn" name="" value="중복체크"/> -->
					<button id="idCheckBtn" name="">중복체크</button>
					<label style="font-size: medium; color: #808080; padding-left: 10px;">
						* 영문과 숫자만 입력 가능 합니다.
					</label>
				</div>
			</td>
		</tr>
		<tr>
			<th>
				비밀번호
			</th>
			<td>
				<input type="password" id="userPassword" name="userPassword" maxlength="20" required/>
			</td>
		</tr>
		<tr>
			<th>
				비밀번호 확인
			</th>
			<td>
				<input type="password" id="userPasswordCheck" maxlength="20" required/>
				<label class="danger pwCheck" id="danger" style="color: red;">비밀번호가 일치하지 않습니다.</label>
				<label class="success pwCheck" id="success" style="color: green;">비밀번호가 일치합니다.</label>
			</td>
		</tr>
		<tr>
			<th>
				이름
			</th>
			<td>
				<input type="text" id="userName" name="userName" maxlength="10" required />
			</td>
		</tr>
		<tr>
			<th>
				주소
			</th>
			<td class="addrDiv">
				<div style="text-align: left;">
					<input type="text" id="sample6_postcode" placeholder="우편번호" readonly/>
					<!-- <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/><br> -->
					<button onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
					<div style="height: 5px;"></div>
					<input type="text" id="sample6_address" placeholder="주소" readonly/>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" maxlength="50"/>
					<input type="text" id="sample6_extraAddress" placeholder="참고항목" readonly/>
				</div>
			</td>
		</tr>
		<tr>
			<th>
				전화번호
			</th>
			<td>
				<select id="userPhone1">
					<option>010</option>
					<option>011</option>
					<option>013</option>
				</select>
				-
				<input type="number" id="userPhone2" required maxlength="5"/>
				-
				<input type="number" id="userPhone3" required maxlength="5"/>				
			</td>
		</tr>
		<tr>
			<th>
				이메일
			</th>
			<td>
				<input type="email" id="userEmail1" name="userEmail1" required maxlength="15"/> @
				<input type="text" id="userEmail2" name="userEmail2"  required disabled required maxlength="15"/>
				<select id="emailSelecter">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>google.com</option>
					<option>nate.com</option>
					<option id="directInput">직접입력</option>
				</select>
			</td>
		</tr>
		<tr>
			<th style="border: none;">
				생년월일
			</th>
			<td style="border: none;">
				<input type="date" id="userBirth" name="userBirth" value="2000-01-01"/>
			</td>
		</tr>
	</table>
	
	<hr>
	
	<div class="joinBtn">
		<button id="joinBtn">회원가입</button>
	</div>

	<!-- <input type="button" id="joinBtn" value="회원가입" class="joinBtn"/> -->
	<!-- <input type="button" id="chcekBtn" value="값 확인" class="joinBtn"/> -->
<div style="height: 150px;"></div>
</form>
</div>
</body>
</html>