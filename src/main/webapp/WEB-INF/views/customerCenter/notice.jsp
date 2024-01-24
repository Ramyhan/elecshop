<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/include/customerCenterTop.jsp"%>
<style>
	body{
		background-color: white;
	}
	.notice{
		text-decoration : none;
		color: #B7C4CF;
	}
	.notice-div{
	font-size: 30px;
	border-right: 1px solid #B7C4CF;
	width: 100%;
	text-align: center;

	}
	.notice-main{
		height: 55%;
	}
	.notice-table{
		padding: 20px 30px 10px 30px;
		box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.7);
	}
	.notice-title{
		border-bottom: 1px solid rgba(0, 0, 0, 0.3);
		padding-bottom: 12px;
	}
   	.span-title:first-child{   
   		position: absolute;   
   		left:40%;   
  	}   
	.span-title{
		font-weight: 1000;
	}
	.div-message span:first-child{
		padding-left: 30px;
	}
	.div-message span:nth-child(2){
		padding-right: 20px;
	}
	.div-message{
		padding: 15px 0 15px 0;
		border-bottom: 1px solid rgba(0,0,0,0.1);
	}
</style>
<div class="container-fluid notice-main">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
				<div style="font-weight: bolder; font-size: 25px;">공지사항</div>
				<div class="d-flex justify-content-between" 
    			style="width: 100%; height: 20%; border: 3px solid #B7C4CF; background-color: white;">
    				<div class="notice-div notice align-self-center">
        				<a class="notice" href="#">전체</a>
    				</div>
    				<div  class="notice-div align-self-center">
        				<a class="notice" href="#">시스템</a>
    				</div>
    				<div class="notice-div align-self-center">
        				<a class="notice" href="#">제품</a>
    				</div>
    				<div class="notice-div align-self-center">
        				<a class="notice" href="#">커뮤니티</a>
    				</div>
				</div>
				<hr style="border= 0; height: 3px; background: black;">
				<!-- 공지사항 테이블 -->
				<div class="notice-table">
					<div class="d-flex justify-content-end notice-title">
						<span class="span-title">제목</span>
						<span class="span-title" style="padding-right: 30px;">등록일</span>
					</div>
					<c:forEach var="subNotice" items="${list}">
						<div class="div-message d-flex justify-content-between">
							<span class="span-message">
								<a href="/customerCenter/noticePage?nno=${subNotice.nno}">${subNotice.ntitle}</a>
							</span>
							<span class="span-message">
								<fmt:formatDate value="${subNotice.nregdate}" pattern="yy-MM-dd"/>
							</span>
						</div>
					</c:forEach>
					<div>
					
					</div>
				</div>
					<!-- //공지사항 테이블 -->
					
					<!-- 페이징 태그 -->
					<div style="padding-top: 20px;">
						<nav aria-label="Page navigation example" class="d-flex justify-content-center">
						  <ul class="pagination">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <li class="page-num"><a class="page-link" href="#">1</a></li>
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
					</div>
					<!-- //페이징 태그 -->
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>