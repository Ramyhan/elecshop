<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ include file="/WEB-INF/views/include/myPage_sidebar.jsp" %>
<!-- /사이드바 -->
<!-- 포인트 -->

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
							<th>포인트 정보</th>
							<th>포인트</th>
							<th>아이디</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="vo" items="${pointInfo }">
						<tr>
							<td>${vo.point_info }</td>
							<td>${vo.ppoint }</td>
							<td>${vo.mid }</td>
							<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
	</div>
</div>
</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>