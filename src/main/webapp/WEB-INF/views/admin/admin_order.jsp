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
		var ono = 0;
		var that = "";
	$(".btn-order-status").click(function(e){
		ono = $(this).attr("data-ono");
		var conf = confirm(ono+"번의 주문의 송장번호를 입력하시겠습니까?");
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
		var status = $("#modal-order-status").val();
		var sData = {
				"status" : status,
				"ono" : ono
		}
		$("#modal-order").modal("hide");
		$.post("/admin/updateOrderStatus", sData, function(rData){
			console.log(rData);
			if(rData == "success"){
				var div = that.parent().parent().find(".cell-status").find("span").text("발송 완료");
				console.log(div);
			}
		});
	});
});
</script>
<%@include file="/WEB-INF/views/include/top.jsp"%>
<div class="main-div">
<%@ include file="/WEB-INF/views/include/admin_sidebar.jsp"%>
	<div class="set-div">
		<div class="user-div" style="width: 100%; height: 100%;">
			<div>
				<h1>유저 관리 페이지</h1>
			</div>
			<div class="user-devel" style="width: 95%; height: 15%;  background-color: white;">
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
			<div class="second-div" style="background-color: white;" >
				<div class ="user-table">
					<div class="user-tbl-header">
						<div class="header-cell">
							<span>#</span>
						</div>
						<div class="header-cell">
							<span>구매일자</span>
						</div>
						<div class="header-cell">
							<span>수령인</span>
						</div>
						<div class="header-cell">
							<span>핸드폰 번호</span>
						</div>
						<div class="header-cell">
							<span>주소</span>
						</div>
						<div class="header-cell">
							<span>가격</span>
						</div>
						<div class="header-cell">
							<span>배송비</span>
						</div>
						<div class="header-cell">
							<span>배송</span>
						</div>
					</div>
					<c:forEach var="vo" items="${orderMap.orderList}">
					<div class="user-div-row">
						<div class="cell">
						<a class="p-order_detail">${vo.ono }</a>
						</div>
						<div class="cell">
							<span>
							<fmt:formatDate value="${vo.regdate}" pattern="yy-MM-dd hh:mm:ss"/>
							</span>
						</div>
						<div class="cell" style="text-align: left;">
							<span style="font-size: 20px;">${vo.oname}</span>
						</div>
						<div class="cell">
							<span>${vo.ophone}</span>
						</div>
						<div class="cell">
							<span>(${vo.opost_code }) ${vo.oaddr } ${vo.oaddr_detail }</span>
							<div class="row">
		<div class="col-md-12">
			<div id="card-863136">
				<div>
					<div>
						 <a class="card-link collapsed" data-toggle="collapse" data-parent="#card-863136" href="#card-element-${vo.ono }">상세 보기</a>
					</div>
					<div id="card-element-${vo.ono }" class="collapse">
						<div class="card-body card-order_detail-pname">
						<c:forEach var="odVO" items="${vo.list }">
						<p>${odVO.pname }</p><p>${odVO.odoption}</p> 
					</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
						</div>
						<div class="cell">
							<span>
							<fmt:formatNumber value="${vo.oprice}" pattern="#,###"/>원
							</span>
						</div>
						<div class="cell">
							<span>${vo.odelivery}</span>
						</div>
						<div class="cell cell-status">
						<c:choose>
							<c:when test="${vo.delivery_status != 0}">
								<span>발송</span>
							</c:when>
							<c:otherwise>
								<span>발송 준비중</span>
							</c:otherwise>
						</c:choose>
						</div>
						<div class="cell">
						<button type="button" class="btn-order-status" data-ono="${vo.ono}">
						<i class="fa fa-box"></i>
						</button>
						</div>
					</div><!-- 여기 -->
					</c:forEach>
				</div>
				<div>
					<nav aria-label="Page navigation example">
					  <ul class="pagination">
					  <c:if test="${orderMap.page.prev == true}">
					    <li class="page-item">
					      <a class="page-num page-link" href="${orderMap.page.startPage - 1}" aria-label="Previous">
					        <span aria-hidden="true"><i class="fa fa-angle-double-left"></i></span>
					      </a>
					    </li>
					  </c:if>
					  <c:forEach begin="${orderMap.page.startPage}" end="${orderMap.page.endPage}" var="v">
					    	<li class="page-item"><a class="page-num page-link ${(productMap.pagecriteria.pageNum == v) ? 'Active' : ''}" href="${v}">${v}</a></li>
					  </c:forEach>
					  <c:if test="${orderMap.page.next == true }">
						    <li class="page-item">
						      <a class="page-num page-link" href="${orderMap.page.endPage + 1}" aria-label="Next">
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
								송장 번호
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input class="form-control mr-sm-2" type="number" id="modal-order-status">
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