<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성글 페이지</title>
<link rel="stylesheet" href="css/bootstrap.css" >
</head>
<body>
<div class="container" style="height: 200px; "></div>
<div class="container" >
	<div class="container" align="center" >
		<form class="btn btn-light" action="updateBoardProc.do" method="post">
			<input type="hidden" id="seq" name="seq" value="${boardVO.seq }" />
			<div class="card border " style="background-color:pink;  width: 20rem; height: 30rem;">
	 			<div class="card-body">
	  				<h4 class="card-title" >수정폼</h4>
	 		 	</div>
	 		 	<div>
	 		 		<label>작성자</label><br>
	   				<input class="btn btn-dark" type="text" id="writer" name="writer" value="${boardVO.writer }" readonly/>
	 		 	</div>
	 		 	<div align="center">
	 		 		<label>제목</label><br>
		 		 	<input class="btn btn-dark" type="text" id="title" name="title" value="${boardVO.title }" />
	 		 	</div><br>
	 		 	<div align="center">
	 		 		<label>내용</label><br>
		 		 	<textarea class="btn btn-dark" rows="" cols="" id="content" name="content" >${boardVO.content }</textarea>
	 		 	</div><br>
	   			<div class="card-body">
		   			<input class="btn btn-dark" type="submit" value="수정" />
	   			</div>
			</div>
		</form>
	</div>
</div>
<div class="container" style="height: 200px; "></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>