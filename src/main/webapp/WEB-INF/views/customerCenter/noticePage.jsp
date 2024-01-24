<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/customerCenterTop.jsp"%>
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
					 <p style="color:#2964e0; padding: 4px 22px  0  12px;">태그 넣는 곳</p>
					 <h3>제목 넣는 곳</h3>
					 <div class="d-flex">
						 <div>
							 <span style="padding: 4px 16px  0  12px; border-right: 1px solid rgba(0, 0, 0, .3); margin-right: 11px;">날짜 넣는 곳</span>
						 </div>
						 <div>
						 	<span style="font-weight: 1000">조회수</span>
						 	<span>1242</span>
						 </div>
					 </div>
					</div>
					<div style="width: 100%; height: 500px;">
						<div style="padding: 30px 30px 30px 30px ;">
							<span>공지사항 내용 적는 곳</span>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>