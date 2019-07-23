<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빨간맛_회원</title>
<style type="text/css">
	@font-face {
		font-family: 'Binggrae-Bold';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	@font-face {
		font-family: 'KOMACON';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')format('woff');
		font-weight: normal;
		font-style: normal;
	}

	.myPageTempl {
		margin: 0 auto;
		width: 1000px;
		margin-top: 30px;
	}

	.topTitle {
		display: inline-block;
		width: 100%;
		padding: 10px;
		font-size: 50px;
		font-family: 'Binggrae-Bold';
		text-align: center;
	}
	.myPageTempl table {text-align: center; font-size: 20px;}
	
	.myPageTempl a {color: black;}
	
	.title {
		font-family: 'Binggrae-Bold';
		font-size: x-large;
		display: block;
		text-align: left;
		margin-top:55px;
		margin-bottom: 20px;
		padding-left: 30px;
	}
	
	.leftMenu {width: 230px; vertical-align: top;}
	.rightMenu {width: 750px; vertical-align: top;}
	
	.leftMenu .profile {
		height: 150px; 
		margin-top: 35px; 
		margin-bottom: 35px; 
		font-family: 'Binggrae-Bold';
	}
	.leftMenu .menu {height: 350px;}
	.leftMenu div {
		width: 200px;
		background-color: white;
		border-radius: 10px;
		margin: auto;
	}	
	.leftMenu ul {
		font-family: 'Binggrae-Bold';
		list-style: disc;
		text-align: left;
		font-size: large;
	}
	.leftMenu ins {
		text-decoration: none;
		font-size: x-large;
		line-height: 50px;
	}
	
	.rightMenu .menu {width: 100%;}
	
	span[class="title"] + div {
		background-color: white;
		border-radius: 10px;
		width: 100%;
	}
</style>

<style type="text/css">

	@font-face {
		font-family: 'KOMACON';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')format('woff');
		font-weight: normal;
		font-style: normal;
	}

	.content {
		min-height: 70px;
	}
	
	.board {font-family: 'KOMACON'; font-size: 20px; width: 750px;}
	.board span {display: inline-block;}
	.board .tr {
		border-top: 1px solid #585858;
		height: 40px;
		vertical-align: bottom;
		padding-top: 7px;
	}
	
	.board a {
		font-family: 'KOMACON';
		text-decoration: none;
		color: black;
	}
	
	.notice {}
	.notice .col1 {width: 10%; }
	.notice .col2 {width: 50%;}
	.notice .col3 {width: 30%;}

	.qna {}
	.qna .col1 {width: 10%;}
	.qna .col2 {width: 20%;}
	.qna .col3 {width: 60%;}
		
	.title {font-weight: bold; padding-bottom: 15px;}

</style>
</head>
<body>
<!-- 상단 -->
<div>
	<jsp:include page="menu_top.jsp"></jsp:include><br>
	<jsp:include page="menu_search.jsp"></jsp:include>
	<jsp:include page="menu_main.jsp"></jsp:include>
</div>

<!-- 마이페이지 -->
<div class="myPageTempl">
	<span class="topTitle" onclick="location.href='userPage.do?userId=${userInfo.userId }'">
		MY PAGE
	</span>
	
	<div style="background: #ed6161; border-radius: 10px; min-height: 1000px; margin-bottom: 100px;">
		<table>
			<tr>
				<!-- 왼쪽 -->
				<td class="leftMenu">
					<!-- 프로필 -->
					<div class="profile">
						<span style="display: inline-block; width: 100%; position: relative; top: 50px;">
							환영합니다!<br>${userInfo.userId }님
						</span>
					</div>
					<!-- 메뉴 -->
					<div class="menu">
						<div style="height: 20px;"></div>

						<ul>
							<ins>회원정보</ins>
							<li><a href="userInfoUpdate.do?userId=${userInfo.userId }">회원 정보수정</a></li>
						</ul>

						<ul>
							<ins>쇼핑활동</ins>
							<li><a href="buyListInfo.do">최근주문내역</a></li>
							<li><a href="likeListInfo.do">찜한상품</a></li>
							<li><a href="reviewListInfo.do">상품후기</a></li>
							<li><a href="inquiryBoardList.do">상품 문의</a></li>
						</ul>
					</div>
				</td>

				<td>
					<hr style="background-color: #585858; ">
				</td>
				
				<!-- 오른쪽 -->
				<td class="rightMenu">
					<jsp:include page="${viewPage }"></jsp:include>
				</td>
			</tr>
		</table>
	</div>
</div>
<!--모달 -->
<div>
	<jsp:include page="user_page_modal.jsp"></jsp:include>
</div>

<!--하단  -->
<div>
	<jsp:include page="bottom.jsp"></jsp:include>
</div>
</body>
</html>