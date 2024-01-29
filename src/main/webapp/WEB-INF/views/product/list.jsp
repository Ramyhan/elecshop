<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<title>제품화면</title>
<style>

	.divProduct {
		padding-top: 30px;
	}
	
	#divProd {
		transition: all 0.2s linear;
		background-color: #202020;
		border: solid 2px #202020;
	}
	
	#divProd:hover {
	  	transform: scale(1.1);
	}
	
	.prdName {
		text-align: center;
		font-weight: bold;
		font-size: 23px;
		font-fmaily: "고딕";
		font: bold;
		padding-top: 10px;
	}
	.prdInfo {
		text-align: center;
		font-size: 15px;
	}
	
	.btnProductInfo {
 		background-color:#ffbe33;
   		opacity: 0;
 		margin-top: 5px;
		border-radius:10px;
 		border:none; 
 		height:40px;
 		font: bold;
 		font-size: 15px;
	}
	
	#divSide {
		width: 280px;
		height: 100vh;
		float: left;
		margin: 30px 10px 0px 10px;
/*  		position: absolute; */
	}
	
	#divSideBar {
 		width: 280px;
 		height: 800px;
 		background-color: #202020;
 		border: solid 1px #ffbe33;
   		position: absolute;
    	overflow-y: auto;
	}
	
	#divSideBar::-webkit-scrollbar{
		width: 7px;
	}
	
	#divSideBar::-webkit-scrollbar-thumb{
		background: #ffbe33;
		border-radius: 10px;
	}
	
	#divSideBar::-webkit-scrollbar-thumb:hover{
		background-color:#FF9843;
	}
	
	

	
</style>
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
	<div id="main" style="color: white; text-align: center;">
		<div class="container-fluid">
			<div class="row">
				<img alt="카테고리 사진" src="/resources/images/laptop_main_image.jpg"/>
			</div>
			<div class="cal-md-12">
				<div class="section">
					<div>
						<div class="flex-container column" id="divSide">
							<div id="divSideBar"><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></div>
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

