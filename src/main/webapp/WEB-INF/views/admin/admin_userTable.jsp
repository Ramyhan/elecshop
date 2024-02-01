<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<c:forEach var="userList" items="${userMap.userList}">
			<div class="user-div-row">
				<div class="cell">
					<input class="user-chkbox" type="checkbox">
				</div>
				<div class="cell">
					<span>${userList.mno}</span>
				</div>
				<div class="cell">
					<span>${userList.mname}</span>
				</div>
				<div class="cell">
					<span>${userList.mid}</span>
				</div>
				<div class="cell">
					<span>${userList.memail}</span>
				</div>
				<div class="cell">
					<span>${userList.maddr}/${userList.maddr_detail}</span>
				</div>
				<div class="cell">
					<span>${userList.mphone}</span>
				</div>
				<div class="cell">
					<span>${userList.mpoint}</span>
				</div>
				<div class="cell">
					<span>${userList.mstate == 0? '정지' : '활동'}</span>
				</div>
			</div>
			</c:forEach>
