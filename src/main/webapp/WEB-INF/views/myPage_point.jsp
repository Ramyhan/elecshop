<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<div class="side-bar">
	<div class="icon">
		<div>
			<i class="fa fa-align-justify"></i>
		</div>
		<div>
			<i class="fa fa-angle-double-left"></i>
		</div>
	</div>
	<div class="side-menu side-myPage-point">
		<ul>
			<li><a href="/myPage">내 정보</a></li>
			<li><a href="/myPage_point">포인트</a></li>
			<li><a href="#">찜 목록</a></li>
			<li><a href="#">나의 문의 내역</a></li>
			<li><a href="#">계정 탈퇴</a></li>
		</ul>
	</div>
</div>
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
							<th>#</th>
							<th>Product</th>
							<th>Payment Taken</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>TB - Monthly</td>
							<td>01/04/2012</td>
							<td>Default</td>
						</tr>
					</tbody>
				</table>
			</div>
	</div>
</div>
</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>