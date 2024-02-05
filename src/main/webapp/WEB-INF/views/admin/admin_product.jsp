<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function(){
	$(".product-create").click(function(){
		var url ="/admin/admin_product_popup";
		var name = "product_popup";
		var option = "width=900,height=700,top=100,location=no";
		window.open(url,name,option);
	});
	$(".btn-product-update").click(function(e){
		var pno = $(this).attr("data-pno");
		var conf = confirm(pno+"번의 상품을 수정 하시겠습니까?");
		console.log(conf);
		if(conf == true){
			$("#frm-product").submit();
		}else{
			return false;
		}
	});
});
</script>
<%@include file="/WEB-INF/views/include/top.jsp"%>
<div class="main-div">
<%@ include file="/WEB-INF/views/include/admin_sidebar.jsp"%>
	<div class="set-div">
		<div class="user-div">
			<div>
				<h1>유저 관리 페이지</h1>
			</div>
			<div class="user-devel">
				<div class="d-flex justify-content-end">
					<select>
						<option>
							고유번호
						</option>
						<option>
							이름
						</option>
						<option>
							아이디
						</option>
						<option>
							이메일
						</option>
					</select>
					<input class="user-input" type="text" placeholder="Search">
					<button>
						<i class="fa fa-search"></i>
					</button>
				</div>
				<div>
					<button type="button" class="product-create">상품 추가</button>
					<button type="button" class="user-suspend">분류 설정</button>
					<button type="button" class="user-repair"></button>
				</div>
			</div>
			<div class="div-main">
				<div class="second-div" style="background-color: white;" >
					<div class ="user-table">
						<div class="user-tbl-header">
							<div class="header-cell" style="opacity: 1">
								<input class="user-chkboxAll" type="checkbox">
							</div>
							<div class="header-cell">
								<span>#</span>
							</div>
							<div class="header-cell">
								<span>상품명</span>
							</div>
							<div class="header-cell">
								<span>판매가</span>
							</div>
							<div class="header-cell">
								<span>분류</span>
							</div>
							<div class="header-cell">
								<span>상태</span>
							</div>
							<div class="header-cell">
								<span>재고</span>
							</div>
							<div class="header-cell">
								<span>등록일</span>
							</div>
							<div class="header-cell">
							</div>
						</div>
						<c:forEach var="list" items="${productMap.productList}">
						<div class="user-div-row">
							<div class="cell">
								<input class="user-chkbox" type="checkbox">
							</div>
							<div class="cell">
								<span class="user-mno">${list.pno}</span>
							</div>
							<div class="cell" style="text-align: left;">
							<c:choose>
								<c:when test="${not empty list.fileVO.aurl || list.fileVO.aurl != null}">
								<img src="/display?fileName=${list.fileVO.aurl}" style="width: 48px;height: 48px;">
								</c:when>
								<c:otherwise>
								<img src="/resources/css/dongyeong/default.png" style="width: 48px;height: 48px;">
								</c:otherwise>
							</c:choose>
								<span style="font-size: 20px;">${list.pname}</span>
							</div>
							<div class="cell">
								<span>
								<fmt:formatNumber value="${list.pprice}" pattern="#,###"/>원
								</span>
							</div>
							<div class="cell">
								<span>${list.ptypeName}</span>
							</div>
							<div class="cell">
							<c:choose>
								<c:when test="${list.order_count != 0}">
									<span>판매중</span>
								</c:when>
								<c:otherwise>
									<span>품절</span>
								</c:otherwise>
							</c:choose>
							</div>
							<div class="cell">
								<span>${list.order_count}</span>
							</div>
							<div class="cell">
								<span>
								<fmt:formatDate value="${list.pregdate}" pattern="yy-MM-dd hh:mm:ss"/>
								</span>
							</div>
							<div class="cell">
							<form id="frm-product" action="/admin/admin_productInfo" method="post">
							<input type="hidden" value="${list.pno}" name="pno">
							<button type="button" class="btn-product-update" data-pno="${list.pno}">
							<i class="fa fa-comment-dots"></i>
							</button>
							</form>
							</div>
						</div>
						</c:forEach>
					</div>
					<div>
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						  <c:if test="${productMap.page.prev == true}">
						    <li class="page-item">
						      <a class="page-num page-link" href="${productMap.page.startPage - 1}" aria-label="Previous">
						        <span aria-hidden="true"><i class="fa fa-angle-double-left"></i></span>
						      </a>
						    </li>
						  </c:if>
						  <c:forEach begin="${productMap.page.startPage}" end="${productMap.page.endPage}" var="v">
						    	<li class="page-item"><a class="page-num page-link ${(productMap.pagecriteria.pageNum == v) ? 'Active' : ''}" href="${v}">${v}</a></li>
						  </c:forEach>
						  <c:if test="${productMap.page.next == true }">
							    <li class="page-item">
							      <a class="page-num page-link" href="${productMap.page.endPage + 1}" aria-label="Next">
							        <span aria-hidden="true"><i class="fa fa-angle-double-right"></i></span>
							      </a>
							    </li>
						  </c:if>
						  </ul>
						</nav>
					</div>
					<div class="popup">
						<div class="popup-cover">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/bottom.jsp"%>