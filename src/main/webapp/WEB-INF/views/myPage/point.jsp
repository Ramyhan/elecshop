<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ include file="/WEB-INF/views/include/myPage_sidebar.jsp" %>
<!-- /사이드바 -->
<!-- 포인트 -->
<div style=" height: 100%; background-color: #303030;">
<div class="myPage-point">
<div class="container myPage-point-container">
<br>
<h1>포인트 내역</h1>
<div class="myPage-line"></div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
				<table class="table table-bordered point-table">
					<thead>
						<tr>
							<th>포인트 정보</th>
							<th>포인트</th>
							<th>아이디</th>
							<th>날짜</th>
						</tr>
					</thead>
							<tbody>
								<c:forEach var="vo" items="${pointInfo }">
									<tr class="point-list">
										<td>${vo.point_info }</td>
										<td>${vo.ppoint }</td>
										<td>${vo.mid }</td>
										<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
								<tr class="point-button">
									<th colspan="4">
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
	if($(".point-list:hidden").length == 0){
        $('#btn-load').fadeOut(100);
	}
	$(".point-list").slice(0, 5).show();
	$("#btn-load").click(function(e) {
		e.preventDefault();
		$(".point-list:hidden").slice(0, 5).show(500);
		if($(".point-list:hidden").length == 0){
            $('#btn-load').fadeOut(100);
		}
	});

});
</script>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>