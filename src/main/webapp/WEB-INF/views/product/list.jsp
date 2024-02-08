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
	
	
	// 검색창으로 상품 검색
	$("#inputSearch").on("propertychange change paste input", function() { search() });
	// 재조사명으로 상품 검색	
	$(".chkManu").change(function() { search() });
	// 옵션으로 상품 검색	
	$(".chkOption").change(function() { search() });
	
	// 검색 함수
	var search = function () {
		var ptype = "${ptype}";
		var keyword = $("#inputSearch").val();
		
		var chkManus = $(".chkManu:checked");
		var manuval = [];
		chkManus.each(function() {
			var value = $(this).val();
			manuval.push(value);
		});
		var str_manuval = manuval.join();
		
		
		
		var chkOptions = $(".chkOption:checked");
		var optionval = [];
		chkOptions.each(function() {
			var value = $(this).val();
			optionval.push(value);
		});
		var str_optionval = optionval.join();
		console.log("str_optionval: ", str_optionval);
		
		
		
		var sData = {
				"ptype" : ptype,
				"keyword" : keyword,
				"manuval" : str_manuval,
				"optionval" : str_optionval
		}
		console.log("str_manuval: ", str_manuval);
		$.post("/product/searchKeyword", sData, function(rData) {
			$("#divProduct").empty();
			
			var products = "";
			for(var v = 0; v < rData.length; v++) {
				products += "<form action=\'/product/goods\' method=\'get\'>";
				products += "<div class=\'col-md-4 divProduct\'>";
				products += "<div class=\"container\">";
				products += "<div class=\"card divProd\" id=\"divProd\">";
				products += "<input type=\"hidden\" name=\"pno\" value=\"" + rData[v].pno + "\">";
				products += "<img alt=\"상품 사진\" src=\"/resources/images/" + rData[v].pimage_thoumb + "\" style=\"width:271px; height:271px;\"/>";
				products += "<button class=\"btnProductInfo\" type=\"submit\">자세히 알아보기>></button>";
				products += "<span class=\"prdName\">" + rData[v].pname + "<br><br></span>";
				products += "<span class=\"prdInfo\">" + rData[v].pcode + "<br>" + rData[v].pinfo_main + "</span>";
				products += "</div></div></div></form>";
			}
			$("#divProduct").append(products);
		});
	}
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
								<div style="border-top: solid 1px #ffbe33;">
									<div class="opSearch option1 opTitle">제조사</div>
									<div class="opSearch opInfo1">
									<c:forEach items="${manufacturerList}" var="manuList">
										<input class="chkManu" type="checkbox" value="${manuList.mno}">${manuList.mname}<br>
									</c:forEach>
									</div>
								</div>
								<c:choose>
								<c:when test="${ptype == 1 || ptype == 3}">
								<div style="border-top: solid 1px #ffbe33; font: bold;">
									<div class="opSearch option2 opTitle">SSD</div>
									<div class="opSearch opInfo2">
										<input class="chkOption" type="checkbox" value="128G">128G<br>
										<input class="chkOption" type="checkbox" value="256G">256G<br>
										<input class="chkOption" type="checkbox" value="512G">512G<br>
										<input class="chkOption" type="checkbox" value="1T">1T<br>
									</div>
								</div>
								<div style="border-top: solid 1px #ffbe33; font: bold;">
									<div class="opSearch option3 opTitle">RAM</div>
									<div class="opSearch opInfo3">
										<input class="chkOption" type="checkbox" value="16G">16G<br>
										<input class="chkOption" type="checkbox" value="32G">32G<br>
										<input class="chkOption" type="checkbox" value="64G">64G<br>
									</div>
								</div>
								</c:when>
								<c:when test="${ptype == 4}">
								<div style="border-top: solid 1px #ffbe33; font: bold;">
									<div class="opSearch option2 opTitle">제품</div>
									<div class="opSearch opInfo2">
										<input class="chkOption" type="checkbox" value="1">스피커<br>
										<input class="chkOption" type="checkbox" value="2">헤드셋<br>
										<input class="chkOption" type="checkbox" value="3">이어폰<br>
									</div>
								</div>
								</c:when>
								<c:when test="${ptype == 5}">
								<div style="border-top: solid 1px #ffbe33; font: bold;">
									<div class="opSearch option2 opTitle">제품</div>
									<div class="opSearch opInfo2">
										<input class="chkOption" type="checkbox" value="4">마우스<br>
										<input class="chkOption" type="checkbox" value="5">키보드<br>
									</div>
								</div>
								</c:when>
								</c:choose>
							</div>
						</div>
						<div class="row" id="divProduct">
						<c:forEach items="${ productDTOList }" var="productDTO">
							<form action="/product/goods" method="get">
								<div class="col-md-4 divProduct" id="testClone">
									<div class="container">
										<div class="card divProd product-card" id="divProd">
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

