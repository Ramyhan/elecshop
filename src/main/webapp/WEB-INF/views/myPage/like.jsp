<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/top.jsp"%>

<link rel="stylesheet" href="/resources/css/productList/productList.css"/>

<script>
$(function() {
	
	$(".divProd").mouseover(function() {
		$(this).children(".btnProductInfo").css("opacity", "1");
	});
	
	$(".divProd").mouseout(function() {
		$(this).children(".btnProductInfo").css("opacity", "0");
	});
	
	$(".btnProductInfo").mouseover(function() {
		$(this).css("background-color", "#FF9843");
// 		$(this).css("color", "white");
	});
	$(".btnProductInfo").mouseout(function() {
		$(this).css("background-color", "#ffbe33");
		$(this).css("color", "black");
	});
	
});
</script>
<div>
	<div class="myPage-like">
		<%@ include file="/WEB-INF/views/include/myPage_sidebar.jsp" %>
		<div class="container myPage-like-container" style="color: white;">
			<h1 style="color: white; font-family: 굴림체; padding-top:10px;">찜목록</h1>
			<div class="myPage-line"></div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="row" id="divProduct">
							<form action="/product/goods" method="get">
								<div class="col-md-4 divProduct">
									<div class="container">
										<div class="card divProd" id="divProd">
											<input type="hidden" name="pno" value="">
											<img alt="상품 사진" src="/resources/images/galaxybook4pro.png" style="width:271px; height:271px;"/>
											<button class="btnProductInfo" type="submit">자세히 알아보기>></button>
											<span class="prdName">test<br><br></span>
											<span class="prdInfo">
												test<br>
												test
											</span>
										</div>
									</div>
								</div>
							</form>
							<form action="/product/goods" method="get">
								<div class="col-md-4 divProduct">
									<div class="container">
										<div class="card divProd" id="divProd">
											<input type="hidden" name="pno" value="">
											<img alt="상품 사진" src="/resources/images/galaxybook4pro.png" style="width:271px; height:271px;"/>
											<button class="btnProductInfo" type="submit">자세히 알아보기>></button>
											<span class="prdName">test<br><br></span>
											<span class="prdInfo">
												test<br>
												test
											</span>
										</div>
									</div>
								</div>
							</form>
							<form action="/product/goods" method="get">
								<div class="col-md-4 divProduct">
									<div class="container">
										<div class="card divProd" id="divProd">
											<input type="hidden" name="pno" value="">
											<img alt="상품 사진" src="/resources/images/galaxybook4pro.png" style="width:271px; height:271px;"/>
											<button class="btnProductInfo" type="submit">자세히 알아보기>></button>
											<span class="prdName">test<br><br></span>
											<span class="prdInfo">
												test<br>
												test
											</span>
										</div>
									</div>
								</div>
							</form>
						</div><br>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>