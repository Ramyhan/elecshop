<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ include file="/WEB-INF/views/include/myPage_sidebar.jsp" %>
<div class="myInfo-main">
<div class="container myPage-main">
	<div class="row">
		<div class="myPage-text">
			<h1>개인 정보 수정</h1>
			<p>비밀번호 재확인</p>
			<div class="myPage-line"></div>
			<form role="form" action="/myPage/checkId" method="post">
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
