<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
   <head>
   <meta charset="UTF-8">
   <title>검색 메뉴</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	
<style>
.d4body {box-sizing: border-box;
		margin: 0;
}
.d4body {padding: 30px 0 ; z-index:999999990;}
.d4form {
  position: relative;
  width: 600px;
  margin: 0 auto;
  z-index:999999990;
}
.d4 {background: #ed6161;}
.d4 form {
  background: #F9F0DA;
  border-bottom: 4px solid #be290e;
}
.d4 input, .d4 button {
  border: none;
  outline: none;
  background: transparent;
}
.d4 input {
  width: 100%;
  height: 42px;
  padding-left: 15px;
}
.d4 button {
  height: 42px;
  width: 42px;
  position: absolute;
  top: 0;
  right: 0;
  cursor: pointer;
}
.d4 button:before {
  content: "\f178";
  font-family: FontAwesome;
  font-size: 20px;
  color: #be290e;
}
</style>
</head>
<body>
	<div class="d4 d4body" style="float: none; ">
		<div style="margin-bottom: 20px;" align="center">
			<img src="/img/logo_ver3.png">
		</div>
		<form class="d4form" action="itemMenuCategory.do" method="post" >
			<input type="search" id="searchKeyword" name="searchKeyword" placeholder="검색어 입력" required >
			<button type="submit"></button>
		</form>
	</div>
</body>
</html>