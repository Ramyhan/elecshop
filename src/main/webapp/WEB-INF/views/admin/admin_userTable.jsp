<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
						<span class="user-mno">${userList.mno}</span>
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
						<button data-mid="${userList.mid}" class="user-point-history" style="font-size: 13px; border-radius: 10px; border: 1px solid rgba(0,0,0,0.3);">내역보기</button>
					</div>
					<div class="cell">
						<c:choose>
							<c:when test="${userList.mstate == 0}">정지</c:when>
							<c:when test="${userList.mstate == 1}">활동</c:when>
							<c:when test="${userList.mstate == 2}">탈퇴</c:when>
						</c:choose>
					</div>
				</div>
				</c:forEach>
			</div>
			<div>
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				  <c:if test="${page.prev == true}">
				    <li class="page-item">
				      <a class="page-num page-link" href="${page.startPage - 1}" aria-label="Previous">
				        <span aria-hidden="true"><i class="fa fa-angle-double-left"></i></span>
				      </a>
				    </li>
				  </c:if>
				    <c:forEach begin="${page.startPage }" end="${page.endPage}" var="v">
				    	<li class="page-item"><a class="page-num page-link ${(page.criteria.pageNum == v) ? 'Active' : ''}" href="${v}">${v}</a></li>
				    </c:forEach>
				    <c:if test="${page.next == true}">
					    <li class="page-item">
					      <a class="page-num page-link" href="${page.endPage + 1}" aria-label="Next">
					        <span aria-hidden="true"><i class="fa fa-angle-double-right"></i></span>
					      </a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
			</div>
		</div>
