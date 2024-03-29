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
				 <input id="product-oname" type="text" value="${loginInfo.mname }">
				 <p id="product-ophone"><c:set var="num" value="${loginInfo.mphone }" />
				  	${fn:substring(num,0,3) }-${fn:substring(num,3,7) }-${fn:substring(num,7,11) }
				</p>
				<span id="product-mpost_code" data-type-mpost_code="${loginInfo.mpost_code }">(${loginInfo.mpost_code }) </span><span id="product-maddr">${loginInfo.maddr }</span>
				<br>
				<input id="product-maddr_detail" name="maddr_detail" type="text" value="${loginInfo.maddr_detail }">
				
				<button type="button" id="btn-addr-search" class="btn btn-warning">주소 검색</button>
			</div>
<!-- 			<div class="myPage-line-gray"></div> -->
			<div class="buy-title">
			<h1>주문상품</h1>
			<div id="checkbox-div">
			<input type="checkbox" id="check-all" checked>
			</div>
			<div class="myPage-line"></div>
<!-- 						상품 -->
					<form id="order_detail" action="/order" method="post">
					<input type="hidden" id="mid" name="mid">
					<input type="hidden" id="ppoint" name="point">
					<input type="hidden" id="coupon_no" name="coupon_no">
					<input type="hidden" id="oname" name="oname">
					<input type="hidden" id="ophone" name="ophone">
					<input type="hidden" id="oprice" name="oprice">
					<input type="hidden" id="oaddr" name="oaddr">
					<input type="hidden" id="oaddr_detail" name="oaddr_detail">
					<input type="hidden" id="opost_code" name="opost_code">
					<input type="hidden" id="odelivery" name="odelivery">
					<c:forEach var="buyVO" items="${cartList }">
					<div class="buy-prodect row buy-product">
						<div>
							<img class="buy-image" src="/display?fileName=${buyVO.pimage_thoumb }">
						</div>
						<div class="buy-prodect-pname buy-pno" data-pno="${buyVO.pno }">
							<br>
							<p class="prodect-opname" id="product-opname">${buyVO.pname }</p>
							<ul>
							 <li><strong>옵션</strong><span class="product-ooption"><c:set var="coption" value="${fn:split(buyVO.coption, ',')}"/>
							 <c:forEach var="coption" items="${coption }">${coption }<br></c:forEach></span>
							 </li>
							</ul>
						</div>
						<div class="buy-prodect-count" data-cart_no="${buyVO.cno }">
							<p>수량:<span class="odproduct_count">1</span>개</p>
						</div>
						<div class="buy-prodect-price">
							<p class="prodect-price">${buyVO.cprice }</p>
						</div>
						<div class="buy-prodect-delivery">
							<p>무료배송<p>
						</div>
						<div class="buy-prodect-checkbox">
							<input type="checkbox" class="checkbox-price" checked>
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
						<option value="${vo.sale }" data-cno="${vo.cno }">${vo.coupon_name }</option>
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
		<div class="buy-price">
		<div class="col buy-col">
		<h2>결제 예정금액</h2>
		<p>상품금액 : <span id="result-price"></span></p>
		<p>배송비 : <span id="result-delivery">무료</span></p>
		<p>쿠폰 : <span id="result-coupon">0</span></p>
		<p>포인트 : <span id="result-point">0</span></p>
		<h2 class="buy-result">합계 : <span class="buy-result" id="result-total">없음</span></h2>
		<button id="btn-buy" class="btn btn-warning btn-buy" type="button"></button>
		<div id="div-kakaopay">
		<img style="cursor:pointer;" id="btn-kakaopay" src="/resources/images/kakaopay.png">
		</div>
	
		</div>
		</div>
</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(function (){
// 	초기 가격 세팅
	var prices = $(".prodect-price");
	var totalPrice = 0;
	prices.each(function(i){
		totalPrice += parseInt($(this).text());
	});
	
	$("#result-price").text(totalPrice.toLocaleString());
	$("#result-total").text(totalPrice.toLocaleString());
	$("#btn-buy").text(totalPrice.toLocaleString() + "원 결제");
	
// 	상품 전체 선택
	$("#check-all").click(function(){
		if($(this).prop("checked")){
			$(".checkbox-price").prop("checked", true);
			var prices = $(".prodect-price");
			totalPrice = 0;
// 			console.log(prices);
			prices.each(function(i){
				totalPrice += parseInt($(this).text());
			});
			$("#result-price").text(totalPrice.toLocaleString());
			$("#result-total").text(totalPrice.toLocaleString());
			$("#btn-buy").text(totalPrice.toLocaleString() + "원 결제");
			$("#btn-coupon").trigger("click");
			$("#btn-point").trigger("click");
		}else{
			totalPrice = 0;
			$(".checkbox-price").prop("checked", false);
			$("#result-price").text(totalPrice);
			$("#result-total").text(totalPrice);
			$("#input-point").val(0);
			$("#select-coupon").find("option:eq(0)").prop("selected", true);
			$("#btn-coupon").trigger("click");
			$("#btn-point").trigger("click");
		}
	});
	
// 	상품 단일 선택
	$(".checkbox-price").click(function(){
		if($("input[class='checkbox-price']:checked").length == $(".checkbox-price").length){
			$("#check-all").prop("checked", true);
		}else{
			$("#check-all").prop("checked", false);
		}
		if($(this).is(":checked") == true){
		    var price = $(this).parent().parent().find(".prodect-price").text();
			totalPrice += parseInt(price);
			$("#result-price").text(totalPrice.toLocaleString());
			$("#result-total").text(totalPrice.toLocaleString());
			$("#btn-buy").text(totalPrice.toLocaleString() + "원 결제");
			$("#btn-coupon").trigger("click");
// 			$("#btn-point").trigger("click");
// 			console.log(totalPrice);
		}
		if($(this).is(":checked") == false){
// 		    console.log('체크 안 된 상태');
		    var price = $(this).parent().parent().find(".prodect-price").text();
			totalPrice -= parseInt(price);
			$("#result-price").text(totalPrice.toLocaleString());
			$("#result-total").text(totalPrice.toLocaleString());
			$("#btn-buy").text(totalPrice.toLocaleString() + "원 결제");
			$("#btn-coupon").trigger("click");
			$("#btn-point").trigger("click");
// 			console.log(totalPrice);
		}
	});

// 	쿠폰 할인
	$("#btn-coupon").click(function(){
		var couponSale = parseInt($("#select-coupon").find(":selected").val());
		var price = $("#result-price").text().replace(/,/g, "");
		var point = parseInt($("#result-point").text().replace(/,/g, ""));
// 		console.log(point);
		var sale = parseInt(price) / couponSale;
		if(couponSale == 0){
			sale = 0;
		$("#result-coupon").text("" + sale.toLocaleString());
		$("#result-total").text(((price - sale) + point).toLocaleString());
		$("#btn-buy").text(((price - sale) + point).toLocaleString() + "원 결제");
			return;
		}
		
		var total = $("#result-total").text().replace(/,/g, "");
		console.log(total);
		if(total == 0){
			$("#result-total").text(0);
			point = point + sale;
			$("#result-point").text(point.toLocaleString());
			$("#result-coupon").text("-" + sale.toLocaleString());
			$("input-point").val(-point);
			$("#btn-buy").text("0원 결제");
			return;
		}
		$("#result-total").text(((price - sale) + point).toLocaleString());
		$("#result-coupon").text("-" + sale.toLocaleString());
		if(price == 0){
		$("#result-coupon").text(0);
		}
		$("#btn-buy").text(((price - sale) + point).toLocaleString() + "원 결제");
	});
	
// 	포인트 할인
	$("#btn-point").click(function(){
		var total = $("#result-total").text();
		if(total == 0){
			return;
		}
		var point = parseInt($("#input-point").val());
		var myPoint = parseInt($("#member-point").text());
		var coupon = parseInt($("#result-coupon").text().replace(/,/g, ""));
		console.log(coupon);
		console.log(point);
		if(myPoint < point){
			alert("보유 포인트를 초과하였습니다.");
		}
		else {
			var resultPoint = $("#result-point").text("-"+point.toLocaleString());
			if(point <= 0){
				$("#input-point").val(0)
				point = 0;
				$("#result-point").text(0);
			}
			var price = parseInt($("#result-price").text().replace(/,/g, ""));
			
			console.log(price);
			if(point > price){
				point = price
				point = point+coupon;
				$("#input-point").val(point);
				$("#result-point").text("-"+point.toLocaleString())
				$("#result-total").text(((price + coupon)-point).toLocaleString());
				$("#btn-buy").text(((price + coupon)-point).toLocaleString() + "원 결제");
				console.log("최종", point);
				return;
			}
			$("#result-total").text(((price + coupon)-point).toLocaleString());
			$("#btn-buy").text(((price + coupon)-point).toLocaleString() + "원 결제");
		}
	});
	

// 결제 정보 세팅

var product_submit = function() {

	var product = $(".buy-product");
	var mid = "${loginInfo.mid}";
	var point = $("#result-point").text().substring(1)
			.replace(/,/g, "");
	var cno = $("#select-coupon").find(":selected").attr("data-cno");
	var oname = $("#product-oname").val();
	var ophone = $("#product-ophone").text().trim();
	var oprice = $("#result-total").text().replace(/,/g, "");
	var oaddr = $("#product-maddr").text();
	var oaddr_detail = $("#product-maddr_detail").val();
	var opost_code = $("#product-mpost_code").attr(
			"data-type-mpost_code");
	var odelivery = $("#result-delivery").text();
	if (odelivery == "무료") {
		odelivery = 0
	} else {
		odelivery = 1;
	}
	if (cno == null) {
		cno = 0;
	}
	if (point == "") {
		point = 0;
	}
	$("#mid").val(mid);
	$("#ppoint").val(point);
	$("#coupon_no").val(cno);
	$("#oname").val(oname);
	$("#ophone").val(ophone);
	$("#oprice").val(oprice);
	$("#oaddr").val(oaddr);
	$("#oaddr_detail").val(oaddr_detail);
	$("#opost_code").val(opost_code);
	$("#odelivery").val(odelivery);
	console.log(mid);
	console.log(cno);
	console.log(point);
	console.log(oname);
	console.log(ophone);
	console.log(oprice);
	console.log(oaddr);
	console.log(oaddr_detail);
	console.log(opost_code);
	console.log(odelivery);
	console.log(product);

	var checkproduct = $("input[class='checkbox-price']:checked");

	checkproduct
			.each(function(i, obj) {
				if ($(obj).is(":checked") == true) {
					var check = $(this);
					var product = check.parent().parent();
					console.log(product);
					var odproduct_count = product.find(
							".odproduct_count").text();
					var odoption = product.find($(".product-ooption"))
							.text().trim();
					var pno = product.find($(".buy-pno")).attr(
							"data-pno");
					var cart_no = product.find($(".buy-prodect-count"))
							.attr("data-cart_no");
					var odprice = product.find($(".prodect-price"))
							.text().replace(/,/g, "");

					var input_odoption = "<input type='hidden' value='"+odoption+"' name='list["+i+"].odoption'>";
					var input_pno = "<input type='hidden' value='"+pno+"' name='list["+i+"].pno'>";
					var input_odproduct_count = "<input type='hidden' value='"+odproduct_count+"' name='list["+i+"].odproduct_count'>";
					var input_cart_cno = "<input type='hidden' value='"+cart_no+"' name='list["+i+"].cart_no'>";
					var input_odprice = "<input type='hidden' value='"+odprice+"' name='list["+i+"].odprice'>";

					product.prepend(input_odoption);
					product.prepend(input_pno);
					product.prepend(input_odproduct_count);
					product.prepend(input_cart_cno);
					product.prepend(input_odprice);
					console.log(product);
					console.log(odproduct_count);
					console.log(odoption);
					console.log(pno);
					console.log(cart_no);
					console.log(odprice);
				}
			});

}
		//	결제 버튼
		$("#btn-buy").click(function() {
			var myPoint = $("#result-point").text();
			var point2 = 0;
			if(myPoint == 0){
				myPoint = 0
			}else{
				myPoint = myPoint.substring(1);
				point2 = parseInt(myPoint.replace(/,/g, ""));
			}
			var price = parseInt($("#result-total").text().replace(/,/g, ""));
			console.log(myPoint);
			if (point2 < price || point2 == 0){
				alert("포인트가 부족합니다");
				console.log(price);
				return;
			}
			product_submit();
			$("#order_detail").submit();
		});

		// 카카오 주소
		$("#btn-addr-search").click(function() {
			new daum.Postcode({
				oncomplete : function(data) {
					console.log(data);
					var roadAddr = data.roadAddress;
					console.log(roadAddr);
					var post_code = data.zonecode;
					$("#product-mpost_code").attr("data-type-mpost_code", post_code);
					$("#product-mpost_code").text("(" + post_code + ")");
					$("#product-maddr").text(roadAddr);
				}
			}).open();

		})

		$("#btn-kakaopay").click(function() {
			var opname = $("#product-opname").text();
			var oprice = $("#result-total").text().replace(/,/g, "");

			var IMP = window.IMP;
			IMP.init("imp20115775"); // 예시 : imp00000000

			// 결제창 호출 코드
			IMP.request_pay({ // 파라미터
				pg : "kakaopay", // pg사
				pay_method : "card", // 결제 수단
				merchant_uid : 'merchant_' + new Date().getTime(), //주문번호
				name : opname, //결제창에서 보여질 이름
				amount : oprice, //가격 
				buyer_name : "${loginInfo.mname}",
				buyer_tel : "${loginInfo.mphone}", 
			}, function(rsp) {
				if (rsp.success) { // 결제 성공
					console.log(rsp);
					alert("결제에 성공하였습니다.");
					product_submit();
					$("#order_detail").submit();
				} else {
					removePayAuth(pay_auth_id); 
					alert("결제에 실패했습니다.");
				}
			});
		});
	});
</script>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>