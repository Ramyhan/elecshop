<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<%@ include file="/WEB-INF/views/include/myPage_sidebar.jsp" %>
<link rel="stylesheet" href="/resources/css/productList/productList.css"/>
<style>
	.iquiry-imessage {
		background-color: #202020;
	}
	.iquiry-ireply {
		background-color: #202020;
		border-top: solid 1px #FFD369;
	}
	.iquiry-ititle{
		color: white;
	}
	.iquiry-ititle:hover{
		color: #FFD369;
	}
</style>
<script>
$(function() {
	$(".btnDelete").click(function() {
		var that = $(this);
		var ino = $(this).attr("data-ino");
		$.ajax({
			"method" : "delete",
			"url" : "/iquiry/" + ino,
			"success" : function(rData) {
				if (rData == "true") {
					var deleteTarget = that.parent().parent().parent();
					deleteTarget.fadeOut(1000);
				}
			}
		});
	});
});
</script>
<div style=" height: 100%; background-color: #303030">
	<div class="myPage-iquiry">
		<div class="container myPage-iquiry-container" style="color: white;">
			<h1 style="color: white; font-family: 굴림체; margin-top:50px;">나의 문의 목록</h1>
			<div class="myPage-line"></div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div id="card-119400">
						<c:forEach items="${IquiryList}" var="iquiryVO">
							<div class="card" style="margin-bottom: 10px;">
								<div class="card-header iquiry-imessage">
									<div style="float: right; padding-left: 10px;">
									 	<button type="button" class="btn btn-danger btnDelete" data-ino="${iquiryVO.ino}">삭제</button>
									</div>
									 <a class="card-link iquiry-ititle" data-toggle="collapse"
									 		data-parent="#card-119400" href="#card-element-${iquiryVO.ino}">
									 	<span>Q: ${iquiryVO.imessage}</span>
									 	<span style="float: right;">
										 	<span><fmt:formatDate value="${iquiryVO.iregdate}" pattern="yy-MM-dd"/></span>
									 	</span>
									 </a>
									
								</div>
								<div  id="card-element-${iquiryVO.ino}" class="collapse iquiry-ireply">
									<div class="card-body">
										A: ${iquiryVO.ireply}
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>
