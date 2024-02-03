<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ include file="/WEB-INF/views/include/myPage_sidebar.jsp" %>
<!-- /사이드바 -->
<!-- 포인트 -->
<div style="height: 100%;">
<div class="myPage-point">
<div class="container myPage-point-container">
<h1 style="color: white; font-family: 굴림체;">포인트 내역</h1>
<div class="myPage-line"></div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
				<table class="table table-bordered point-table">
					<thead>
						<tr>
							<th>쿠폰 이름</th>
							<th>사용여부</th>
							<th>할인률</th>
							<th>발급날짜</th>
							<th>유효기간</th>
						</tr>
					</thead>
							<tbody>
								<c:forEach var="vo" items="${couponList }">
									<tr class="coupon-list">
										<td>${vo.coupon_name }</td>
										<c:choose>
										<c:when test="${vo.use == 0 }">
										<td>사용 가능</td>
										</c:when>
										<c:otherwise>
										<td>사용 불가</td>
										</c:otherwise>
										</c:choose>
										<td>${vo.sale }%</td>
										<td><fmt:formatDate value="${vo.regdate }"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${vo.expiry_date }"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
								<tr class="point-button">
									<th colspan="5">
										<button type="button" class="btn btn-warning" id="btn-load">더보기</button>
									</th>
								</tr>
							</tbody>
						</table>
			</div>
	</div>
</div>
</div>
</div>
</div>

<script>
$(function(){
	$(".coupon-list").slice(0, 3).show();
	$("#btn-load").click(function(e) {
		e.preventDefault();
		$(".coupon-list:hidden").slice(0, 3).show(500);
		if($(".coupon-list:hidden").length == 0){
            $('#btn-load').fadeOut(100);
		}
	});

});
</script>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>