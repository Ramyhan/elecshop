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
	
	.review {
		display: none;
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
	
	// 리뷰 더보기 버튼
	$(".review").slice(0, 6).show();
	$("#load").click(function(e) {
		e.preventDefault();
		$(".review:hidden").slice(0, 6).show(500);
		if ($(".review:hidden").length == 0) {
			alert("상품평의 끝입니다.")
		}
	});
	
	// 옵션 선택시 현재가격 변경
	$(".selectOption").change(function() {
		var option1Price = parseInt($("#selectOption1").val());
		var option2Price = parseInt($("#selectOption2").val());
		var option3Price = parseInt($("#selectOption3").val());
		var totalOptionPrice = option1Price + option2Price + option3Price
		
		var totalPrice = parseInt("${productVO.pprice}") + totalOptionPrice;
		
		$("#totalPrice").text(totalPrice);
	});
	
	// 리뷰등록 모달 띄우기
	$("#regReview").click(function() {
		$("#myModalLabel").text("상품평 등록");
		$("#mid").val("${loginInfo.mid}");
		$("#rcontent").val("");
		$("#registerReview").text("작성 완료");
		$("#modal-review").modal("show");
	});
	
	// 리뷰수정 모달 띄우기
	$(".btnReviewUpdate").click(function() {
		var rno = $(this).attr("data-update-rno");
		var url = "/review/" + rno;
		
		$.get(url, function(rData) {
			console.log("rData: ", rData);
			$("#myModalLabel").text("상품평 수정");
			
			
			$("#mid").val(rData.mid);
			$("#rcontent").val(rData.rcontent);
			$(".rgrade[value='" + rData.rgrade + "']").attr("checked", true);
			
			$("#registerReview").text("수정 완료");
			$("#registerReview").attr("data-rno", rno);
			$("#modal-review").modal("show");
		});
	});
	
	// 리뷰 등록 버튼
	$("#registerReview").click(function() {
		var rno = $(this).attr("data-rno");
		var pno = $(this).attr("data-pno");
		var mid = $("#mid").val();
		var rcontent = $("#rcontent").val();
		var rgrade = $("#rgrade:checked").val();
		
		var url = "";
		var method = "";
		var coment = "";
		
		if($("#registerReview").text() == "작성 완료") {
			url = "/review/register";
			method = "post";
			coment = "등록";
		} else {
			url = "/review/update";
			method = "put";
			coment = "수정";
		}
		
		var sData = {
				"rno" : rno,
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
					alert(coment + "을 성공적으로 마쳤습니다.");
					$("#modal-review").modal("hide");
// 					$("#reviewTable").load(window.location.href + " #reviewTable");
					location.reload();
				}
			}
		});
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
	});
	
	// 장바구니 추가
	$("#btnCart").click(function() {
		var pno = $(this).attr("data-pno");
		var mid = "${loginInfo.mid}";
		var cname = "${productVO.pname}";
		var cimage = "${productVO.pimage_thoumb}"
		var totalPrice = $("#totalPrice").text();
		
		var option = "";
		for(var v = 1; v <= $(".selectOption").length; v++) {
			var index = parseInt($("#selectOption" + v + " option").index($("#selectOption" + v + "  option:selected")));
			console.log("index: ", index);
			
			if (v == 1 && index == 0) {
				alert("색상을 선택해 주세요.")
				return;
			}
			
			if (index > 0) {
				optionName = $("#optionName" + v).text();
				optionInfo = $("#selectOption" + v + "  option:selected").text();
				option += optionName + ":" + optionInfo + ",";
			}
		}
		
		var sData = {
			"pno" : pno,
			"mid" : mid,
			"cname" : cname,
			"cimage" : cimage,
			"cprice" : totalPrice,
			"coption" : option
		};
		
		console.log("sData: ", sData);
		$.post("/addCart", sData, function(rData) {
			if (rData == "true") {
				var confirmFlag = confirm("장바구니에 넣었습니다. 장바구니로 이동하시겠습니까?")
				if(confirmFlag) {
					location.href = "/cart";
				}
			}
		});
	});
	
	// 찜목록 추가 및 삭제
	var isLike = "${isLike}";
	console.log("isLike: ", isLike);
	if (isLike == "true") {
		$("#btnLike").css({"color" : "red"});
		$("#btnLike").attr({"title" : "찜해제"});
		$("#btnLike").attr({"data-status" : "red"});
	}
	
	$("#btnLike").click(function() {
		var that = $(this);
		var status = $(this).attr("data-status");
		console.log("status: ", status);
		var sData = {
				"mid" : "${loginInfo.mid}",
				"pno" : ${productVO.pno}
		}
		if(status == "red") {
			$.post("/like/removeByPno", sData, function(rData) {
				console.log("remove rData: ", rData);
				if (rData == "true") {
					that.css({"color" : ""});
					that.attr({"title" : "찜하기"});
					that.attr({"data-status" : "white"});
				}
			});
		} else {
			$.post("/like/add", sData, function(rData) {
				console.log("add rData: ", rData);
				if (rData == "true") {
					that.css({"color" : "red"});
					that.attr({"title" : "찜해제"});
					that.attr({"data-status" : "red"});
				}
			});
		}
	});
});
</script>
<body>
	<div id="main" style="color: white;">
		<div class="container">
			<div class="section">
				<div class="row">
					<div class="col-md-7" style="float:right;">
						<img id="productMainImage" alt="상품 사진" src="/resources/images/${productVO.pimage_thoumb}"/>	
					</div>
					<div class="col-md-5" style="border: solid  1px #ffbe33; border-radius:10px;">
						<h1 style="font-weight: 600;">${productVO.pname}</h1><br>
						<div style="float:left;">${productVO.pcode}</div><br>
						<div class="rate" style="float:left;">
							<span style="width: ${gradeDTO.persent}%"></span>
						</div>
						<div style="margin-left:130px;">${gradeDTO.average}점 (${gradeDTO.count}건)</div><br><br>
						<h3>기준가: <fmt:formatNumber pattern="#,###">${productVO.pprice}</fmt:formatNumber>원</h3><br><br>
						
						<!-- 상품옵션 -->
						<div class="divOptionName" id="optionName1">Color</div>
						<div class="divOption">
							<div>
								<select id="selectOption1" name="option" class="selectOption" style="width: 100%; border-radius:10px;">
									<option value="0" selected>-----옵션을 선택해주세요-----</option>
								<c:forEach items="#{optionList}" var="option">
								<c:if test="${ option.otype == 3 }">
									<option value="${option.oprice}">${option.oname}(+${option.oprice})</option>
								</c:if>
								</c:forEach>
								</select>
							</div>
						</div><br>
						<div class="divOptionName" id="optionName2">SSD</div>
						<div class="divOption">
							<div>
								<select id="selectOption2" name="option" class="selectOption" style="width: 100%; border-radius:10px;">
									<option value="0" selected>-----옵션을 선택해주세요-----</option>
								<c:forEach items="#{optionList}" var="option">
								<c:if test="${ option.otype == 1 }">
									<option value="${option.oprice}">${option.oname}(+${option.oprice})</option>
								</c:if>
								</c:forEach>
								</select>
							</div>
						</div><br>
						<div class="divOptionName" id="optionName3">RAM</div>
						<div class="divOption">
							<div>
								<select id="selectOption3" name="option" class="selectOption" style="width: 100%; border-radius:10px;">
									<option value="0" selected>-----옵션을 선택해주세요-----</option>
								<c:forEach items="#{optionList}" var="option">
								<c:if test="${ option.otype == 2 }">
									<option value="${option.oprice}">${option.oname}(+${option.oprice})</option>
								</c:if>
								</c:forEach>
								</select>
							</div>
						</div>
						
						<div style="padding: 10px 0px 10px 0px;">
							<div style="font-size: 30px; font-family: '고딕'">
								현재가: <span id="totalPrice"><fmt:formatNumber pattern="#,###">${productVO.pprice}</fmt:formatNumber></span>원
							</div>
							<button type="button" class="btn btn-warning">구매하기</button>
<!-- 							<button type="button" class="btn btn-success">장바구니에 담기</button> -->
							<i class="fa fa-shopping-cart" id="btnCart" style="scale:2; margin-left:15px;"
								title="장바구니에 담기" data-pno="${productVO.pno}"></i>
							<i class="fa fa-heart" id="btnLike" style="scale:2; margin-left:30px;"
								title="찜하기" data-pno="${productVO.pno}" data-status=""></i>
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
						<div style="font-size:30px; font:bold">${gradeDTO.average}점 (${gradeDTO.count}건)</div>
						<div class="rate" style="scale: 2; left: 60px; top: 10px;">
							<span style="width: ${gradeDTO.persent}%"></span>
						</div>
						<div class="row" style="padding-top: 30px;">
<!-- 						<button type="button" class="btn btn-primary" id="showReview" style="left: 100px; margin:0px 0px 10px 15px;"> -->
<!-- 							상품평 보기 -->
<!-- 						</button> -->
						<button type="button" class="btn btn-success" id="regReview" style="left: 100px; margin:0px 0px 10px 15px;">
							상품평 등록
						</button>
							<div class="col-md-12" id="reviewTable">
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
										<tr class="review">
											<td>${review.rno}</td>
											<td>${review.mid}</td>
											<td>${review.rcontent}</td>
											<td>${review.rgrade}</td>
											<td><fmt:formatDate value="${review.rregdate}" pattern="yyyy-MM-dd"/></td>
											<c:choose>
												<c:when test="${review.mid == loginInfo.mid}">
													<td><button type="button" class="btn btn-warning btnReviewUpdate" data-update-rno="${review.rno}">수정</button></td>
													<td><button type="button" class="btn btn-danger btnReviewDelete" data-delete-rno="${review.rno}">삭제</button></td>
												</c:when>
												<c:otherwise>
													<td></td>
													<td></td>
												</c:otherwise>
											</c:choose>
										</tr>
										</c:forEach>
										<tr>
											<th colspan="7" style="text-align:center;">
												<button type="button" class="btn btn-warning"  id="load">상품평 더보기</button>
											</th>
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
							<input class="form-control" type="text" id="mid" class="mid" readonly>
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
