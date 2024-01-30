<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div >
<div class="div-buy">
	<div class="container">
		<div class="buy-title">
			<h1>주문결제</h1>
			<div class="myPage-line"></div>
			<div class="buy-info">
				<h3>배송정보</h3>
				 <p>${loginInfo.mname }</p>
				 <p><c:set var="num" value="${loginInfo.mphone }" />
				  	${fn:substring(num,0,3) }-${fn:substring(num,3,7) }-${fn:substring(num,7,11) }
				</p>
				<p id="addr">(${loginInfo.mpost_code }) ${loginInfo.maddr }</p>
				<input id="maddr_detail" name="maddr_detail" type="text" value="${loginInfo.maddr_detail }">
				
				<button type="button" id="btn-addr-search" class="btn btn-warning">주소 검색</button>
			</div>
<!-- 			<div class="myPage-line-gray"></div> -->
			<div class="buy-title">
			<h1>주문상품</h1>
			<div class="myPage-line"></div>
<!-- 						상품 -->
					<div class="buy-prodect row">
						<div >
							<img class="buy-image" src="/resources/images/galaxybook.jpg">
						</div>
						<div class="buy-prodect-pname">
							<br>
							<p>갤럭시북3 프로 GalaxyBook</p>
							<ul>
							 <li><strong>옵션</strong> 16인치 black</li>
							</ul>
						</div>
						<div class="buy-prodect-count">
							<p>수량:1개</p>
						</div>
						<div class="buy-prodect-price">
							<p>1,300,000원</p>
						</div>
						<div class="buy-prodect-delivery">
							<p>무료배송<p>
						</div>
					</div>
					<div class="buy-prodect row">
						<div >
							<img class="buy-image" src="/resources/images/galaxybook.jpg">
						</div>
						<div class="buy-prodect-pname">
							<br>
							<p>갤럭시북3 프로 GalaxyBook</p>
							<ul>
							 <li><strong>옵션</strong> 16인치 black</li>
							</ul>
						</div>
						<div class="buy-prodect-count">
							<p>수량:1개</p>
						</div>
						<div class="buy-prodect-price">
							<p>1,300,000원</p>
						</div>
						<div class="buy-prodect-delivery">
							<p>무료배송<p>
						</div>
					</div>
					<div class="buy-prodect row">
						<div >
							<img class="buy-image" src="/resources/images/galaxybook.jpg">
						</div>
						<div class="buy-prodect-pname">
							<br>
							<p>갤럭시북3 프로 GalaxyBook</p>
							<ul>
							 <li><strong>옵션</strong> 16인치 black</li>
							</ul>
						</div>
						<div class="buy-prodect-count">
							<p>수량:1개</p>
						</div>
						<div class="buy-prodect-price">
							<p>1,300,000원</p>
						</div>
						<div class="buy-prodect-delivery">
							<p>무료배송<p>
						</div>
					</div>
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
						<select>
						<option>선택 안함</option>
						<c:forEach var="vo" items="${myCoupon }">
						<option value="${vo.cno }">${vo.coupon_name }</option>
						</c:forEach>
						</select>
						<button class="btn btn-warning" type="button">쿠폰 적용</button>
					</div>
					<br>
					<div class="buy-line"></div>
					</div>
<!-- 					//쿠폰 -->
					<br>
					<div class="buy-point">
					<div>
						<i class="fab fa-bitcoin"></i><span>포인트 사용</span>
						<input type="number" value="${loginInfo.mpoint }">
					</div>
						<div class="buy-myPoint">
						<span>사용 가능 포인트</span> 
						<span>${loginInfo.mpoint }</span>
						</div>
					</div>
				</div>
		</div>
	</div>
		<div class="buy-price" style="width: 400px; margin-top: 10%;">
		<div class="col buy-col">
		<h2>결제 예정금액</h2>
		<p>상품금액 : 500,000</p>
		<p>배송비 : 5,000</p>
		<p>할인금액 : 10,000</p>
		<h2>합계 : 495,000</h2>
		<button class="btn btn-warning btn-buy" type="button">495,000원 결제</button>
		</div>
		
		</div>
</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function (){
	
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