<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="color: #000000;">
	* 쇼핑몰 메인 *
	${sessionScope.userInfo.userId }
	
<hr>
<jsp:include page="item_main_list.jsp"></jsp:include>
</div>
</body>
</html>