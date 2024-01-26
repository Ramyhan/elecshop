<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<div class="container-fluid login">
<div class="login-ui">
	<h3 style="margin-top: 40px;">로그인</h3>
	<div class="row" style="margin: 110px; margin-top: 70px; ">
		<div class="col-md-12">
			<form role="form" action="/loginPost" method="post">
				<div class="form-group">
					<label for="id">
						아이디
					</label>
					<input type="text" class="form-control" id="mid" name="mid" />
				</div>
				<div class="form-group">
					 
					<label for="pw">
						비밀번호
					</label>
					<input type="password" class="form-control" id="mpw" name="mpw" />
				</div>
				<div class="form-group">
                      <div class="custom-control custom-checkbox small">
                          <input type="checkbox" class="custom-control-input" 
                          	id="useCookie" name="useCookie">
                          <label class="custom-control-label" for="useCookie">
                          	아이디 저장
                          </label>
                      </div>
                  </div>
				<button type="submit" class="btn btn-warning">
					로그인
				</button>
			</form>
		</div>
	</div>
</div>
</div>

<script>
$(function (){
	var loginResult = "${loginResult}";
	if(loginResult == "fail"){
		alert("로그인 실패");
	}
	var cookie = document.cookie;
	console.log(cookie);
	var cookies = cookie.split("=");
	console.log(cookies);
	for(var v = 0; v < cookies.length; v++){
		if(cookies[0].trim() == "savedId"){
			var savedId = cookies[1];
			console.log(savedId);
			$("#mid").val(savedId);
		}
	}
	
	
});
</script>
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>