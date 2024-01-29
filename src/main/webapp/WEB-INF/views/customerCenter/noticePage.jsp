<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/customerCenterTop.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.return-a{
		display: block;
   	 	background: #ffbe33;
    	margin-right: 5px;
    	padding: 0 10px;
    	font-size: 14px;
    	line-height: 30px;
    	color: #fff;
	}
	.return-p{
		float: right;
	}
</style>
<title>공지사항 페이지</title>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div style="font-weight: bolder; font-size: 25px;">공지사항</div>
					<hr style="border= 0; height: 3px; background: black;">
					<div class="d-flex justify-content-between" style="border-bottom: 4px groove;">
					 <p style="color:#2964e0; padding: 4px 22px  0  12px;">${noticePage.ncategory}</p>
					 <h3>${noticePage.ntitle}</h3>
					 <div class="d-flex">
						 <div>
							 <span style="padding: 4px 16px  0  12px; border-right: 1px solid rgba(0, 0, 0, .3); margin-right: 11px;">
							 <fmt:formatDate value="${mapPage.noticeVO.nregdate}" pattern="yy/MM/dd"/>
							 </span>
						 </div>
						 <div>
						 	<span style="font-weight: 1000">조회수</span>
						 	<span>${mapPage.noticeVO.count}</span>
						 </div>
					 </div>
					</div>
					<div style="width: 100%; height: 400px; margin-bottom: 10px; border-bottom: 1px solid rgba(0,0,0,0.4);">
						<div style="padding: 30px 30px 30px 30px">
							<span>${mapPage.noticeVO.ncontent}</span>
						</div>
					</div>
					<c:choose>
						<c:when test="${not empty mapPage.filenames || not empty mapPage.urls}">
						<div>
							<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown">
									첨부파일
								</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<c:forEach varStatus="status" items="${mapPage.filenames}">
							 			<a class="dropdown-item" data-url="${mapPage.urls[status.index]}" href="#">${mapPage.filenames[status.index]}</a>
									</c:forEach>
								</div>
							</div>
						</div>
						</c:when>
					</c:choose>
						<div>
							<p class="return-p">
								<a class="return-a" href="/customerCenter/notice">목록으로</a>
							</p>
						</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>