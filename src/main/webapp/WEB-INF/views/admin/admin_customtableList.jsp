<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="table">
	<thead>
		<tr style="text-align: center;">
			<th><input type="checkbox" class="notice-check-all"></th>
			<th>고유번호</th>
			<th>카테고리</th>
			<th>공지제목</th>
			<th>공지 날짜</th>
			<th>상태</th>
		</tr>
	</thead>
	<tbody class="tbltbody">
		<c:forEach var="adminNotice" items="${noticeMap.subNoticeList}">
			<tr class="tbltr" style="text-align: center;">
				<td><input type="checkbox" class="notice-checkbox"
					data-nno="${adminNotice.nno}"></td>
				<td>${adminNotice.nno}</td>
				<td>${adminNotice.ncategory}</td>
				<td>${adminNotice.ntitle}</td>
				<td><fmt:formatDate value="${adminNotice.nregdate}" /></td>
				<td class="td-state" data-state="${adminNotice.nstate }"><c:choose>
						<c:when test="${adminNotice.nstate == 'false'}">비공개</c:when>
						<c:otherwise>공개</c:otherwise>
					</c:choose></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div id="page-div" style="display: flex; justify-content: space-around;">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<c:if test="${noticeMap.page.prev == true}">
				<li class="page-item"><a class="page-num page-link"
					href="${noticeMap.page.startPage - 1}" aria-label="Previous"> <span
						aria-hidden="true"><i class="fa fa-angle-double-left"></i></span>
				</a></li>
			</c:if>
			<c:forEach begin="${noticeMap.page.startPage }"
				end="${noticeMap.page.endPage}" var="v">
				<li class="page-item"><a
					class="page-num page-link ${(noticeMap.page.criteria.pageNum == v) ? 'Active' : ''}"
					href="${v}">${v}</a></li>
			</c:forEach>
			<c:if test="${noticeMap.page.next == true}">
				<li class="page-item"><a class="page-num page-link"
					href="${noticeMap.page.endPage + 1}" aria-label="Next"> <span
						aria-hidden="true"><i class="fa fa-angle-double-right"></i></span>
				</a></li>
			</c:if>
		</ul>
	</nav>
</div>