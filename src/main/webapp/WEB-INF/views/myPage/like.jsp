<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<%@ include file="/WEB-INF/views/include/myPage_sidebar.jsp" %>
<link rel="stylesheet" href="/resources/css/productList/productList.css"/>

<script>
$(function() {
	
	$(".divProd").mouseover(function() {
		$(this).children(".btnProductInfo").css("opacity", "1");
		$(this).children(".deleteLike").css("opacity", "1");
	});
	
	$(".divProd").mouseout(function() {
		$(this).children(".btnProductInfo").css("opacity", "0");
		$(this).children(".deleteLike").css("opacity", "0");
	});
	
	
	// 찜삭제
	$(".deleteLike").click(function() {
		var that = $(this);
		var lno = parseInt(that.attr("data-lno"));
		var sData = {
				"lno" : lno
		}
		$.post("/like/removeLno", sData, function(rData) {
			if(rData == "true") {
				deleteTarget = that.parent().parent().parent();
				deleteTarget.fadeOut(500);
				var test = $("#divProduct").children();
				console.log("test: ", test);
			}
		});
	});
	
});
</script>
<div style=" height: 100%; background-color: #303030">
	<div class="myPage-like">
		<div class="container myPage-like-container" style="color: white;">
			<h1 style="color: white; font-family: 굴림체; margin-top:50px;">찜목록</h1>
			<div class="myPage-line"></div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="row" id="divProduct">
						<c:choose>
						<c:when test="${empty productDTO}">
							<div style="font-family: Gothic Neo; text-align: center;">
								<span>
									찜한 상품이 없습니다.<br>상품을 추가해 보세요.
								</span>
							</div>
						</c:when>
						<c:otherwise>
						<c:forEach var="productDTO" items="${productDTO}">
							<form action="/product/goods" method="get">
								<div class="col-md-4 divProduct">
									<div class="container">
										<div class="card divProd" id="divProd">
											<input type="hidden" name="pno" value="${ productDTO.pno }">
											<i class="fa fa-times-circle deleteLike" title="삭제하기"
												style="position: absolute; top: 10px; left: 235px; opacity: 0"
												data-lno="${productDTO.lno}"></i>
											<img alt="상품 사진" src="/display?fileName=${ productDTO.pimage_thoumb }" style="width:271px; height:271px;"/>
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
						</c:otherwise>
						</c:choose>
						</div><br>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>