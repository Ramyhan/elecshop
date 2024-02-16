<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/resources/css/dongyeong/admin_table.css" rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<link href="/resources/css/dongyeong/table.css" rel="stylesheet" />
<link href="/resources/css/dongyeong/admin.css" rel="stylesheet" />
<script>
$(function(){
		var mid = 0;
		var that = "";
	$(".btn-point-status").click(function(e){
		mid = $(this).attr("data-mid");
		var conf = confirm("아이디 " +mid+" 의 포인트를 수정하겠습니까?");
		that = $(this);
// 		console.log(that);
// 		console.log(ono);
		if(conf == true){
			$("#modal-order").modal();
		}else{
			return false;
		}
	});
	
	$("#btn-order-status-submit").click(function(){
		var point = $("#modal-point-status").val();
		var sData = {
				"ppoint" : point,
				"mid" : mid
		}
		$("#modal-order").modal("hide");
		$.post("/admin/adminUpdatePoint", sData, function(rData){
			console.log(rData);
			if(rData == "success"){
				console.log("완료");
			}
		});
	});
	
	
	$(".a-point_mid").click(function(){
		var mid = $(this).attr("data-mid");
		var point = $(this).parent();
		var me = point.find("p");
		console.log(mid);
		if(me.length){
			console.log("있음");
			me.remove();
		}else{
			console.log("없음");
			$.post("/getPoint", {mid : mid}, function(rData){
				console.log(rData);
				point.append("<p>포인트 : "+ rData +"</p>");
			});
		}
		console.log(me);
		console.log(point);
	});
});
</script>
<%@include file="/WEB-INF/views/include/top.jsp"%>
<div class="main-div">
<%@ include file="/WEB-INF/views/include/admin_sidebar.jsp"%>
	<div class="set-div">
		<div class="user-div">
			<div>
				<h1>포인트 페이지</h1>
			</div>
			<div class="user-devel">
				<div class="d-flex justify-content-end">
					<select>
						<option>
							고유번호
						</option>
						<option>
							이름
						</option>
						<option>
							아이디
						</option>
						<option>
							이메일
						</option>
					</select>
					<input class="user-input" type="text" placeholder="Search">
					<button>
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
			<div class="div-main">
				<div class="second-div" style="background-color: white;" >
					<div class ="user-table">
						<div class="user-tbl-header">
							<div class="header-cell">
								<span>#</span>
							</div>
							<div class="header-cell">
								<span>날짜</span>
							</div>
							<div class="header-cell">
								<span>아이디</span>
							</div>
							<div class="header-cell">
								<span>포인트</span>
							</div>
							<div class="header-cell">
								<span>포인트 코드</span>
							</div>
							<div class="header-cell">
								<span>포인트 정보</span>
							</div>
							<div class="header-cell">
							</div>
						</div>
					
					<c:forEach var="vo" items="${pointMap.pointList}">
						<div class="user-div-row">
							<div class="cell">
							<span>${vo.pno }</span>
							</div>
							<div class="cell">
								<span>
								<fmt:formatDate value="${vo.regdate}" pattern="yy-MM-dd hh:mm:ss"/>
								</span>
							</div>
							<div class="cell">
								<a class="a-point_mid" data-mid="${vo.mid}">${vo.mid}</a>
							</div>
							<div class="cell">
								<span>${vo.ppoint}</span>
							</div>
							<div class="cell">
								<span>${vo.point_code}</span>
							</div>
							<div class="cell">
								<span>
								${vo.point_info }
								</span>
							</div>
							<div class="cell">
							<button type="button" class="btn-point-status" data-mid="${vo.mid}">
							<i class="fab fa-bitcoin"></i>
							</button>
							</div>
						</div><!-- 여기 -->
						</c:forEach>
					</div>
					<div>
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						  <c:if test="${pointMap.page.prev == true}">
						    <li class="page-item">
						      <a class="page-num page-link" href="${pointMap.page.startPage - 1}" aria-label="Previous">
						        <span aria-hidden="true"><i class="fa fa-angle-double-left"></i></span>
						      </a>
						    </li>
						  </c:if>
						  <c:forEach begin="${pointMap.page.startPage}" end="${pointMap.page.endPage}" var="v">
						    	<li class="page-item"><a class="page-num page-link ${(pointMap.pagecriteria.pageNum == v) ? 'Active' : ''}" href="${v}">${v}</a></li>
						  </c:forEach>
						  <c:if test="${pointMap.page.next == true }">
							    <li class="page-item">
							      <a class="page-num page-link" href="${pointMap.page.endPage + 1}" aria-label="Next">
							        <span aria-hidden="true"><i class="fa fa-angle-double-right"></i></span>
							      </a>
							    </li>
						  </c:if>
						  </ul>
						</nav>
					</div>
					<div class="popup">
						<div class="popup-cover">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid">
	
</div>



<!-- 모달 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="modal fade" id="modal-order" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								포인트 수정
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input class="form-control mr-sm-2" type="number" id="modal-point-status">
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" id="btn-order-status-submit">
								입력 완료
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/bottom.jsp"%>