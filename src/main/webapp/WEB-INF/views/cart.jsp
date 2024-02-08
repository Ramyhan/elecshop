<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<style>
	h1 {
		font-family: "고딕";
	}
	
	.productImage {
		width: 130px;
		height: 130px;
	}

	#btnOrder {
		scale: 1.5;
		margin-top: 10px;
	}	
</style>
<script>
$(function() {
	$("#btnOrder").click(function(){
		location.href = "/buy";
	});
	
	$("#chkCart").change(function() {
		var checked = $(this).prop("checked");
		$(".chkCart").prop("checked", checked);
	});
	
	$("#btnRemove").click(function() {
		var targets = $(".chkCart:checked");
		console.log("tergets: ", targets);
		
		var cnos = [];
		targets.each(function() {
			var cno = $(this).attr("data-cno");
			cnos.push(parseInt(cno));
		});
		
		var str_cnos = cnos.join();
		console.log("str_cnos: ", str_cnos);
		var url = "/removeItems";
		var sData = {"cnos" : str_cnos};
		
		$.post(url, sData, function(rData) {
			console.log("delete_result: ", rData);
			if (rData == "true") {
				targets.each(function() {
					$(this).closest("tr").fadeOut(500);
				});
			}
		});
	});
});
</script>
<body>
<div style=" height: 100%; background-color: #151515">
	<div id="main" style="color: white;">
		<div class="container">
			<div class="section">
				<div class="col"
					style="border: solid 1px #ffbe33; border-radius: 1px">
					<div style="margin: 20px;">
						<h1>장바구니</h1><br>
						<h3>수량: ${count}개</h3><br>
					</div>
					<div style="padding-bottom:10px;">
						<button type="button" class="btn btn-warning" id="btnRemove">선택 삭제</button>
					</div>
					<div class="row">
						<div class="col-md-12">
							<table class="table" style="color: white;">
								<thead>
									<tr>
										<th><input type="checkbox" id="chkCart"></th>
										<th>상품 이미지</th>
										<th>상품명</th>
										<th>옵션</th>
										<th>가격</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${cartList}" var="cartDTO">
									<tr>
										<td style="vertical-align: middle;">
											<input type="checkbox" class="chkCart" data-cno="${cartDTO.cno}">
										</td>
										<td>
											<img class="productImage" alt="상품 사진"
												src="/display?fileName=${cartDTO.pimage_thoumb}"/>
										</td>
										<td style="vertical-align: middle;">${cartDTO.pname}</td>
										<td style="vertical-align: middle;">
										<c:set var="coption" value="${fn:split(cartDTO.coption, ',')}"/>
										<c:forEach items="${coption}" var="coption">
											${coption}<br>
										</c:forEach>
										</td>
										<td style="vertical-align: middle;">
											<fmt:formatNumber pattern="#,###">
												${cartDTO.cprice}
											</fmt:formatNumber>원
										</td>
									</tr>
								</c:forEach>
									<tr>
										<td colspan="5" style="text-align: center; vertical-align: middle;">
											<button type="button" class="btn btn-success" id="btnOrder">주문 하기</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>			
				</div>
			</div>
		</div>
	</div>
	</div>

	<%@ include file="/WEB-INF/views/include/bottom.jsp"%>