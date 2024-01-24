<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
<div class="container-fluid">
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
					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th style="text-align: center;">카테고리</th>
								<th style="text-align: center;">제목</th>
								<th style="text-align: right; padding-right: 49px;">등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td style="text-align: center;">카테고리명</td>
								<td style="text-align: center;">23242424제목명</td>
								<td style="text-align: right; padding-right: 27px;">01/04/2012</td>
							</tr>
						</tbody>
					</table>
					<!-- //공지사항 테이블 -->
					
					<!-- 페이징 태그 -->
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
					<!-- //페이징 태그 -->
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>