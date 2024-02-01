<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div>
<div class="div-buy">
	<div class="container">
		<div class="buy-title">
			<h1>주문결제</h1>
			<div class="myPage-line"></div>
			<div class="buy-info">
				<h3>배송정보</h3>
				 <p>${loginInfo.mname }</p>
				 <p id="product-ophone"><c:set var="num" value="${loginInfo.mphone }" />
				  	${fn:substring(num,0,3) }-${fn:substring(num,3,7) }-${fn:substring(num,7,11) }
				</p>
				<p id="product-mpost_code">(${loginInfo.mpost_code }) <span id="product-maddr">${loginInfo.maddr }</span></p>
				<input id="product-maddr_detail" name="maddr_detail" type="text" value="${loginInfo.maddr_detail }">
				
				<button type="button" id="btn-addr-search" class="btn btn-warning">주소 검색</button>
			</div>
<!-- 			<div class="myPage-line-gray"></div> -->
			<div class="buy-title">
			<h1>주문상품</h1>
			<div class="myPage-line"></div>
<!-- 						상품 -->
					<form id="order_detail">
					
					<c:forEach var="buyVO" items="${cartList }">
					<div class="buy-prodect row buy-product">
						<div>
							<img class="buy-image" src="/resources/images/${buyVO.pimage_thoumb }">
						</div>
						<div class="buy-prodect-pname">
							<br>
							<p id="product-oname">${buyVO.pname }</p>
							<ul>
							 <li><strong>옵션</strong><span id="product-ooption"><c:set var="coption" value="${fn:split(buyVO.coption, ',')}"/>
							 <c:forEach var="coption" items="${coption }">${coption }<br></c:forEach></span>
							 </li>
							</ul>
						</div>
						<div class="buy-prodect-count">
							<p>수량:1개</p>
						</div>
						<div class="buy-prodect-price">
							<p class="prodect-price">${buyVO.cprice }</p>
						</div>
						<div class="buy-prodect-delivery">
							<p>무료배송<p>
						</div>
					</div>
					</c:forEach>
					</form>
<!-- 					//상품 -->
<!-- 					쿠폰 -->
					<div class="buy-coupon">
					<div class="buy-title">
					<h1>할인/포인트</h1>
					</div>
					<div class="myPage-line"></div>
					<div class="buy-coupon">
					<i class="fa fa-ticket-alt"></i> <span>쿠폰할인</span>
					</div>
					<div class="buy-select-coupon">
						<p>상품쿠폰</p>
						<select id="select-coupon">
						<option value="0">선택 안함</option>
						<c:forEach var="vo" items="${myCoupon }">
						<option value="${vo.sale }">${vo.coupon_name }</option>
						</c:forEach>
						</select>
						<button id="btn-coupon" class="btn btn-warning" type="button">쿠폰 적용</button>
					</div>
					<br>
					<div class="buy-line"></div>
					</div>
<!-- 					//쿠폰 -->
					<br>
					<div class="buy-point">
					<div>
						<i class="fab fa-bitcoin"></i><span>포인트 사용</span>
						<input id="input-point" type="number" value="${loginInfo.mpoint }">
						<button id="btn-point" type="button" class="btn btn-warning">포인트 적용</button>
					</div>
						<div class="buy-myPoint">
						<span>사용 가능 포인트</span> 
						<span id="member-point">${loginInfo.mpoint }</span>
						</div>
					</div>
				</div>
		</div>
	</div>
		<div class="buy-price" style="width: 400px; margin-top: 10%;">
		<div class="col buy-col">
		<h2>결제 예정금액</h2>
		<p>상품금액 : <span id="result-price"></span></p>
		<p>배송비 : <span id="result-delivery">무료</span></p>
		<p>쿠폰 : <span id="result-coupon">0</span></p>
		<p>포인트 : <span id="result-point">0</span></p>
		<h2 class="buy-result">합계 : <span class="buy-result" id="result-total">없음</span></h2>
		<button id="btn-buy" class="btn btn-warning btn-buy" type="button"></button>
		</div>
		</div>
</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function (){
// 	초기 가격 설정
	var prices = $(".prodect-price");
	var totalPrice = 0;
	console.log(prices);
	prices.each(function(){
		totalPrice += parseInt($(this).text());
	});
	
	$("#result-price").text(totalPrice.toLocaleString());
	$("#result-total").text(totalPrice.toLocaleString());
	$("#btn-buy").text(totalPrice.toLocaleString() + "원 결제");
	
// 	쿠폰 할인
	$("#btn-coupon").click(function(){
		var couponSale = parseInt($("#select-coupon").find(":selected").val());
		var total = $("#result-price").text().replace(/,/g, "");
		var point = parseInt($("#result-point").text().replace(/,/g, ""));
		console.log(point);
		var sale = parseInt(total) / couponSale;
		if(couponSale == 0){
			sale = 0;
		$("#result-coupon").text("" + sale.toLocaleString());
		$("#result-total").text(((total - sale) + point).toLocaleString());
		$("#btn-buy").text(((total - sale) + point).toLocaleString() + "원 결제");
			return;
		}
		
		$("#result-total").text(((total - sale) + point).toLocaleString());
		$("#result-coupon").text("-" + sale.toLocaleString());
		$("#btn-buy").text(((total - sale) + point).toLocaleString() + "원 결제");
	});
// 	포인트 할인
	$("#btn-point").click(function(){
		var point = parseInt($("#input-point").val());
		var myPoint = parseInt($("#member-point").text());
		var coupon = parseInt($("#result-coupon").text().replace(/,/g, ""));
		console.log(coupon);
		if(myPoint < point){
			alert("보유 포인트를 초과하였습니다.");
		}else {
			$("#result-point").text("-"+point.toLocaleString());
			var total = parseInt($("#result-price").text().replace(/,/g, ""));
			console.log(total);
			$("#result-total").text(((total + coupon)-point).toLocaleString());
			$("#btn-buy").text(((total + coupon)-point).toLocaleString() + "원 결제");
		}
		
	});
	
	$("#btn-buy").click(function(){
		var product = $(".buy-product");
		var mid = "${loginInfo}";
		var oname = $("#product-oname").text();
		var ooption = $("#product-ooption").text().trim();
		var ophone = $("#product-ophone").text().trim();
		var oprice = $("#result-total").text().replace(/,/g, "");
		var oaddr = $("#product-maddr").text();
		var oaddr_detail = $("#product-maddr_detail").text();
		var opost_code = $("#product-opost_code").text();
		
		console.log(oname);
		console.log(ooption);
		console.log(ophone);
		console.log(oprice);
		console.log(oaddr);
		console.log(oaddr_detail);
		console.log(opost_code);
		
		if(product.length > 1){
			product.find()
		}
		console.log(product);
	});
	
	$("#order_detail").submit(function(){
		var product = $(".buy-product");
		console.log(product);
		for(var v = 0; v < prodeut.length; v++){
		var pno = "<input type='hidden' value='' name='list["+i+"].pno'>";
		var ono = "<input type='hidden' value='' name='list["+i+"].ono'>";
		var product_count = "<input type='hidden' value='' name='list["+i+"].product_count'>";
		}
		
	});
// 카카오 주소
	$("#btn-addr-search").click(function(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	        	var roadAddr = data.roadAddress;
	        	var post_code = data.zonecode;
	        	$("#addr").text("(" + post_code + ") " + roadAddr);
	        }
	    }).open();
			
		})
});
</script>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>