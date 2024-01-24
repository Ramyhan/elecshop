<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <a class="nav-link" href="#">노트북 <span class="sr-only">(current)</span></a>
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
				<a class="dropdown-item" href="#">로그인</a> 
				<a class="dropdown-item" href="#">회원가입</a> 
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
		
		<!-- 공지 -->
		<div id="notice" class="container-fluid" style="text-align: center; color:white; padding-top: 9px;">
		 <p>공지</p>
		</div>
		<!-- //공지 -->
		
	<!-- 메인 -->
	<div id="main" style="text-align: center;" >
	<div class="container-fluid main-container">
		<div class="row">
			<div class="carousel slide" id="carousel-611398">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-611398" class="active">
					</li>
					<li data-slide-to="1" data-target="#carousel-611398">
					</li>
					<li data-slide-to="2" data-target="#carousel-611398">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" alt="Carousel Bootstrap First" src="/resources/images/main_img.png" />
						<div class="carousel-caption">
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second" src="/resources/images/main2_img.png" />
						<div class="carousel-caption">
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Third" src="/resources/images/main3_img.png" />
						<div class="carousel-caption">
						</div>
					</div>
				</div> <a class="carousel-control-prev" href="#carousel-611398" data-slide="prev"><span class="carousel-control-prev-icon"></span> 
				<span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-611398" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
			</div>
		</div>
</div>
	<!-- //메인 -->
		<!-- 메인2 -->
		<div class="container-fluid main2">
<!-- 			<div class="row"> -->
				<div class="sub-left">
					<div class="container sub-title">
					<h2>델 에일리언웨어 M18</h2>
						<div class="container sub-text">
							<p>
							최고의 성능
							</p>
						</div>
						<div class="container a-link">
							<a class="a-style a-left" href="#">상세 페이지
							<span class="a-span">></span>
							</a>
							<a class="a-style a-right" href="#">장바구니
							<span class="a-span ">></span>
							</a>
						</div>
					</div>
					<img class="sub-img" src="/resources/images/left_img.jpg">
				</div>
				<div class="sub-right">
				<div class="container sub-title">
					<h2>로지텍 G903</h2>
						<div class="container sub-text">
							<p>
							저지연, 빠른응답속도
							</p>
						</div>
						<div class="container a-link">
							<a class="a-style a-left" href="#">상세 페이지
							<span class="a-span">></span>
							</a>
							<a class="a-style a-right" href="#">장바구니
							<span class="a-span ">></span>
							</a>
						</div>
					</div>
					<img class="sub-img" src="/resources/images/right_img.jpeg">
				</div>
<!-- 			</div> -->
		</div>
		<!-- //메인2 -->
				<!-- 카드1 -->
		<div class="section">
			<div class="container card-container">
<!-- 			<div class="row"> -->
			  <div class="card bg-dark">
			  <img class="card-img-top" src="/resources/images/notebook.jpg" alt="Card image">
			  <div class="card-body">
			    <h4 class="card-title">갤럭시북3 프로 GalaxyBook pro</h4>
			    <p class="card-text">
			    16인치16인치16인치16인치16인치</p>
			    <div>
			    <p class="card-price">
			     	1,300,000원
			    </p>
			    </div>
			    <div class="row card-icon">
			    <div class="col-md-6">
			    <i class="fa fa-heart"></i>
			    </div>
			    <div class="col-md-6">
			    <i class="fa fa-shopping-cart"></i>
			    </div>
			    </div>
			  </div>
			</div>
				<!-- //카드 -->
				<!-- 카드2 -->
			  <div class="card bg-dark">
			  <img class="card-img-top" src="/resources/images/tablet.png" alt="Card image">
			  <div class="card-body">
			    <h4 class="card-title">아이패드 프로3 5세대</h4>
			    <p class="card-text">
			    디스플레이 · 32.8cm(대각선) 미니 LED 백라이트 · 2732 x 2048 픽셀</p>
			    <div>
			    <p class="card-price">
			     	1,480,000원
			    </p>
			    </div>
			    <div class="row card-icon">
			    <div class="col-md-6">
			    <i class="fa fa-heart"></i>
			    </div>
			    <div class="col-md-6">
			    <i class="fa fa-shopping-cart"></i>
			    </div>
			    </div>
			  </div>
			</div>
				<!-- //카드 -->
				<!-- 카드3 -->
			  <div class="card bg-dark">
			  <img class="card-img-top" src="/resources/images/headset.jpg" alt="Card image">
			  <div class="card-body">
			    <h4 class="card-title">젠하이저 HD660S</h4>
			    <p class="card-text">
			     오픈형 헤드폰 3.5mm / 150Ω / 104dB / 10Hz~41KHz</p>
			    <div>
			    <p class="card-price">
			     	599,000원
			    </p>
			    </div>
			    <div class="row card-icon">
			    <div class="col-md-6">
			    <i class="fa fa-heart"></i>
			    </div>
			    <div class="col-md-6">
			    <i class="fa fa-shopping-cart"></i>
			    </div>
			    </div>
			  </div>
			</div>
				<!-- //카드 -->
				<!-- 카드4 -->
			  <div class="card bg-dark">
			  <img class="card-img-top" src="/resources/images/monitor.jpg" alt="Card image">
			  <div class="card-body">
			    <h4 class="card-title">델 에일리언웨어 AW2721D</h4>
			    <p class="card-text">
			    68.47cm(27인치) / 와이드(16:9) / IPS / 평면 / 광시야각 / 2560 x 1440(QHD) 
			    </p>
			    <div>
			    <p class="card-price">
			     	499,000원
			    </p>
			    </div>
			    <div class="row card-icon">
			    <div class="col-md-6">
			    <i class="fa fa-heart"></i>
			    </div>
			    <div class="col-md-6">
			    <i class="fa fa-shopping-cart"></i>
			    </div>
			    </div>
			  </div>
			</div>
<!-- 			</div> -->
		</div>
			</div>
				<!-- //카드 -->
				<!-- 카드1 -->
		<div class="section">
			<div class="container card-container">
<!-- 			<div class="row"> -->
			  <div class="card bg-dark">
			  <img class="card-img-top" src="/resources/images/notebook.jpg" alt="Card image">
			  <div class="card-body">
			    <h4 class="card-title">갤럭시북3 프로 GalaxyBook pro</h4>
			    <p class="card-text">
			    16인치16인치16인치16인치16인치</p>
			    <div>
			    <p class="card-price">
			     	1,300,000원
			    </p>
			    </div>
			    <div class="row card-icon">
			    <div class="col-md-6">
			    <i class="fa fa-heart"></i>
			    </div>
			    <div class="col-md-6">
			    <i class="fa fa-shopping-cart"></i>
			    </div>
			    </div>
			  </div>
			</div>
				<!-- //카드 -->
				<!-- 카드2 -->
			  <div class="card bg-dark">
			  <img class="card-img-top" src="/resources/images/tablet.png" alt="Card image">
			  <div class="card-body">
			    <h4 class="card-title">아이패드 프로3 5세대</h4>
			    <p class="card-text">
			    디스플레이 · 32.8cm(대각선) 미니 LED 백라이트 · 2732 x 2048 픽셀</p>
			    <div>
			    <p class="card-price">
			     	1,480,000원
			    </p>
			    </div>
			    <div class="row card-icon">
			    <div class="col-md-6">
			    <i class="fa fa-heart"></i>
			    </div>
			    <div class="col-md-6">
			    <i class="fa fa-shopping-cart"></i>
			    </div>
			    </div>
			  </div>
			</div>
				<!-- //카드 -->
				<!-- 카드3 -->
			  <div class="card bg-dark">
			  <img class="card-img-top" src="/resources/images/headset.jpg" alt="Card image">
			  <div class="card-body">
			    <h4 class="card-title">젠하이저 HD660S</h4>
			    <p class="card-text">
			     오픈형 헤드폰 3.5mm / 150Ω / 104dB / 10Hz~41KHz</p>
			    <div>
			    <p class="card-price">
			     	599,000원
			    </p>
			    </div>
			    <div class="row card-icon">
			    <div class="col-md-6">
			    <i class="fa fa-heart"></i>
			    </div>
			    <div class="col-md-6">
			    <i class="fa fa-shopping-cart"></i>
			    </div>
			    </div>
			  </div>
			  </div>
<!-- 			</div> -->
				<!-- //카드 -->
			</div>
		</div>
				<!-- //카드 -->
	</div>
	<!-- //메인 -->

<!-- 하단 -->
<footer>
	<div class="container footer-container">
			<div class="row">
				<div class="footer-top">
					<label class="footer-label">카테고리</label>
					<div class="footer-list">
						<ul>
							<li>노트북</li>
							<li>모니터</li>
							<li>태블릿</li>
							<li>음향기기</li>
							<li>주변기기</li>
						</ul>
					</div>
				</div>
				<div class="footer-top">
					<label class="footer-label">마이페이지</label>
					<div class="footer-list">
						<ul>
							<li>회원정보</li>
							<li>회원정보 수정</li>
							<li>포인트</li>
							<li>구매한 제품 등록</li>
							<li>회원탈퇴</li>
						</ul>
					</div>
				</div>
				<div class="footer-top">
					<label class="footer-label">고객센터</label>
					<div class="footer-list">
						<ul>
							<li>고객센터 홈</li>
							<li>공지사항</li>
							<li>1:1 문의</li>
							<li>자주 묻는 질문</li>
						</ul>
					</div>
				</div>
				<div class="footer-top">
					<label class="footer-label">회사소개</label>
					<div class="footer-list">
						<ul>
							<li>오시는 길</li>
							<li>주소 : 서울</li>
							<li>070-0000-0000</li>
							<li>개발자</li>
							<li>채용 되고 싶다</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 줄 긋기 -->
		<div class="container container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="footer-line"></div>
			</div>
			</div>
		</div>
		<div class="container container-fluid">
		<div class="row">
			<p style="font-size: 11px; color: #808080; padding-left: 45%;">kimdongwi @ project</p>
		</div>
		</div>
</footer>
<!-- /하단 -->

</body>

</html>