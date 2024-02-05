<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<div class="user-tbl-header">
				<div class="header-cell" style="opacity: 1">
					<input class="user-chkboxAll" type="checkbox">
				</div>
				<div class="header-cell">
					<span>#</span>
				</div>
				<div class="header-cell">
					<span>이름</span>
				</div>
				<div class="header-cell">
					<span>아이디</span>
				</div>
				<div class="header-cell">
					<span>이메일</span>
				</div>
				<div class="header-cell">
					<span>주소</span>
				</div>
				<div class="header-cell">
					<span>연락처</span>
				</div>
				<div class="header-cell">
					<span>포인트</span>
				</div>
				<div class="header-cell">
					<span>상태</span>
				</div>
			</div>
			<c:forEach var="userList" items="${userList}">
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
					<button class="user-point-history" style="font-size: 13px; border-radius: 10px; border: 1px solid rgba(0,0,0,0.3);">내역보기</button>
				</div>
				<div class="cell">
					<span>${userList.mstate == 0? '정지' : '활동'}</span>
				</div>
			</div>
			</c:forEach>
