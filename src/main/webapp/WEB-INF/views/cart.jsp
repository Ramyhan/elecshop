<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<style>
h1 {
	font-family: "고딕";
}
</style>
<body>
	<div id="main" style="color: white;">
		<div class="container">
			<div class="section">
				<div class="col"
					style="border: solid 1px #ffbe33; border-radius: 1px">
					<div>
						<h1>장바구니</h1><br>
						<h3>수량: 3개</h3><br>
					</div>
					<div class="row">
						<div class="col-md-12">
							<table class="table" style="color: white;">
								<thead>
									<tr>
										<th>#</th>
										<th><input type="checkbox" class="form-check-input" value=""></th>
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
									<tr class="table-active">
										<td>1</td>
										<td>TB - Monthly</td>
										<td>01/04/2012</td>
										<td>Approved</td>
									</tr>
									<tr class="table-success">
										<td>2</td>
										<td>TB - Monthly</td>
										<td>02/04/2012</td>
										<td>Declined</td>
									</tr>
									<tr class="table-warning">
										<td>3</td>
										<td>TB - Monthly</td>
										<td>03/04/2012</td>
										<td>Pending</td>
									</tr>
									<tr class="table-danger">
										<td>4</td>
										<td>TB - Monthly</td>
										<td>04/04/2012</td>
										<td>Call in to confirm</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/bottom.jsp"%>