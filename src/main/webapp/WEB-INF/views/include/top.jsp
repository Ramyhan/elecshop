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
  
  

  <!-- Custom styles for this template -->
  <link href="/resources/css/dongwi/style.css" rel="stylesheet" />
  <!-- 글리피콘 -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script>
$(function(){
	var registerResult = "${registerResult}";
	console.log(registerResult);
	if(registerResult == "success"){
		alert("회원가입을 축하합니다. 회원가입 쿠폰을 지급해드립니다.");
	}	
	
	$("#dailyCheck").on("click", function(e){
		e.preventDefault();
		$.post("/dailyCheck", function(rData){
			console.log(rData);
			if(rData == true){
				alert("출석체크 성공");
				var point = parseInt($("#myPoint").text()) + parseInt(500);
				$("#myPoint").text(point)
			}else if(rData == false){
				alert("이미 출석체크를 하셨습니다.");
			}
		});
		
	});
	
	var checkPoint = function(){
		$.post("/checkLogin", function(isLogin){
			if(isLogin == "true"){
				$.get("/getPoint", function(rData){
					console.log(rData);					
					$("#myPoint").text(rData);
				});
			}
			
		});
		
	}
	
	setInterval(checkPoint, 5000);
	
});
</script>
</head>

<body>

	<div id="box">
		<!-- 상단바 -->
		<div id="top">
		<header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container " style="
    right: 50px;
    width: 1300px;
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
<!--             <ul class="navbar-nav  mx-auto "> -->
            <ul class="navbar-nav">
              <li class="nav-item"> <!-- active -->
                <a class="nav-link" href="/product/list?ptype=1">노트북 <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/product/list?ptype=2">모니터</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/product/list?ptype=3">태블릿</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/product/list?ptype=4">음향기기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/product/list?ptype=5">주변기기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/customerCenter/FAQ">고객센터</a>
              </li>
            </ul>
            <div class="user_option" style="">
            <c:choose>
            <c:when test="${not empty loginInfo}">
            <div id="user_info">
          	 <p>${loginInfo.mid}</p>
             <p>포인트:<span id="myPoint">${loginInfo.mpoint }</span></p>
            </div>
            
            </c:when>
            </c:choose>
            
				<div class="dropdown user-icon">
              <a href="" class="user_link dropdown topbar-dropdown" data-toggle="dropdown">
                <i class="fa fa-user" aria-hidden="true">
                </i>
              </a>
               <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
               <c:choose>
               <c:when test="${not empty loginInfo }">
				<a class="dropdown-item" href="/myPage/myInfo">마이페이지</a>
				<a class="dropdown-item" id="dailyCheck">출석체크</a>
				<a class="dropdown-item" href="/buy">구매페이지</a>
				<a class="dropdown-item" href="/logout">로그아웃</a> 
               
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
              <div>
              <a href="/cart" class="order_online">
                장바구니
              </a>
<!--               <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> -->
<!--               <a class="dropdown-item" href="#"></a> -->
<!--               </div> -->
            </div>
            </div>
            <c:choose>
            <c:when test="${loginInfo.mid == 'admin'}">
            	<div style="width: 20px;">
	            	<a href="/admin/admin_dashboard" style="border: 1px solid; display: block;">관리자</a>
            	</div>
            </c:when>
            </c:choose>
          </div>
        </nav>
      </div>
    </header>
		</div>
		</div>
		<!-- //상단바 -->