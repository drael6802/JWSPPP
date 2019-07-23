<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가 페이지</title>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="../js/testInsert.js?ver=1" type="text/javascript" ></script>
</head>
<body>
<div align="center">
<form action="itemProc.do" method="post">
	<table>
		<tr>
			<td>아이템 네임</td>
			<td><input type="text" id="itemName" name="itemName"></td>
		</tr>
		<tr>
			<td>아이템 가격</td>
			<td><input type="text" id="itemPrice" name="itemPrice"></td>
		</tr>
		<tr>
			<td>아이템 수량</td>
			<td><input type="text" id="itemAmount" name="itemAmount"></td>
		</tr>
	</table>
	<input type="button" id="Btn" value="입력">
</form>
</div>
</body>
</html>