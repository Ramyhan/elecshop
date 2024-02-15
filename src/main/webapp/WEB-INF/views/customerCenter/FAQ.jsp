<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/customerCenterTop.jsp"%>
<script>
$(function(){
	$(".card-a").click(function(){
		if($(this).attr("aria-expanded") == "true"){
			$(this).find(".question-up").css("opacity", "0%");
			$(this).find(".question-down").css("opacity", "100%");
		}else{
			$(this).find(".question-up").css("opacity", "100%");
			$(this).find(".question-down").css("opacity", "0%");
		}
	});
	
});
</script>
<style>
body{
 	background-color: white;
}
.faq-card{ 
  	display: block; 
} 
.card-link{ 
  	display: flex; 
  	justify-content: space-between; 
}
a{
	color: black;
}
i{
	margin-top: 5px;
}
.card-body{
	border-bottom: 2px solid;
	background-color: white;
	color: gray;
	border-top: 0px;
}
.question-up{
	position: absolute;
	left: 96.35%;
	opacity: 0%;
}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="margin-top: 4px;">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-${not empty loginInfo? 4 : 8}">
					<table class="table">
						<thead>
							<tr>
								<th>공지사항</th>
								<th></th>
								<th style="text-align: right;"><a href="/customerCenter/notice">더보기</a></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="top5Notice" items="${top5Notice}">
								<tr>
									<td>(${top5Notice.ncategory})</td>
									<td>${top5Notice.ntitle}</td>
									<td style="text-align: right;">
										<fmt:formatDate value="${top5Notice.nregdate}"/>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<c:if test="${not empty loginInfo}">
					<div class="col-4">
						<table class="table">
							<thead>
								<tr>
								<th>문의 내역</th>
								<th></th>
								<th></th>
								<th style="text-align: right;"><a href="/myPage/myIquiry">더보기</a></th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${top5Iquiry}" var="iquiryVO">
								<tr>
									<td>${iquiryVO.ino}</td>
									<td>${iquiryVO.ititle}</td>
									<td></td>
									<td style="text-align: right;">
										<fmt:formatDate value="${iquiryVO.iregdate}" pattern="yyyy-MM-dd"/>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 질문카드 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8" style="margin-bottom: 50px;">
			<div class="d-flex justify-content-between">
			<h3 style="font">자주 묻는 질문</h3>
			<a href="/customerCenter/question">더보기</a>
			</div>	
			<hr style="border: solid;">
			<div id="card-51726" >
			<c:forEach var="questionTop5" items="${top5Question}">
				<div class="faq-card">
					<div class="card-header">
						 <a class="card-a question card-link" data-toggle="collapse" data-parent="#card-51726" href="#card-${questionTop5.qno}">
						  <i class="fa fa-question-circle"></i>
						 <span style="width:100%; margin-left:9px">${questionTop5.qtitle}</span>
						 <i class="question-down fa fa-angle-down"></i>
						  <i class="question-up fa fa-angle-up"></i>
						 </a>
					</div>
					<div id="card-${questionTop5.qno}" class="collapse">
						<div class="card-body">
							${questionTop5.qcontent }
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		<!-- //질문카드 -->
		<div class="col-md-2">
		
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>