<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/resources/css/dongyeong/admin_table.css" rel="stylesheet" type="text/css" />
<script>
$(function(){
	//체크박스 이벤트
	$(".user-chkboxAll").change(function(){
		var checked = $(this).prop("checked");
		$(".user-chkbox").prop("checked", checked);
	});
	//페이징 처리
	$(".page-num").on("click",function(e){
		console.log(this);
		e.preventDefault();
		var pageNum = $(this).attr("href");
		console.log(pageNum);
		console.log("g",'${page.endPage}');
		sData = {
			"pageNum" : pageNum	
		}
		$.get("/admin/admin_user", sData, function(rData){
			
				$(".user-div").empty();
				$(".user-div").html(rData);
			
		});
	});
	//유저 테스트 생성 버튼
	$(".user-create").on("click",function(){
		$(".create-modal").modal("show");
	});
	//유저 테스트 모달창 생성 버튼
	$(".btn-create").on("click",function(){
		var tname = $("#test-name").val();
		var tid = $("#test-id").val();
		var tpw = $("#test-pw").val();
		var taddr = $("#test-addr").val();
		var tdetail = $("#test-addr-detail").val();
		var tbir = $("#test-bir").val();
		var tstate = $(".state:checked").val();
		var tphone = $("#test-phone").val();
		var memail = $("#test-email").val();
		
		sData = {
				mname : tname,
				mid : tid,
				mpw : tpw,
				maddr : taddr,
				maddr_detail : tdetail,
				mbirthday : tbir,
				mstate : tstate,
				mphone : tphone,
				memail : memail
		}
		
		$.get("/admin/create_user",sData,function(rData){
			console.log("44",rData)
			if(rData == true){
				alert("유저가 생성 되었습니다");
				$(".create-modal").modal("hide");
			}
		});
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
					alert(rData + "명의 유저를  복구 시켰습니다");
						sData = {
								"pageNum" : ${page.criteria.pageNum}
						}
					$.get("/admin/admin_user",sData,function(rData){
						$(".user-div").empty();
						$(".user-div").html(rData);
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
				$.get("/admin/admin_user",sData,function(rData){
					$(".user-div").empty();
					$(".user-div").html(rData);
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
		<div>
			<button type="button" class="user-create">테스트 유저 생성</button>
			<button type="button" class="user-suspend">사용자 정지</button>
			<button type="button" class="user-repair">사용자 복구</button>
		</div>
	</div>
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
					<button class="user-point-history" style="font-size: 13px; border-radius: 10px; border: 1px solid rgba(0,0,0,0.3);">내역보기</button>
				</div>
				<div class="cell">
					<span>${userList.mstate == 0? '정지' : '활동'}</span>
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
				<!-- user생성 모달 -->
			<div class="create-modal modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">테스트 유저 생성</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label">이름</label>
			            <input type="text" class="form-control" id="test-name" value="김동영">
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label">아이디</label>
			            <input type="text" class="form-control" id="test-id" value="qwe22">
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label">비밀번호</label>
			            <input type="password" class="form-control" id="test-pw" value="1234">
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label">연락처</label>
			            <input type="text" class="form-control" id="test-phone" value="01056302633">
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label">이메일</label>
			            <input type="email" class="form-control" id="test-email"value="qwer@name.com">
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label">주소</label>
			            <input type="text" class="form-control" id="test-addr" value="울산">
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label">상세주소</label>
			            <input type="text" class="form-control" id="test-addr-detail" value="중구">
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label">생일</label>
			            <input type="text" class="form-control" id="test-bir" value="121212">
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label">상태</label>
			            <div class="d-flex flex-direction-column">
				            <input type="radio" class="state form-control" id="test-state1" name="test-state" value="1">
				            <span>활동</span>
				            <input type="radio" class="state form-control" id="test-state0" name="test-state" value="0">
				             <span>정지</span>
			            </div>
			          </div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn-create btn btn-primary">생성</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div> <!-- user생성 모달 -->
		</div>
	</div>
</div>