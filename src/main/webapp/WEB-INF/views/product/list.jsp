<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<link rel="stylesheet" href="/resources/css/productList/productList.css" />
<script>
$(function() {
	$(window).scroll(function() {
		var currentPosition = parseInt($("#divSideBar").css("top"));
		var position = $(window).scrollTop(); 
// 			console.log("currentPosition: ", currentPosition);
		if (position <= 700) {
			$("#divSideBar").stop().animate({"top":"760px"},500);
		} else {
			$("#divSideBar").stop().animate({"top" : position + "px"},1000);
		}
		
	});
	
	
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
</head>
<body>
	<!-- 메인 -->
	<div id="main" style="color: white;">
		<div class="container-fluid">
			<div class="row">
				<img alt="카테고리 사진" src="/resources/images/laptop_main_image.jpg"/>
			</div>
			<div class="cal-md-12">
				<div class="section">
					<div>
						<div class="flex-container column" id="divSide">
							<div id="divSideBar">
								<div class="divSearch">
									<input id="inputSearch" type="text" placeholder="검색어를 입력하세요.">
									<i id="iconSearch" class="fa fa-search"></i>
								</div>
								<div class="opSearch option1">SSD</div>
								<div class="opSearch opInfo">
									<input type="checkbox" value="">128G<br>
									<input type="checkbox" value="">256G<br>
									<input type="checkbox" value="">512G<br>
									<input type="checkbox" value="">1T
								</div>
							</div>
						</div>
						<div class="row" id="divProduct">
						<c:forEach items="${ productDTOList }" var="productDTO">
							<form action="/product/goods" method="get">
								<div class="col-md-4 divProduct">
									<div class="container">
										<div class="card divProd" id="divProd">
											<input type="hidden" name="pno" value="${ productDTO.pno }">
											<img alt="상품 사진" src="/resources/images/${ productDTO.pimage_thoumb }" style="width:271px; height:271px;"/>
											<button class="btnProductInfo" type="submit">자세히 알아보기>></button>
											<span class="prdName">${productDTO.pname}<br><br></span>
											<span class="prdInfo">
												${productDTO.pcode}<br>
												${productDTO.pinfo_main}
											</span>
										</div>
									</div>
								</div>
							</form>
						</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //메인 -->



<%@ include file="/WEB-INF/views/include/bottom.jsp"%>

