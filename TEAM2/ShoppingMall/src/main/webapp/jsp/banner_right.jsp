<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.biz.vo.ItemVO"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<HTML lang="KO">
<head>
<title>우측 고정배너 </title>

<script type="text/javascript">
$(document).ready(function() {
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop() ;
		var newPosition = scrollTop  + floatPosition + "px";
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
	}).scroll();
});
</script>

<style type="text/css">
.side {
	position:absolute;  

	top:300px; 
	right:50px; 
	z-index:3; 
	width:100px; 
	height : 400px; 
	background: #F5F5F5;
	overflow: auto;
	border-radius: 15px;
}

.style-2::-webkit-scrollbar-track
{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	border-radius: 10px;
	background-color: #F5F5F5;
}

.style-2::-webkit-scrollbar
{
	width: 12px;
	background-color: #F5F5F5;
}

.style-2::-webkit-scrollbar-thumb
{
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
	background-color: #ed6161;
}

</style>

<!--자바 소스  -->
<%
//오른쪽 배너 쿠키 
		ItemVO itemVO = new ItemVO();
		Cookie[] cookieArray = request.getCookies();
		List<ItemVO> itemVOList = new ArrayList<>();
		if (cookieArray != null) {
			for (int i = 0; i < cookieArray.length; i++) {
				if (cookieArray[i].getName().startsWith("itemCode")) {
					String itemThumbnail  = (URLDecoder.decode(cookieArray[i].getValue(), "UTF-8"));
					String itemCode  = (cookieArray[i].getName());
					itemVO = new ItemVO();
					String [] itemCodeSplit = itemCode.split("itemCode");
					itemVO.setItemCode(Integer.parseInt(itemCodeSplit[1]));
					itemVO.setItemThumbnail(itemThumbnail);
					itemVOList.add(itemVO);
				}
			}
			itemVO.setItemVOList(itemVOList);
		}
%>

</head>
<body>
	<div align="center" class="side style-2" id="floatMenu" >
		<div style="height: 10px;"></div>
		<label style="font-size: small;">최근 본 상품</label>
		<div style="height: 10px;"></div>
		<c:forEach items="<%=itemVO.getItemVOList() %>" varStatus="index"  var="list" >
			<img alt="" src="../img/${list.itemThumbnail }" onclick="location.href='itemInfo.do?itemCode=${list.itemCode}'" style="width: 50px; height: 50px;">
			<hr>
		</c:forEach>
	</div>
	
	
	
</body>
</html>