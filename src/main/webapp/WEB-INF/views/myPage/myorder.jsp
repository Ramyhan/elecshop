<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ include file="/WEB-INF/views/include/myPage_sidebar.jsp" %>
<!-- /사이드바 -->
<div style="background-color: #303030;" >
<div class="myPage-myOrder">
<div class="container myPage-point-container">
<h1>주문 내역</h1>
<div class="myPage-line"></div>
<div class="container-fluid">
	<c:forEach var="vo" items="${orderList }">
		<div>
			<h2><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd" /></h2>
<!-- 		카드 -->
	<div class="col-md-12">
		<div id="card-460431">
			<div class="card myOrder-card">
				<div class="card-header">
					 <a class="card-link collapsed myOrder-card-title" data-toggle="collapse" 
					 data-parent="#card-460431" href="#product-info">주문번호 : ${vo.ono }</a>
				</div>
				<div id="product-info" class="collapse">
						<c:forEach var="detail" items="${vo.list }">
					<div class="card-body">
							<div class="buy-prodect row buy-product">
						<div>
							<img class="buy-image" src="/resources/images/${detail.pimage_thoumb }">
						</div>
						<div class="buy-prodect-pname buy-pno">
							<br>
							<p class="prodect-opname">${detail.pname }</p>
							<ul>
							 <li><strong>옵션</strong><span class="product-ooption"><c:set var="odoption" value="${fn:split(detail.odoption, ',')}"/>
							 <c:forEach var="odoption" items="${odoption }">${odoption }<br></c:forEach></span>
							 </li>
							</ul>
						</div>
						<div class="buy-prodect-count">
							<p>수량:<span class="odproduct_count">1</span>개</p>
						</div>
						<div class="buy-prodect-price">
							<p class="prodect-price">${detail.odprice }</p>
						</div>
						<div class="buy-prodect-delivery">
							<p>무료배송<p>
						</div>
					</div>
					</div>
					<div class="myPage-line-gray"></div>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
<!-- 	/카드 -->
		</div>
	</c:forEach>
	</div>
</div>
</div>
</div>
<script>
$(function(){
	$(".myOrder-card-title").click(function(){
		console.log($(this));
		$(this).css("color", "white");
	});
})
</script>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>