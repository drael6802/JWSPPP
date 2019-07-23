<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<link rel="stylesheet" href="css/bootstrap.css" >
<!--  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<!--  -->
<script src="js/board_Info.js?ver=0"></script>

<!--  -->
</head>
<body>
<div class="container" style="height: 200px; "></div>
<div class="container" >
	<div class="container " align="center" >
		<form class="btn btn-light" action="updateBoardProc.do" method="post">
			<input type="hidden" id="seq" name="seq" value="${boardVO.seq}">
			<div class="card border " style="background-color:pink;  width: 20rem; height: 30rem;">
	 			<div class="card-body">
	  				<h4 class="card-title" >글쓰기</h4>
	 		 	</div>
	 		 	<div>
	 		 		<label>작성자</label><br>
	   				<div class="btn btn-dark" id="writerInfo" >${boardVO.writer }</div>
	 		 	</div>
	 		 	<div>
	 		 		<label>작성일</label><br>
	   				<div class="btn btn-dark" id="regDate" >${boardVO.regDate }</div>
	 		 	</div>
	 		 	<div align="center">
	 		 		<label>제목</label><br>
		 		 	<div class="btn btn-dark" id="titleInfo" >${boardVO.title }</div>
	 		 	</div>
	 		 	<div align="center">
	 		 		<label>내용</label><br>
		 		 	<div class="btn btn-dark" id="contentInfo">${boardVO.content }</div>
	 		 	</div>
	   			<div class="card-body">
		   			<div id="Btn">
		   				<input class="btn btn-dark" type="button" id="deleteBtn"  onclick="location.href='deleteBoard.do?seq=${boardVO.seq}'" value="삭제">
		   				<button class="btn btn-dark" type="button" id="updateBtn" >변경</button>
		   			</div>
	   			</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>