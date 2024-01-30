<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="adminNotice" items="${list}">
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