<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="/resources/css/dongyeong/admin_table.css" rel="stylesheet" type="text/css"/>
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
					<span>상품명</span>
				</div>
				<div class="header-cell">
					<span>판매가</span>
				</div>
				<div class="header-cell">
					<span>분류</span>
				</div>
				<div class="header-cell">
					<span>상태</span>
				</div>
				<div class="header-cell">
					<span>재고</span>
				</div>
				<div class="header-cell">
					<span>등록일</span>
				</div>
				<div class="header-cell">
					<span>수정일</span>
				</div>
				<div class="header-cell">
				</div>
			</div>
			<div class="user-div-row">
				<div class="cell">
					<input class="user-chkbox" type="checkbox">
				</div>
				<div class="cell">
					<span class="user-mno"></span>
				</div>
				<div class="cell" style="text-align: left;">
					<img src="C:/Users/KH302/Desktop/upload/2024/01/29/s_a6dfd738-4055-456c-8ac2-b48f5dcd8daf_pic6.png" style="width: 48px;height: 48px;">
					<span style="font-size: 20px;">훟라루루하하하ㅜㅏㄹ티티수숫</span>
				</div>
				<div class="cell">
					<span></span>
				</div>
				<div class="cell">
					<span></span>
				</div>
				<div class="cell">
					<span></span>
				</div>
				<div class="cell">
					<span></span>
				</div>
				<div class="cell">
					<span></span>
				</div>
				<div class="cell">
				</div>
				<div class="cell">
				<button>
				<i class="fa fa-comment-dots"></i>
				</button>
				</div>
			</div>
		</div>
		<div>
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <li class="page-item">
			      <a class="page-num page-link" href="${page.startPage - 1}" aria-label="Previous">
			        <span aria-hidden="true"><i class="fa fa-angle-double-left"></i></span>
			      </a>
			    </li>
			    	<li class="page-item"><a class="page-num page-link ${(page.criteria.pageNum == v) ? 'Active' : ''}" href="${v}">${v}</a></li>
				    <li class="page-item">
				      <a class="page-num page-link" href="${page.endPage + 1}" aria-label="Next">
				        <span aria-hidden="true"><i class="fa fa-angle-double-right"></i></span>
				      </a>
				    </li>
			  </ul>
			</nav>
		</div>
	</div>
</div>