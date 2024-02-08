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
                <a id="forgot-password" class="small" href="/password">비밀번호 분실</a>
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
<!-- 				 href="javascript:loginWithKakao()" -->
				<a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0874920e36f28bb58cf72edb6dba2aec&redirect_uri=http://localhost/login">
			  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
			    alt="카카오 로그인 버튼" />
				</a>
			</form>
		</div>
	</div>
</div>
</div>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"
  integrity="sha384-6MFdIr0zOira1CHQkedUqJVql0YtcZA1P0nbPrQYJXVJZUkTk/oX4U9GhUIs3/z8" crossorigin="anonymous"></script>
<script>
  Kakao.init('2b6040da2b8539bab2d11d471d964282'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script>
$(function (){
	var loginResult = "${loginResult}";
	console.log(loginResult);
	if(loginResult == "fail"){
		alert("로그인 실패");
	}else if(loginResult == "disabled"){
		alert("탈퇴된 회원입니다.");
	}
	var cookie = document.cookie;
	console.log(cookie);
	var cookies = cookie.split(";");
	console.log(cookies);
	for(var v = 0; v < cookies.length; v++){
		var aCookie = cookies[v].split("=");
		if(aCookie[0].trim() == "savedId"){
			var savedId = aCookie[1];
			console.log(savedId);
			$("#mid").val(savedId);
			$("#mpw").focus();
		}
	}
	
	
	$("#kakao-login-btn").on("click", function(){
	    //1. 로그인 시도
	    Kakao.Auth.login({
	        success: function(authObj) {
	         
	          //2. 로그인 성공시, API 호출
	          Kakao.API.request({
	            url: '/v2/user/me',
	            success: function(res) {
	              console.log(res);
	              var id = res.id;
				  scope : 'account_email';
				alert('로그인성공');
	              location.href="callback주소";
			

	              
	        }
	          })
	          console.log(authObj);
	          var token = authObj.access_token;
	        },
	        fail: function(err) {
	          alert(JSON.stringify(err));
	        }
	      });
	        
	}) //

});
</script>
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>