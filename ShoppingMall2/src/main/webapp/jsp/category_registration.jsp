<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title> ssss </title>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="../js/category_registration.js?ver=24"></script>

<style type="text/css">
	td{
		text-align: center;
		width: 190px;
		margin: 0;
		padding: 0;
		vertical-align: top;
	}
</style>

</head>
<body>
<table border="1">
	<tr>
		<td >
			<div align="center" id="categoryDIV">
				<table border="1">
					<c:forEach items="${categoryList }" var="categoryList" varStatus="index">
						<tr>
							<td>
								<div id="input" class="categoryBtn" data-categoryCode="${categoryList.categoryCode  }">${categoryList.categoryName  }</div>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td><input type="button" id="insertBtn" value="추가" /></td>
					</tr>
				</table>
			</div>
		</td>
		<td >
			<div align="center" id="category02DIV"> </div>
		</td>
		<td >
			<div align="center" id="category03DIV"></div>
		</td>
	</tr>
</table>

</body>
</html>