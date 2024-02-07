<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ include file="/WEB-INF/views/include/myPage_sidebar.jsp" %>
<div class="myInfo-main">
<div class="container myPage-main">
	<div class="row">
		<div class="myPage-text">
			<h1 style="color:red;">이메일 인증 코드</h1>
			<p>가입 시 입력한 이메일로 인증 코드를 발송합니다.</p>
			<div class="myPage-line"></div>
			<form id="form-resign" role="form" action="/myPage/resignRun" method="post">
				<div class="form-group">
					<label for="id"> 인증 코드 </label> 
					<input type="hidden" name="mid" value="${loginInfo.mid }">
					<input type="text" id="email_code" /> <button id="btn-email_code" class="btn btn-warning" type="button">인증</button>
					<br><font id="emailCheck"></font>
				</div>
				<button id="btn-resign-run"type="button" class="btn btn-warning">확인</button>
			</form>
			<div class="myPage-login"></div>
		</div>
	</div>
</div>
</div>
<script>
$(function() {
	var checkIdResult = "${checkIdResult}";
	var email_code = "${email_code}";
	
	console.log("email_code : ", email_code);
	if(checkIdResult != null){
		alert("이메일로 인증 코드가 발송됩니다");
	}

	$("#btn-email_code").click(function(){
		var input_email_code = $("#email_code").val();
		console.log(input_email_code);
		console.log("email_code : ", email_code);
		if(email_code == input_email_code){
			$("#emailCheck").text("인증 코드가 일치합니다.");
			$("#emailCheck").css("color", "#FFD369");
			
		}else{
			$("#emailCheck").text("인증 코드가 일치하지 않습니다");
			$("#emailCheck").css("color", "red");
		}
	});

	
	
	$("#btn-resign-run").click(function(){
		var input_email_code = $("#email_code").val();
		if(email_code == input_email_code){
			var is = confirm("정말 하시겠습니까?")
			if(is == true){
				$("#form-resign").submit();
			}else if(is == false){
			}
		
		}else{
			alert("인증코드가 일치하지 않습니다.");
		}
	})
})
</script>
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
