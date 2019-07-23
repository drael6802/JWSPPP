<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 탑</title>

<style type="text/css">
body {
	top-margin: 0;
	bottom-margin: 0;
	left-margin: 0;
	right-margin: 0
}

.eld {
	margin: 0;
	padding: 0;
}

.eld * {
	margin: 0;
	padding: 0;
}

.in {
	width: 100%;
	height: 8px;
	margin-right: 20px;
}

.eld a {
	color: #000000;
	text-decoration: none;
	margin: 3px;
}

.eld div {
	display: block;
}
</style>

<script type="text/javascript">
function winPop(url, opts) {
	   
	   var popupName = opts.name || 'popup';
	   var options = '';
	   options += 'width=' + (opts.width ? opts.width : 200) + ', height=' + (opts.height ? opts.height : 200);
	   options += opts.left && opts.width ? ', left=' + opts.left : ', left=' + ( (screen.availWidth - opts.width) / 2);
	   options += opts.top && opts.height ? ', top=' + opts.top : ', top=' + ( (screen.availHeight - opts.height) / 2);
	   options += opts.scrollbars ? ', scrollbars=' + opts.scrollbars : ', scrollbars=no';
	   options += opts.resizable ? ', resizable=' + opts.resizable : ', resizable=no';
	       console.log(popupName);
	   window.open(url, popupName, options);
		}
</script>

</head>
<body>
	<div class="eld in">
		<div
			style="text-align: right; font-size: small; background-color: #FFF; height: 30px;">
			<div style="height: 5px;"></div>
			<c:choose>
				<c:when test="${empty sessionScope.userInfo }">
					<a href="userLogin.do">로그인</a>
					<a href="userJoin.do">회원가입</a>
					<a href="userLogin.do">마이페이지 </a>
					<a href="userLogin.do">장바구니</a>
				</c:when>
				<c:otherwise>
					<label>${sessionScope.userInfo.userName }님 환영합니다.</label>
					<a href="userLogout.do">로그아웃</a>
					<a href="userPage.do?userId=${userInfo.userId }">마이페이지</a>
					<a href="cartList.do?userId=${userInfo.userId }">장바구니</a>
					<c:if test="${sessionScope.userInfo.userAdmin == 'Y' }">
						<a href="userAdmin.do" onclick="winPop(this.href, {name:'팝업1',width:600,height:800}); return false;">관리자페이지 </a>
					</c:if>
				</c:otherwise>
			</c:choose>
			<a href="serviceCenter.do">고객센터</a>
		</div>
	</div>
</body>
</html>