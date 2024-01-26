<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<div class="side-bar">
	<div class="icon">
		<div><i class="fa fa-align-justify"></i></div>
		<div><i class="fa fa-angle-double-left"></i></div>
	</div>
	<div class="side-menu side-myPage">
		<ul>
			<li><a href="/myPage">내 정보</a></li>
			<li><a href="/myPage_point">포인트</a></li>
			<li><a href="#">찜 목록</a></li>
			<li><a href="#">나의 문의 내역</a></li>
			<li><a href="#">계정 탈퇴</a></li>
		</ul>
	</div>
</div>
<div class="myPage-main">
	<div class="row">
		<div class="myPage-text">
			<h1>개인 정보 수정</h1>
			<p>비밀번호 재확인</p>
			<div class="myPage-line"></div>
			<form role="form" action="/checkId" method="post">
				<div class="form-group">
					<label for="id"> 아이디 </label> <input type="text"
						class="form-control" id="mid" name="mid" value="${loginInfo.mid }"
						readonly />
				</div>
				<div class="form-group">

					<label for="pw"> 비밀번호 </label> <input type="password"
						class="form-control" id="mpw" name="mpw" />
				</div>
				<button type="submit" class="btn btn-warning">확인</button>
			</form>
			<div class="myPage-login"></div>
		</div>
	</div>
</div>

<script>
$(function() {
	var modifyResult = "${modifyResult}";
	if(modifyResult == "success"){
		alert("회원정보 수정 완료");
	}else if(modifyResult == "fail"){
		alert("회원정보 수정 실패");
	}
	
	var checkIdResult = "${checkIdResult}";
	if(checkIdResult == "fail"){
		alert("비밀번호를 다시 확인해주세요.");
	}

})
</script>
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
