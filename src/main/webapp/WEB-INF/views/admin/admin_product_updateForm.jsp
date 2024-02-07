<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function(){
	$("#select-mno").find("option[value=${productInfo.mno}]").attr("selected",true);
	
	$("#btn-productList").click(function(){
		$(location).attr("href","/admin/admin_product");
	});
	$(document).on("click",".btn-delete",function(){
		console.log(this);
		var that = $(this);
		var ono = $(this).attr("data-ono");
		var pno = $(this).attr("data-pno");
		console.log(ono);
		console.log(pno);
		
		if(ono != "" && pno != ""){
			sData = {
					"ono" : ono,
					"pno" : pno
			}
			$.post("/admin/admin_deleteOption",sData,function(rData){
				console.log(rData);
				if(rData == true){
					var div = that.closest("div").parent();
					div.remove();
				}
			});
		}else{
		}
	});
	$("#btn-add-color").click(function(){
		
	});
});
</script>
<style>
	.ram-div,.ssd-div,.color-div{
		width: 15%;
		margin: 20 30 20 30;
	}
	.ram-magin-div,.ssd-magin-div,.color-magin-div{
	margin: 20 0 20 0;
	border: 1px solid rgba(0,0,0,0.5);
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/include/top.jsp"%>
<div class="main-div">
<%@ include file="/WEB-INF/views/include/admin_sidebar.jsp"%>
	<div class="set-div">
		<div class="user-div">
			<div>
				<h1>상품 상세페이지</h1>
			</div>
			<div class="div-main">
				<div class="second-div">
					<div style="width: 80%">
						<div style="display: flex; flex-direction: column;">
							<input name="pname" class="product-name" type="hidden" value="${productInfo.pno}">
							<span>상품제목</span>
							<input name="pname" class="product-name" type="text" value="${productInfo.pname}">
							<span>상품가격</span>
							<input name="pname" class="product-name" type="text" value="${productInfo.pprice}">
							<span>상품번호</span>
							<input name="pname" class="product-name" type="text" value="${productInfo.pcode}">
							<c:if test="${productInfo.pdno != 0 || productInfo.pdno == 3 || productInfo.pdno == 4}">
								<div>
									<span>카테고리:</span>
									<input type="radio" name="pdno" ${productInfo.pdno == 1? "checked" : ""} >스피커
									<input type="radio" name="pdno" ${productInfo.pdno == 2? "checked" : ""} >헤드셋
									<input type="radio" name="pdno" ${productInfo.pdno == 3? "checked" : ""} >이어폰
									<input type="radio" name="pdno" ${productInfo.pdno == 4? "checked" : ""} >마우스
									<input type="radio" name="pdno" ${productInfo.pdno == 5? "checked" : ""} >키보드
								</div>
							</c:if>
								<div>
									<div class="input-cell">
										<span>제조사</span>
										<select name="mno" class="select-option" id="select-mno" style="text-align: center;">
											<option>--선택--</option>
											<option value="1">삼성</option>
											<option value="2">엘지</option>
											<option value="3">애플</option>
											<option value="4">델</option>
											<option value="5">아수스</option>
											<option value="6">레이져</option>
											<option value="7">msi</option>
											<option value="8">레노버</option>
											<option value="9">hp</option>
											<option value="10">소니</option>
											<option value="11">젠하이져</option>
											<option value="12">akg</option>
											<option value="13">브리츠</option>
											<option value="14">크리에이티브</option>
											<option value="15">로지텍</option>
											<option value="16">앱코</option>
										</select>
									</div>
								</div>
							<div style="display: flex;">
								<c:if test="${productInfo.ptype == 1 or productInfo.ptype == 3}">
									<div class="ram-div">
										<button>RAM<i class="fa fa-plus"></i></button>
										<c:forEach items="${productInfo.ramList}" var="ram">
										<div class="ram-magin-div">
											<div class="ram-option-div" style="display: flex;flex-direction: column;">
												<div style="display: flex; justify-content: space-between;">
													<span>ram옵션</span>
													<button data-ono="${ram.ono}" data-pno="${ram.pno}" type="button" class="btn-delete"><i class="fa fa-times"></i></button>
												</div>
												<select name="ramList[0].oname" class="select-option select-ram product-ram-select">
													<option>--선택--</option>
													<option value="8GB" ${ram.oname == '8GB'? 'selected' : ""}>8GB</option>
													<option value="16GB"  ${ram.oname == '16GB'? 'selected' : ""}>16GB</option>
													<option value="32GB" ${ram.oname == '32GB'? 'selected' : ""}>32GB</option>
												</select>
												<input type="number" value="${ram.oprice}" pattern="#,###">
											</div>
										</div>
										</c:forEach>
									</div>
								</c:if>
								<c:if test="${productInfo.ptype == 1 or productInfo.ptype == 3}">
									<div class="ssd-div">
										<button>SSD<i class="fa fa-plus"></i></button>
										<c:forEach items="${productInfo.ssdList }" var="ssd">
											<div class="ssd-magin-div">
												<div class="ssd-option-div" style="display: flex;flex-direction: column;">
													<div style="display: flex; justify-content: space-between;">
														<span>ssd옵션</span>
														<button data-ono="${ssd.ono}" data-pno="${ssd.pno}" type="button" class="btn-delete"><i class="fa fa-times"></i></button>
													</div>
													<select name="ssdList[0].oname" class="select-option select-ssd product-ram-select">
														<option>--선택--</option>
														<option value="128GB"  ${ssd.oname == '128GB'? 'selected' : ""}>128GB</option>
														<option value="256GB" ${ssd.oname == '256GB'? 'selected' : ""}>256GB</option>
														<option value="512GB" ${ssd.oname == '512GB'? 'selected' : ""}>512GB</option>
														<option value="1TB" ${ssd.oname == '1TB'? 'selected' : ""}>1TB</option>
													</select>
													<input type="number" value="${ssd.oprice}" pattern="#,###">
												</div>
											</div>
										</c:forEach>
									</div>
								</c:if>
								<c:if test="${productInfo.ptype != 2}">
									<div class="color-div">
										<button id="btn-add-color">COLOR<i class="fa fa-plus"></i></button>
										<c:forEach items="${productInfo.colorList}" var="color">
											<div class="color-magin-div">
												<div id="color-option-div" class="" style="display: flex;flex-direction: column;">
													<div style="display: flex; justify-content: space-between;">
														<span>color옵션</span>
														<button data-ono="${color.ono}" data-pno="${color.pno}" type="button" class="btn-delete"><i class="fa fa-times"></i></button>
													</div>
													<select name="colorList[0].oname" class="select-option select-color product-color">
														<option>--선택--</option>
														<option value="Black" ${color.oname == 'Black'? 'selected' : ""}>Black</option>
														<option value="Red" ${color.oname == 'Red'? 'selected' : ""}>Red</option>
														<option value="Gray" ${color.oname == 'Gray'? 'selected' : ""}>Gray</option>
														<option value="Blue" ${color.oname == 'Blue'? 'selected' : ""}>Blue</option>
													</select>
												</div>
											</div>
										</c:forEach>
									</div>
								</c:if>
							</div>
							<div style="display: contents;">
								<span>메인 정보</span>
								<textarea rows="4" cols="50"  name="pmain_info">${productInfo.pinfo_main}</textarea>
							</div>
							<div style="display: contents;">
								<span>서브 정보1</span>
								<textarea rows="4" cols="50"  name="pmain_info">${productInfo.pinfo1}</textarea>
							</div>
							<div style="display: contents;">
								<span>서브 정보2</span>
								<textarea rows="4" cols="50"  name="pmain_info">${productInfo.pinfo2}</textarea>
							</div>
							<div style="display: contents;">
								<span>서브 정보3</span>
								<textarea rows="4" cols="50"  name="pmain_info">${productInfo.pinfo3}</textarea>
							</div>
							<div style="padding: 20 0 20 0">
								<c:forEach var="image" items="${productInfo.attrProductList}">
									<c:if test="${image.athoumbnail == 'y' }">
										<span>썸네일 이미지</span>
									</c:if>
									<c:if test="${image.athoumbnail == 'n' }">
										<span>부 이미지</span>
									</c:if>
									<div>
										<img src="/display?fileName=${image.aurl}" style="width: 150;height: 80;border: 1px solid;">
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div  style="padding: 10 0 30 0">
						<button type="button">수정하기</button>
						<button type="button" id="btn-productList">목록으로</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/bottom.jsp"%>