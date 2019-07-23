<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" >
<script type="text/javascript" src="js/student_manager.js?ver=14"></script>
</head>
<body>
<div align="center">
	<div class="card-body" align="center" >
		<table>
			<tr>
				<td>
					<table class="table table-hover" >
						<tr>
							<td>
								<div id="selectBoxDiv" align="center">
									
									<select class="btn btn-outline-secondary" id="ClassSelecter" >
										<c:forEach items="${Calsslsit }" var="option">
											<option id="${option.classCode }" >${option.className }</option>
										</c:forEach>
											<option id="99"  >전체보기</option>
									</select>
								</div>
								<div id="studentListDiv" style="overflow: auto; height: 350px;"">
									<table id="studentTable">
										<tr>
											<td><input class="" type="checkbox" id="checkAll"></td>
											<td>학번</td>
											<td>이름</td>
											<td>클래스</td>
										</tr>
										<c:forEach items="${studentList }" var="info">
											<tr>
												<td><input class="cbBox" type="checkbox" id=""></td>
												<td>${info.studentNum }</td>
												<td><a class="btn btn-outline-secondary studentName" id="${info.studentNum }" style="cursor: pointer;"  >${info.studentName }</a></td>
												<td>${info.className }</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table><br>
		<div align="center" style="height: 50px; ">
			<button class="btn btn-outline-secondary" id="insertBtn" type="button">추가</button>
			<button class="btn btn-outline-secondary" id="updateBtn" type="button">변경</button>
			<button class="btn btn-outline-secondary" id="deleteBtn" type="button">삭제</button>
			<button class="btn btn-outline-secondary" id="띵" type="button">띵띵</button>
		</div>
		<div id="selectUserDiv" >
			
		</div>
	</div>
</div>
<div>
		
</div>
</body>
</html>