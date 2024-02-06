<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ include file="/WEB-INF/views/include/myPage_sidebar.jsp" %>
<div class="myInfo-main">
<div class="container myPage-main">
	<div class="row">
		<div class="myPage-text">
			<h1>비밀번호 찾기</h1>
			<p>가입시 입력한 이메일로 비밀번호가 전송됩니다.</p>
			<div class="myPage-line"></div>
			<form role="form" action="/resetPassword" method="post">
				<div class="form-group">
					<label for="id">아이디</label> <input type="text"
						class="form-control" id="mid" name="mid"/>
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
