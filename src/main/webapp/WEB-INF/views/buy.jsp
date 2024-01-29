<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<div style="height: 100%;">
<div class="div-buy">
	<div class="container">
		<div class="buy-title">
			<h1>주문결제</h1>
			<div class="myPage-line"></div>
			<div class="buy-title">
				<h3>배송정보</h3>
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
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>