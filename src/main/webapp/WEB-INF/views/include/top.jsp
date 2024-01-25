<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>div 태그</title>
	<!-- 부트스트랩 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- 메인 틀 -->	
  <link href="/resources/css/dongwi/my.css" rel="stylesheet" type="text/css" />
  
  
  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="/resources/css/dongwi/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="/resources/css/dongwi/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="/resources/css/dongwi/responsive.css" rel="stylesheet" />
  <!-- 글리피콘 -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>



<body>

	<div id="box">
		<!-- 상단바 -->
		<div id="top">
		<header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container " style="
    right: 50px;
    width: 1250px;
">
          <a class="navbar-brand" href="/main">
          <span>
            임시
          </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto ">
              <li class="nav-item"> <!-- active -->
                <a class="nav-link" href="/productList?ptype=1">노트북 <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">모니터</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">태블릿</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">음향기기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">주변기기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">고객센터</a>
              </li>
            </ul>
            <div class="user_option" style="
            margin-left: 100px;
				">
				<div class="dropdown user-icon">
              <a href="" class="user_link dropdown topbar-dropdown" data-toggle="dropdown">
                <i class="fa fa-user" aria-hidden="true">
                </i>
              </a>
               <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
               <c:choose>
               <c:when test="${not empty loginInfo }">
               	<span> ${loginInfo.mid } ${loginInfo.mname }</span>
				<a class="dropdown-item" href="#">마이페이지</a> 
               
               </c:when>
               <c:otherwise>
				<a class="dropdown-item" href="/login">로그인</a> 
				<a class="dropdown-item" href="/signup">회원가입</a> 
               </c:otherwise>
               </c:choose>
				</div>
				</div>
				<div class="dropdown">
				<a href="" class="dropdown topbar-dropdown user-search" data-toggle="dropdown">
                <i class="fa fa-search"></i>
                </a>
                <div class="dropdown-menu search-menu" aria-labelledby="dropdownMenuButton">
				<div class="search-bar">
 				 <input type="text" placeholder="검색어 입력">
 				 <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				 </div>
				</div>
				</div>
              <div class="dropdown">
              <a href="#" class="order_online dropdown topbar-dropdown" data-toggle="dropdown">
                장바구니
              </a>
              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
              <a class="dropdown-item" href="#"></a>
              </div>
            </div>
            </div>
          </div>
        </nav>
      </div>
    </header>
		</div>
		</div>
		<!-- //상단바 -->