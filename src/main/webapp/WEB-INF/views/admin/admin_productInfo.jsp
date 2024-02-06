<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function(){
	$("#btn-productList").click(function(){
		$(location).attr("href","/admin/admin_product");
	});
	$("#btn-productUpdateFrm").click(function(){
		$("#frmUpdate").submit();
	});
});
</script>
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
							<span>고유번호</span>
							<input name="pname" class="product-name" type="text" value="${productInfo.pno}" readonly="readonly">
							<span>상품제목</span>
							<input name="pname" class="product-name" type="text" value="${productInfo.pname}" readonly="readonly">
							<span>상품가격</span>
							<input name="pname" class="product-name" type="text" value="${productInfo.pprice}" readonly="readonly"><fmt:formatNumber pattern="#,###" value="${productInfo.pprice}"/>
							<span>상품번호</span>
							<input name="pname" class="product-name" type="text" value="${productInfo.pcode}" readonly="readonly">
							<div>
								<span>상품종류:</span>
								<input type="radio" name="ptype" ${productInfo.ptype == 1? "checked" : ""} disabled>노트북
								<input type="radio" name="ptype" ${productInfo.ptype == 2? "checked" : ""} disabled>모니터
								<input type="radio" name="ptype" ${productInfo.ptype == 3? "checked" : ""} disabled>태블릿
								<input type="radio" name="ptype" ${productInfo.ptype == 4? "checked" : ""} disabled>음향기기
								<input type="radio" name="ptype" ${productInfo.ptype == 5? "checked" : ""} disabled>주변기기
							</div>
							<c:if test="${productInfo.pdno != 0 || productInfo.pdno == 3 || productInfo.pdno == 4}">
								<div>
									<span>카테고리:</span>
									<input type="radio" name="pdno" ${productInfo.pdno == 1? "checked" : ""} disabled>스피커
									<input type="radio" name="pdno" ${productInfo.pdno == 2? "checked" : ""} disabled>헤드셋
									<input type="radio" name="pdno" ${productInfo.pdno == 3? "checked" : ""} disabled>이어폰
									<input type="radio" name="pdno" ${productInfo.pdno == 4? "checked" : ""} disabled>마우스
									<input type="radio" name="pdno" ${productInfo.pdno == 5? "checked" : ""} disabled>키보드
								</div>
							</c:if>
								<div>
									<c:forEach var="option" items="${productInfo.optionList}">
										<c:if test="${option.otype == 1}">
											<div>
												<span>ram옵션:</span>
												<span>${option.oname}</span>
												<span><fmt:formatNumber pattern="#,###" value="${option.oprice }"/>원</span>
												<hr>
											</div>
										</c:if>
										<c:if test="${option.otype == 2}">
											<div>
												<span>ssd옵션:</span>
												<span>${option.oname}</span>
												<span><fmt:formatNumber pattern="#,###" value="${option.oprice }"></fmt:formatNumber>원</span>
												<hr>
											</div>
										</c:if>
										<c:if test="${option.otype == 3}">
											<div>
												<span>color옵션:</span>
												<span>${option.oname}</span>
												<hr>
											</div>
										</c:if>
									</c:forEach>
								</div>
							<div style="display: contents;">
								<span>메인 정보</span>
								<textarea rows="4" cols="50" readonly name="pmain_info">${productInfo.pinfo_main}</textarea>
							</div>
							<div style="display: contents;">
								<span>서브 정보1</span>
								<textarea rows="4" cols="50" readonly name="pmain_info">${productInfo.pinfo1}</textarea>
							</div>
							<div style="display: contents;">
								<span>서브 정보2</span>
								<textarea rows="4" cols="50" readonly name="pmain_info">${productInfo.pinfo2}</textarea>
							</div>
							<div style="display: contents;">
								<span>서브 정보3</span>
								<textarea rows="4" cols="50" readonly name="pmain_info">${productInfo.pinfo3}</textarea>
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
					<form id="frmUpdate" action="/admin/admin_product_updateForm" method="post">
						<input type="hidden" value="${productInfo.pno}" name="pno">
					</form>
						<button type="button" id="btn-productUpdateFrm">수정하러 가기</button>
						<button type="button" id="btn-productList">목록으로</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/bottom.jsp"%>