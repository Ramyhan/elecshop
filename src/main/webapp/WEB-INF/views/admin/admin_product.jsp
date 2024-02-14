<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function(){
	var registerResult = "${registerResult}";
	if(registerResult == "true"){
		alert("상품 추가가 완료 되었습니다");
	}
	$(".product-create").click(function(){
		var url ="/admin/admin_product_popup";
		var name = "product_popup";
		var option = "width=900,height=700,top=100,location=no";
		window.open(url,name,option);
	});
	$(".btn-product-update").click(function(e){
		var pno = $(this).attr("data-pno");
		var hiddenPno = "<input type='hidden' name='pno' value='"+pno+"'/>"
		var conf = confirm(pno+"번의 상품을 확인하시겠습니까?");
		console.log(conf);
		if(conf == true){
			$("#frm-product").append(hiddenPno);
			$("#frm-product").submit();
		}else{
			return false;
		}
	});
	$(".btn-add-manuFacturer").click(function(){
		var manu = prompt("제조사를 입력해주세요");
		if(manu != null){
			$.get("/admin/registerManuFacturer",{"manu" : manu},function(rData){
				console.log(rData);
				if(rData == true){
					alert("제조사가 추가 되었습니다")
				}else{
					alert("중복된 제조사가 있습니다");
				}
			})
		}
	});
	
	$(".btnChkDelete").click(function() {
		var targets = $(".chkProd:checked");
		var pnos = [];
		targets.each(function() {
			var pno = $(this).attr("data-pno");
			pnos.push(parseInt(pno));
		});
		
		var str_pnos = pnos.join();
		var url = "/product/remove";
		var sData = {"pnos" : str_pnos};
		
		$.post(url, sData, function(rData) {
			console.log("delete_result: ", rData);
			if (rData == "true") {
				targets.each(function() {
					$(this).parent().pareat().fadeOut(500);
				});
			}
		});
	});
	//페이징 처리
	$(".page-num").click(function(e) {
		e.preventDefault();
		var pageNum = $(this).attr("href");
		$("#page").val(pageNum);
		$("#frm-page").attr("action", "/admin/admin_product");
		console.log(pageNum);
		$("#frm-page").submit();
	});
	$("#btn-search").click(function(){
		var keyword = $("#search-keyword").val();
		var type = $("#search-type").find("option:selected").val();
		console.log("22",keyword)
		console.log("33",type)
		$("#keyword").val(keyword);
		$("#type").val(type);
		var page = $("#page").val();
		console.log("11",page);
		$("#frm-page").attr("action", "/admin/admin_product");
		$("#frm-page").submit();
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
					<select name="type" id="search-type">
						<option value="n">고유번호</option>
						<option value="t">제목</option>
						<option value="c">분류</option>
						<option value="r">등록일</option>
					</select> 
					<input id="search-keyword" type="text" placeholder="Search" name="keyword">
					<button type="button" id="btn-search">
						<i class="fa fa-search"></i>
					</button>
				</div>
				<div>
					<button type="button" class="product-create">상품 추가</button>
					<button type="button" class="btn-add-manuFacturer">제조사 추가</button>
					<button type="button" class="btnChkDelete">선택 삭제</button>
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
								<input class="user-chkbox chkProd" type="checkbox" data-pno="${list.pno}">
							</div>
							<div class="cell">
								<span class="user-mno">${list.pno}</span>
							</div>
							<div class="cell" style="text-align: left;">
							<c:choose>
								<c:when test="${not empty list.pimage_thoumb || list.pimage_thoumb != null}">
								<img src="/display?fileName=${list.pimage_thoumb}" style="width: 48px;height: 48px;">
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
							<button type="button" class="btn-product-update" data-pno="${list.pno}">
							<i class="fa fa-comment-dots"></i>
							</button>
							</div>
						</div>
						</c:forEach>
							<form id="frm-product" action="/admin/admin_productInfo" method="get">
							</form>
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
						    	<li class="page-item"><a class="page-num page-link ${(productMap.page.criteria.pageNum == v) ? 'active' : ''}" href="${v}">${v}</a></li>
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
						<form id="frm-page">
							<input type="hidden" name="type" id="type" value="${productMap.page.criteria.type}">
							<input type="hidden" name="keyword" id="keyword" value="${productMap.page.criteria.keyword}">
							<input type="hidden" id="page" name="pageNum" value="${productMap.page.criteria.pageNum}">
						</form>
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