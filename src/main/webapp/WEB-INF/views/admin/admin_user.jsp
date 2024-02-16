<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function(){
	//체크박스 이벤트
	$(document).on("change",".user-chkboxAll",function(){
		var checked = $(this).prop("checked");
		$(".user-chkbox").prop("checked", checked);
	});
	//페이징 처리
	$(document).on("click",".page-num",function(e){
		console.log(this);
		e.preventDefault();
		var pageNum = $(this).attr("href");
		console.log(pageNum);
		console.log("g",'${page.endPage}');
		sData = {
			"pageNum" : pageNum	
		}
		$.get("/admin/admin_customtable", sData, function(rData){
			
				$(".div-main").empty();
				$(".div-main").append(rData);
			
		});
	});
	//유저 포인트 내역 버튼
	$(document).on("click",".user-point-history",function(){
		var that = $(this);
		var mid = $(this).attr("data-mid");
		$.get("/admin/userPointList",{"mid" : mid},function(rData){
			$(".modal-tbody").empty();
			$(".modal-title").text(mid + "님의 포인트 내역");
			modalTd = "";
			$(rData).each(function(i,obj){
				modalTd += "<div style='display: table-row; text-align: center;'>";
				modalTd += "<div class='modal-td'>";
				modalTd += "<span>" + rData[i].point_info + "</span>";
				modalTd += "</div>";
				modalTd += "<div class='modal-td'>";
				modalTd += "<span>" + rData[i].ppoint + "</span>";
				modalTd += "</div>";
				modalTd += "<div class='modal-td'>";
				modalTd += "<span>" + rData[i].regdate + "</span>";
				modalTd += "</div>";
				modalTd += "</div>";
			});
			$(".modal-tbody").append(modalTd);
		});
		$(".create-modal").modal("show");
		
	});
	
	//유저 정지 버튼
	$(".user-suspend").click(function(){
		var checked = $(".user-chkbox:checked").closest("div");
		var checkeds = [];
		checked.each(function(){
			if($(this).parent().children("div:eq(8)").text().trim() == "활동"){
				var chk = parseInt($(this).parent().children("div:eq(1)").text().trim());
				checkeds.push(chk);
			}
		});
		sData = {
				"mnos" : checkeds
		}
		console.log("checkeds", checkeds);
		if(checkeds != ""){
			$.post("/admin/userSuspend",sData,function(rData){
				if(rData != 0){
					alert(rData + "명의 유저를  정지 시켰습니다");
						sData = {
								"pageNum" : ${page.criteria.pageNum}
						}
					$.get("/admin/admin_userTable",function(rData){
						console.log("2424123", rData);
						$(".user-table").empty();
						$(".user-table").append(rData);
					});
				}
			});
		}else{
			alert("선택한 유저중에 정지 시킬 유저가 없습니다");
			return
		}
	});
	//유저 복구 버튼
	$(".user-repair").click(function(){
		var checked = $(".user-chkbox:checked").closest("div");
		var checkeds = [];
		checked.each(function(){
			if($(this).parent().children("div:eq(8)").text().trim() == "정지"){
				var chk = parseInt($(this).parent().children("div:eq(1)").text().trim());
				checkeds.push(chk);
			}
		});
		sData = {
				"mnos" : checkeds
		}
		console.log("checkeds", checkeds);
		if(checked != ""){
			$.post("/admin/userRepair",sData,function(rData){
				alert(rData + "명의 유저를  복구 시켰습니다");
				console.log("223214",${page.criteria.pageNum});
					sData = {
							"pageNum" : ${page.criteria.pageNum}
					}
				$.get("/admin/admin_userTable",function(rData){
					console.log("rdada", rData);
					$(".user-table").empty();
					$(".user-table").append(rData);
				});
			});
		}else{
			alert("선택한 유저중에 복구 시킬 유저가 없습니다")
			return
		}
	});
	$(".user-point-history").on("click",function(){
		$(".point-modal").fadeIn();
	})
});
</script>
<%@include file="/WEB-INF/views/include/top.jsp"%>
<div class="main-div">
<%@ include file="/WEB-INF/views/include/admin_sidebar.jsp"%>
	<div class="set-div">
		<div class="user-div">
	<div>
	<div></div>
		<h1>유저 관리 페이지</h1>
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
		<div>
			<button type="button" class="user-suspend">사용자 정지</button>
			<button type="button" class="user-repair">사용자 복구</button>
		</div>
	</div>
	<div class="div-main">
		<div class="second-div" style="background-color: white;" >
			<div class ="user-table">
				<div class="user-tbl-header">
					<div class="header-cell" style="opacity: 1">
						<input class="user-chkboxAll" type="checkbox">
					</div>
					<div class="header-cell">
						<span>#</span>
					</div>
					<div class="header-cell">
						<span>이름</span>
					</div>
					<div class="header-cell">
						<span>아이디</span>
					</div>
					<div class="header-cell">
						<span>이메일</span>
					</div>
					<div class="header-cell">
						<span>주소</span>
					</div>
					<div class="header-cell">
						<span>연락처</span>
					</div>
					<div class="header-cell">
						<span>포인트</span>
					</div>
					<div class="header-cell">
						<span>상태</span>
					</div>
				</div>
				<c:forEach var="userList" items="${userList}">
				<div class="user-div-row">
					<div class="cell">
						<input class="user-chkbox" type="checkbox">
					</div>
					<div class="cell">
						<span class="user-mno">${userList.mno}</span>
					</div>
					<div class="cell">
						<span>${userList.mname}</span>
					</div>
					<div class="cell">
						<span>${userList.mid}</span>
					</div>
					<div class="cell">
						<span>${userList.memail}</span>
					</div>
					<div class="cell">
						<span>${userList.maddr}/${userList.maddr_detail}</span>
					</div>
					<div class="cell">
						<span>${userList.mphone}</span>
					</div>
					<div class="cell">
						<span>${userList.mpoint}</span>
						<button type="button" data-mid="${userList.mid}" class="user-point-history" style="font-size: 13px; border-radius: 10px; border: 1px solid rgba(0,0,0,0.3);">내역보기</button>
					</div>
					<div class="cell">
						<span>
						<c:choose>
							<c:when test="${userList.mstate == 0}">정지</c:when>
							<c:when test="${userList.mstate == 1}">활동</c:when>
							<c:when test="${userList.mstate == 2}">탈퇴</c:when>
						</c:choose>
						</span>
					</div>
				</div>
				</c:forEach>
			</div>
			<div>
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				  <c:if test="${page.prev == true}">
				    <li class="page-item">
				      <a class="page-num page-link" href="${page.startPage - 1}" aria-label="Previous">
				        <span aria-hidden="true"><i class="fa fa-angle-double-left"></i></span>
				      </a>
				    </li>
				  </c:if>
				    <c:forEach begin="${page.startPage }" end="${page.endPage}" var="v">
				    	<li class="page-item"><a class="page-num page-link ${(page.criteria.pageNum == v) ? 'Active' : ''}" href="${v}">${v}</a></li>
				    </c:forEach>
				    <c:if test="${page.next == true}">
					    <li class="page-item">
					      <a class="page-num page-link" href="${page.endPage + 1}" aria-label="Next">
					        <span aria-hidden="true"><i class="fa fa-angle-double-right"></i></span>
					      </a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
			</div>
		</div>
				<!-- user생성 모달 -->
			<div class="create-modal modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel"></h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			          <div class="modal-table" style="display: table; width: 100%">
			          	<div style="display: table-row; text-align: center; background-color: #ffbe33">
				          	<div class="modal-thead" style="display: table-cell;">
				          		<span>포인트</span>
				          	</div>
				          	<div class="modal-thead" style="display: table-cell;">
				          		<span>사용 내역</span>
				          	</div>
				          	<div style="display: table-cell;">
				          		<span>사용/획득 날짜</span>
				          	</div>
			          	</div>
			          	<div class="modal-tbody" style="display: table-row-group;">
			          		
			          	</div>
			          </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div> <!-- user생성 모달 -->
	</div>
</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/bottom.jsp"%>