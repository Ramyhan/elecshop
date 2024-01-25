<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<style>
	h1 {
		font-family: "고딕";
	}

	#productMainImage {
		width: 600px;
		height: 550px;
	}
	
	.rate{
		background: url(https://aldo814.github.io/jobcloud/html/images/user/star_bg02.png) no-repeat;
		width: 121px;
		height: 20px;
		position: relative;
	}
	.rate span{
		position: absolute;
		background: url(https://aldo814.github.io/jobcloud/html/images/user/star02.png);
		width: auto;
		height: 20px;
	}
	
	.divOptionName{
		font-family: "고딕";
		font-size: 25px;
		font-weight: 400;
		font: bold;
	}
	
	.divOption{
		border: solid 1px #ffbe33;
		border-radius: 10px;
		font-family: "고딕"
	}
	
	.selectOption{
		background-color: #151515;
		border: solid 1px #ffbe33;
		color: white;
	}
	
	.divInfo {
		border-top:solid 2px #ffbe33;
		padding-top:30px;
		margin-top: 50px;
		width:100%;
	}	
	
	.productImage{
		text-align: center;
	}
	
	.productInfoImage{
		width:1100px;
		height:750px;
	}
	
	
	.info {
		border-bottom:solid 1px #AAAAAA;
		font-family: "고딕";
	}
	
	.infoName {
		font-size: 20px;
	}
	
	.infoComment {
		font-size: 15px;
		color: #AAAAAA;
	}
	
</style>
<script>
$(function() {
	// 스펙 정보 세팅
	var spec1 = "${productVO.pinfo1}".split(",");
	var spec2 = "${productVO.pinfo2}".split(",");
	var spec3 = "${productVO.pinfo3}".split(",");
	$(".specName1").text(spec1[0]);
	$(".specInfo1").text(spec1[1]);
	$(".specName2").text(spec2[0]);
	$(".specInfo2").text(spec2[1]);
	$(".specName3").text(spec3[0]);
	$(".specInfo3").text(spec3[1]);
	
	// 옵션 선택시 현재가격 변경
	
});
</script>
<body>
	<div id="main" style="color: white;">
		<div class="container">
			<div class="section">
				<div class="row">
					<div class="col-md-7" style="float:right;">
						<img id="productMainImage" alt="상품 사진" src="/resources/images/galaxybook4pro.png"/>	
					</div>
					<div class="col-md-5" style="border: solid  1px #ffbe33; border-radius:10px;">
						<h1 style="font-weight: 600;">${productVO.pname}</h1><br>
						<div style="float:left;">${productVO.pcode}</div><br>
						<div class="rate" style="float:left;">
							<span style="width: 50%"></span>
						</div>
						<div style="margin-left:130px;">3.5점 (150건)</div><br><br>
						<h3>기준가: ${productVO.pprice}</h3><br><br>
						
						<!-- 상품옵션 -->
						<div class="divOptionName">SSD</div>
						<div class="divOption">
							<div>
								<select id="option" name="option" class="selectOption" style="width: 100%; border-radius:10px;">
									<option selected>-----옵션을 선택해주세요-----</option>
								<c:forEach items="#{optionVO}" var="option">
								<c:if test="${ option.otype == 1 }">
									<option value="${option.oprice}">${option.oname}(+${option.oprice})</option>
								</c:if>
								</c:forEach>
								</select>
							</div>
						</div><br>
						<div class="divOptionName">RAM</div>
						<div class="divOption">
							<div>
								<select id="option" name="option" class="selectOption" style="width: 100%; border-radius:10px;">
									<option selected>-----옵션을 선택해주세요-----</option>
								<c:forEach items="#{optionVO}" var="option">
								<c:if test="${ option.otype == 2 }">
									<option value="${option.oprice}">${option.oname}(+${option.oprice})</option>
								</c:if>
								</c:forEach>
								</select>
							</div>
						</div><br>
						<div class="divOptionName">Color</div>
						<div class="divOption">
							<div>
								<select id="option" name="option" class="selectOption" style="width: 100%; border-radius:10px;">
									<option selected>-----옵션을 선택해주세요-----</option>
								<c:forEach items="#{optionVO}" var="option">
								<c:if test="${ option.otype == 3 }">
									<option value="${option.oprice}">${option.oname}(+${option.oprice})</option>
								</c:if>
								</c:forEach>
								</select>
							</div>
						</div>
						
						<div style="padding: 10px 0px 10px 0px;">
							<div style="font-size: 30px; font-family: '고딕'">
								현재가: <span id="totalPrice">${productVO.pprice}"</span>원
							</div>
							<button type="button" class="btn btn-warning">구매하기</button>
							<button type="button" class="btn btn-success">장바구니에 담기</button>
						</div>
					</div>
					<!-- //상품옵션 -->
					
					<!-- 상품 이미지 및 스펙 -->
					<div class="divInfo	col-md-12 productImage">
						<img class="productInfoImage" alt="상품 사진" src="/resources/images/${productVO.pimage_info1}"/>
						<img class="productInfoImage" alt="상품 사진" src="/resources/images/${productVO.pimage_info2}"/>
					</div>
					<div class="divInfo	col-md-12 productInfo">
						<h1>스팩</h1>
						<h3 class="info" style="padding-top:10px;">${productVO.pname} ${productVO.pcode}</h3>
						<div class="info">
							<div class="infoName specName1">스펙1</div>
							<div class="infoComment specInfo1">
								<div>스펙1</div>
							</div>
						</div>
						<div class="info">
							<div class="infoName specName2">스펙2</div>
							<div class="infoComment specInfo2">
								<div>스펙2</div>
							</div>
						</div>
						<div class="info">
							<div class="infoName specName3">스펙3</div>
							<div class="infoComment specInfo3">
								<div>스펙3</div>
							</div>
						</div>
					</div>
					<!-- //상품 이미지 및 스펙 -->
					
					<!-- 상품평 -->
					<div class="divInfo	col-md-12 review">
						<h1>상품평</h1>
						<div style="font-size:30px; font:bold">3.5(150건)</div>
						<div class="rate" style="scale: 2; left: 60px; top: 10px;">
							<span style="width: 50%"></span>
						</div>
						<div class="row" style="padding-top: 50px;">
							<div class="col-md-12">
								<table class="table" style="color: white;">
									<thead>
										<tr>
											<th>#</th>
											<th>아이디</th>
											<th>내용</th>
											<th>평점</th>
											<th>등록일</th>
											<th>수정</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>TB - Monthly</td>
											<td>01/04/2012</td>
											<td>Default</td>
											<td>Default</td>
											<td>Default</td>
											<td>Default</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- //상품평 -->
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>
