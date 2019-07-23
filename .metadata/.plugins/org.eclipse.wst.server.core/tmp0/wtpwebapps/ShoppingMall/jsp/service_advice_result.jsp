<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SERVICE_ADVICE_RESULT</title>
<c:choose>
	<c:when test="${result > 0 }">
		<script type="text/javascript">
			alert('1:1질문이 등록되었습니다.');
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
		    alert('1:1질문 등록에 실패하였습니다. 다시 시도해주세요.');
		    history.back;
		</script>
	</c:otherwise>
</c:choose>
</head>
<body>
<div>
	<button onclick="location.href='adviceService.do'">질문 더하러가기</button>
</div>
</body>
</html>