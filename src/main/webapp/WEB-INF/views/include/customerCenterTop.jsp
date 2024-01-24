<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- top.jsp -->
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<!-- search bar -->
<link rel="stylesheet" href="/resources/css/dongyeong/search.css" />
<style>
.mainDiv>div {
	background-color: blue;
	text-align: center;
	color: white;
	font-size: xx-large;
}

.qna-title {
	color: white;
	font-size: 30px;
}

.menus>li {
	display: block;
}

#topMenu {
	width: 850px;
	height: 30px;
	position: relative;
}

#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #2d2d2d;
	float: left;
	line-height: 50px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	text-decoration: none;
	color: white;
	display: block;
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
}

#topMenu .menuLink:hover {
	color: blue;
	background-color: #4d4d4d;
}

.box {
	flex-flow: column-reverse;
}

.main-div {
	position: relative;
}

.qna-img {
	position: absolute;
	width: auto;
	height: auto;
	vertical-align: middle;
}

.main-section {
	background-color: #202020;
}

#image {
	width: 100%;
	height: 351px;
	position: absolute;
	object-fit: cover;
}
</style>

<section class="main-section no-sub-nav">
	<img id="image" src="/resources/images/main_img.png">
	<div class="main-div container">
		<div class="col">
			<div class="qna-title col"
				style="text-align: center; padding-top: 50px; padding-bottom: 50px;">지원에
				오신걸 환영합니다</div>
			<p
				style="text-align: center; padding-bottom: 50px; font-size: 25px; opacity: 0.6; color: gray;">서브 제목</p>
			<!-- 검색창 -->
			<div class="col wrap">
				<div class="search col" style="padding-left: 47px;">
					<input type="text" class="searchTerm col"
						placeholder="궁금한 점을 적어주세요">
					<button type="submit" class="searchButton" id="searchButton">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- //검색창 -->
</section>

<!-- 카테고리 -->
<div>
	<nav id="topMenu" class="container">
		<ul class="d-flex justify-content-center" style="padding-top: 16px;">
			<li><a class="menuLink" href="/customerCenter/FAQ">고객센터 홈</a></li>
			<li><a class="menuLink" href="/customerCenter/notice">공지사항</a></li>
			<li><a class="menuLink" href="/customerCenter/inquiry">1:1문의</a></li>
			<li><a class="menuLink" href="/customerCenter/question">자주
					묻는 질문</a></li>
		</ul>
	</nav>
</div>
<!-- //카테고리 -->
<hr>