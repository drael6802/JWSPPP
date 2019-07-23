<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스 센터</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/service_main.js?ver=5" ></script>

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
	
	.serviceMain {
		max-width: 1000px;
		margin: auto;
	}
	
	.serviceMain table {width: 100%;}	
	
	.topTitleDiv {
		width: 100%;	
		height: 130px;
		margin-top: 30px;
		background: #D0D0D0;
		border-radius: 30px;
		font-family: 'Binggrae-Bold';
	}
	
	.topTitleDiv img {
		width: 110px;
		height: 110px;
		opacity: 0.5;
		margin-top: 10px;
		margin-right: 30px;
	}
	
	.menuDiv {
		min-width: 200px;
		margin-top: 30px;
		font-size: large;
		font-family: 'KOMACON';
	}
	
	.menuDiv a {
		color: #000000;
		text-decoration: none;
	}
	
	.menuDiv ul {
		list-style-type: none;
		line-height: 40px;
		padding-left: 50px;
		text-align: left;
	}	
	
	.menuDiv li {
		padding-left: 10px;
	}	

	.menuDiv ins {
		font-size: larger;
		text-decoration: none;
		line-height: 40px;
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
	.board h2 {font-family: 'Binggrae-Bold';}
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
	.adviceBtn {
		background: #ed6161;
		width: 120px;
		height: 35px;
		border-radius: 10px;
		text-align: center;
	}
	.adviceBtn a {
		color: white;
		vertical-align: middle;
	}
</style>

<!-- 팝업 -->
<script type="text/javascript">
	function winPop(url, opts) {
		var popupName = opts.name || 'popup';
		var options = '';   
		options += 'width=' + (opts.width ? opts.width : 200) + ', height='
				+ (opts.height ? opts.height : 200);
		options += opts.left && opts.width ? ', left=' + opts.left : ', left='
				+ ((screen.availWidth - opts.width) / 2);
		options += opts.top && opts.height ? ', top=' + opts.top : ', top='
				+ ((screen.availHeight - opts.height) / 2);
		options += opts.scrollbars ? ', scrollbars=' + opts.scrollbars
				: ', scrollbars=no';
		options += opts.resizable ? ', resizable=' + opts.resizable
				: ', resizable=no';
		console.log(popupName);
		window.open(url, popupName, options);
	}
</script>
</head>
<body>
	<div class="serviceMain">

		<!-- 고객센터 타이틀 -->
		<div class="topTitleDiv" onclick="location.href='serviceCenter.do'" align="left">
			<div style="float: left; width: 50%; margin-left: 50px;">
				<h1>고객센터</h1>
				<h4>고객님의 목소리에 항상 귀기울이겠습니다.</h4>
			</div>
			<div style="float: right;">
				<img src="img/serviceman.png">
			</div>
		</div>		

		<div style="height: 25px;"></div>
		
		<div align="center" >

			<div class="board">
				<!-- 공지사항 -->
				<div class="notice" align="center">
					<h2 align="left">공지사항</h2>
					<div style="height: 35px;"></div>
					<div>
						<span class="col1 title">번호</span>
						<span class="col2 title">제목</span>
						<span class="col3 title">게시일</span>
					</div>
		
					<c:forEach items="${noticeList }" var="notice">
						<div class="heading tr">
							<!-- 제목으로 보일부분 -->
							<span class="col1">${notice.rowNum }</span>
							<span class="col2">${notice.boardTitle }</span>
							<span class="col3">${notice.boardDate }</span>
						</div>
		
						<div class="content">
							<!-- 클릭시 보여질 부분 -->
							<div style="height: 20px;"></div>
							${notice.boardContent }
							<div style="height: 30px;"></div>
						</div>
					</c:forEach>
		
					<div style="height: 10px;"></div>
					<div class="moreList" align="right">
						<a href="serviceMainListMore.do" onclick="winPop(this.href, {name:'팝업1',width:600,height:800}); return false;">
							자세히&gt;&gt;
						</a>
					</div>
		
				</div>
		
				<div style="height: 20px;"></div>
		
<%--  				<!-- FaQ -->
				<div class="qna" align="center">
					<h2 align="left">1 대 1 질문 내역</h2>
					<div align="right">
					</div>
					<div>
						<span class="col1 title">번호</span>
						<span class="col2 title">구분</span>
						<span class="col3 title">제목</span>
					</div>
		 			
								
		 			<c:choose>
		 				<c:when test="${empty sessionScope.userInfo }">
								<div class="heading tr">
									<span class="col1"></span>
									<span class="col2"></span>
									<span class="col3">로그인 후 이용 기능합니다.</span>
								</div>
		 				</c:when>
		 				<c:otherwise>
		 					<c:forEach items="${qnaList }" var="qna">
			 					<div class="heading tr">
				 					<!-- 제목으로 보일부분 -->
									<span class="col1">${qna.rowNum }</span>
									<span class="col2">${qna.boardContent }</span>
									<span class="col3">${qna.boardTitle }</span>
									<!-- 클릭시 보여질 부분 -->
									<div class="content">
										${qna.boardContent }
									</div>
								</div>
							</c:forEach>
		 				</c:otherwise>
		 			</c:choose>
								
		
				</div> --%>
		
				<div style="height: 50px;"></div>
		
			</div>
		</div>
	</div>
	
</body>
</html>