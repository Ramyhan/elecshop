<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	$(".selectOption").change(function() {
		var option1Price = parseInt($("#selectOption1").val());
		var option2Price = parseInt($("#selectOption2").val());
		var option3Price = parseInt($("#selectOption3").val());
		var totalOptionPrice = option1Price + option2Price + option3Price
// 		console.log("totalOptionPrice: ", totalOptionPrice);
		
		var totalPrice = parseInt("${productVO.pprice}") + totalOptionPrice;
// 		console.log("totalPrice: ", totalPrice);
		
		$("#totalPrice").text(totalPrice);
	});
	
	// 리뷰등록 모달 띄우기
	$("#regReview").click(function() {
		$("#myModalLabel").text("상품평 등록");
		$("#rcontent").val("");
		$("#registerReview").val("작성 완료");
		$("#modal-review").modal("show");
	});
	
	// 리뷰등록 모달 띄우기
	$(".btnReviewUpdate").click(function() {
		var rno = $(this).attr("data-update-rno");
		var url = "/review/" + rno;
		
		$.get(url, function(rData) {
			console.log("rData: ", rData);
			$("#myModalLabel").text("상품평 수정");
			
			
			$("#mid").val(rData.mid);
			$("#rcontent").val(rData.rcontent);
			var test = $(".rgrade").is("text", rData.rgade + "점");
			console.log("test: ", test);
			
			$("#registerReview").val("수정 완료");
			$("#modal-review").modal("show");
		});
	});
	
	// 리뷰 등록 버튼
	$("#registerReview").click(function() {
		var pno = $(this).attr("data-pno");
		var mid = $("#mid").val();
		var rcontent = $("#rcontent").val();
		var rgrade = $("#rgrade:checked").val();
		
		var url = "/review/register";
		var method = "post";
		var sData = {
				"pno" : pno,
				"mid" : mid,
				"rcontent" : rcontent,
				"rgrade" : rgrade
		}
		console.log("sData: ", sData);
		
		$.ajax({
			"method" : method,
			"url" : url,
			"data" : JSON.stringify(sData),
			"contentType" : "application/json",
			"success" : function(rData) {
				console.log("rData: ", rData);
				if (rData == "true") {
					alert("등록을 성공적으로 마쳤습니다.");
					$("#modal-review").modal("hide");
				}
			}
		})
	});
	
	// 리뷰 삭제
	$(".btnReviewDelete").click(function() {
		var that = $(this);
		var rno = $(this).attr("data-delete-rno");
		$.ajax({
			"method" : "delete",
			"url" : "/review/" + rno,
			"success" : function(rData) {
				if (rData == "true") {
					var deleteTarget = that.parent().parent();
					deleteTarget.fadeOut(1000);
				}
			}
		});
// 		$.delete("/review/" + rno, sData, function(rData) {
// 			console.log("rData: ", rData);
// 		});
	});
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
								<select id="selectOption1" name="option" class="selectOption" style="width: 100%; border-radius:10px;">
									<option value="0" selected>-----옵션을 선택해주세요-----</option>
								<c:forEach items="#{optionList}" var="option">
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
								<select id="selectOption2" name="option" class="selectOption" style="width: 100%; border-radius:10px;">
									<option value="0" selected>-----옵션을 선택해주세요-----</option>
								<c:forEach items="#{optionList}" var="option">
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
								<select id="selectOption3" name="option" class="selectOption" style="width: 100%; border-radius:10px;">
									<option value="0" selected>-----옵션을 선택해주세요-----</option>
								<c:forEach items="#{optionList}" var="option">
								<c:if test="${ option.otype == 3 }">
									<option value="${option.oprice}">${option.oname}(+${option.oprice})</option>
								</c:if>
								</c:forEach>
								</select>
							</div>
						</div>
						
						<div style="padding: 10px 0px 10px 0px;">
							<div style="font-size: 30px; font-family: '고딕'">
								현재가: <span id="totalPrice">${productVO.pprice}</span>원
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
						<div class="row" style="padding-top: 30px;">
						<button type="button" class="btn btn-primary" id="regReview" style="left: 100px; margin:0px 0px 10px 15px;">
							상품평 보기
						</button>
						<button type="button" class="btn btn-success" id="regReview" style="left: 100px; margin:0px 0px 10px 15px;">
							상품평 등록
						</button>
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
										<c:forEach items="${reviewList}" var="review">
										<tr>
											<td>${review.rno}</td>
											<td>${review.mid}</td>
											<td>${review.rcontent}</td>
											<td>${review.rgrade}</td>
											<td><fmt:formatDate value="${review.rregdate}" pattern="yyyy-MM-dd"/></td>
											<td><button type="button" class="btn btn-warning btnReviewUpdate" data-update-rno="${review.rno}">수정</button></td>
											<td><button type="button" class="btn btn-danger btnReviewDelete" data-delete-rno="${review.rno}">삭제</button></td>
										</tr>
										</c:forEach>
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
	
	<!-- 리뷰등록 모달창 -->
	<div class="row">
		<div class="col-md-12">
			
			<div class="modal fade" id="modal-review" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								상품평 등록
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<label for="mid">작성자</label>
							<input class="form-control" type="text" id="mid" class="mid">
							<label for="rcontent">내용</label>
							<textarea class="form-control" id="rcontent" class="rcontent"></textarea>
							<label>평점</label>
							<div class="col-md-12">
								<input type="radio" name="rgrade" id="rgrade" class="rgrade" value="1"/>1점
								&emsp;<input type="radio" name="rgrade" id="rgrade" class="rgrade" value="2"/>2점
								&emsp;<input type="radio" name="rgrade" id="rgrade" class="rgrade" value="3" checked/>3점
								&emsp;<input type="radio" name="rgrade" id="rgrade" class="rgrade" value="4"/>4점
								&emsp;<input type="radio" name="rgrade" id="rgrade" class="rgrade" value="5"/>5점
							</div>
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" id="registerReview" data-pno="${productVO.pno}">
								작성 완료
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								취소
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
	
	
	
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>
