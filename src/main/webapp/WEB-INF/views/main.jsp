<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<script>
$(function() {
	$(".top8product").click(function() {
		var pno = $(this).attr("data-pno");
		var url = "/product/goods?pno=" + pno;
		location.href = url;
	});
	
	
});
</script>
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
		<div class="container-fluid sub-main">
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
							<a class="a-style a-left" href="/product/goods?pno=19">상세 페이지
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
<!-- 		카드 -->
		<div class="section">
			<div class="container main-card-container">
				<!-- 카드1 -->
				<c:forEach items="${productList}" var="productDTO" begin="0" end="3">
			  <div class="card bg-dark main-card top8product" data-pno="${productDTO.pno}">
			  <img class="card-img-top main-card-img-top" src="/display?fileName=${ productDTO.pimage_thoumb }" alt="Card image">
			  <div class="card-body main-card-body">
			    <h4 class="card-title main-card-title">${productDTO.pname}</h4>
			    <p class="card-text">${productDTO.pinfo_main}</p>
			    <div>
			    <p class="card-price main-card-price">
			     	<fmt:formatNumber pattern="#,###">${productDTO.pprice}</fmt:formatNumber>원
			    </p>
			    </div>
			    <div class="row main-card-icon">
			    <div class="col-md-6">
<!-- 			    <i class="fa fa-heart"></i> -->
			    </div>
			    <div class="col-md-6">
<!-- 			    <i class="fa fa-shopping-cart"></i> -->
			    </div>
			    </div>
			  </div>
			</div>
			</c:forEach>
				<!-- //카드1 -->
			</div>
		</div>
				<!-- //카드 -->
<!-- 		카드 -->
		<div class="section">
			<div class="container main-card-container">
				<!-- 카드1 -->
			<c:forEach items="${productList}" var="productDTO" begin="4" end="7">
			  <div class="card bg-dark main-card top8product" data-pno="${productDTO.pno}">
			  <img class="card-img-top main-card-img-top" src="/display?fileName=${ productDTO.pimage_thoumb }" alt="Card image">
			  <div class="card-body main-card-body">
			    <h4 class="card-title main-card-title">${productDTO.pname}</h4>
			    <p class="card-text">${productDTO.pinfo_main}</p>
			    <div>
			    <p class="card-price main-card-price">
			     	<fmt:formatNumber pattern="#,###">${productDTO.pprice}</fmt:formatNumber>원
			    </p>
			    </div>
			    <div class="row main-card-icon">
			    <div class="col-md-6">
<!-- 			    <i class="fa fa-heart"></i> -->
			    </div>
			    <div class="col-md-6">
<!-- 			    <i class="fa fa-shopping-cart"></i> -->
			    </div>
			    </div>
			  </div>
			</div>
		    </c:forEach>
				<!-- //카드1 -->
			</div>
		</div>
				<!-- //카드 -->
	</div>
	<!-- //메인 -->
<%@ include file="/WEB-INF/views/include/bottom.jsp"  %>