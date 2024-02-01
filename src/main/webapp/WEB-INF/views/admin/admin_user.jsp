<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.set-div{
		background-color: F0F5F9;
	}
	.user-div{
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.user-table{
		display: table;
		width: 97%;
		height: auto;
		
	}
	.user-tbl-header{
		display: table-row;
	    font-weight: bold;
	    text-align: center;
	    
	}
	.header-cell{
       display: table-cell;
	   border-width: thin;
	   padding: 15 15 15 15;
	   background-color: A8D8EA;
	   border-right: 2px solid rgb(255,255,255);
	}
	.user-input{
		font-size: small;
		width: 16%;
	}
	.user-div-row{
		display: table-row;
		text-align: center;
	}
	.cell {
    display: table-cell;
    border-width: thin;
    padding: 15 15 15 15;
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
	}
	.second-div{
		width: 95%;
	    height: 100%;
	    background-color: white;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	}
	.user-tbl-header div span{
		opacity: 0.5;
	}
	.user-devel{
		display: flex;
		flex-direction: column-reverse;
		padding: 0 25px 15 25px;
		width: 95%;
		height: 15%;
		background-color: white;
	}
	.page-num{
		font-size: 14px;
		font-weight: 800;
	}
</style>
<script>
$(function(){
	$(".user-chkboxAll").change(function(){
		var checked = $(this).prop("checked");
		$(".user-chkbox").prop("checked", checked);
	});
	$(".user-create").on("click",function(){
		
	});
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
				$(".user-div").append(rData);
			
		});
	});
	$(".user-create").on("click",function(){
		$(".create-modal").modal("show");
	});
	$(".btn-create").click(function(){
		var tname = $("#test-name").val();
		var tid = $("#test-id").val();
		var tpw = $("#test-pw").val();
		var taddr = $("#test-addr").val();
		var tdetail = $("#test-addr-detail").val();
		var tbir = $("#test-bir").val();
		var tstate = $("#test-state").val();
		
		$.post("/")
	});
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
			<button type="button">포인트 추가</button>
			<button type="button">사용자 정지</button>
			<button type="button">사용자 복구</button>
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
					<span>${userList.mno}</span>
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
		</div>
	</div>
	
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
            <input type="text" class="form-control" id="test-name">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">아이디</label>
            <input type="text" class="form-control" id="test-id">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">비밀번호</label>
            <input type="text" class="form-control" id="test-pw">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">주소</label>
            <input type="text" class="form-control" id="test-addr">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">상세주소</label>
            <input type="text" class="form-control" id="test-addr-detail">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">생일</label>
            <input type="text" class="form-control" id="test-bir">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">상태</label>
            <div class="d-flex flex-direction-column">
	            <input type="radio" class="form-control" id="test-state" name="test-state" value="1">
	            <span>활동</span>
	            <input type="radio" class="form-control" id="test-state" name="test-state" value="0">
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