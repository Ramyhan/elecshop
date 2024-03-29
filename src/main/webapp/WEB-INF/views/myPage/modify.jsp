<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ include file="/WEB-INF/views/include/myPage_sidebar.jsp" %>
<div style="height: 100%; background-color: #303030;">
<div class="myPage-modify-main">
		<div class="myPage-modify-text">
			<h1>개인 정보 수정</h1>
			<div class="myPage-modify-line"></div>
			<form role="form" action="/myPage/modifyMember" method="post">
				<div class="form-group">
					<label for="id"> 아이디 </label> <input type="text"
						class="form-control" id="mid" name="mid" readonly
						value="${loginInfo.mid }" />
				</div>
				<div class="form-group">

					<label for="pw"> 비밀번호 </label> <input type="password"
						class="form-control" id="mpw" name="mpw" />
				</div>
				<div class="form-group">
					<label> 비밀번호 재확인 </label> <input type="password"
						class="form-control pw" id="mpw2"> <font
						id="passwordCheck"></font>
				</div>
				<div class="form-group">
					<label> 이름 </label> <input type="text" class="form-control"
						id="mname" name="mname" value="${loginInfo.mname }"/>
				</div>
				<div class="form-group">
					<label> 생년월일 </label> <input type="date" pattern="yyyy-MM-dd"
						max="2024-01-01" min="1920-01-01" value="${loginInfo.mbirthday }"
						class="form-control" id="mbirthday" name="mbirthday" 
						/>
				</div>
				<div class="form-group">
					<label> 주소 </label> 
					<input type="text" class="form-control" id="mpost_code" name="mpost_code" style="width: 100px;" value="${loginInfo.mpost_code }"><br>
					<input type="text" class="form-control" id="maddr" name="maddr" value="${loginInfo.maddr }"><br> 
					<input type="text" id="maddr_detail" name="maddr_detail" value="${loginInfo.maddr_detail }">
					<button type="button" id="btn-addr-search" class="btn btn-light">주소 검색</button>				</div>
				<div class="form-group">
					<label> 핸드폰 번호 </label> <input type="text" class="form-control"
						id="mphone" name="mphone" value="${loginInfo.mphone }" />
				</div>
				<div class="form-group">
					<label> 이메일 </label> <input type="email" class="form-control"
						id="memail" name="memail"
						value="${loginInfo.memail }" />
				</div>
				<button type="submit" class="btn btn-warning">확인</button>
			</form>
			<div class="myPage-login">
				<br>
			</div>
		</div>
</div>
</div>
<script>
$(function(){
	$("#btn-addr-search").click(function(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	        	var roadAddr = data.roadAddress;
	        	$("#maddr").val(roadAddr);
	        	var post_code = data.zonecode;
	        	$("#mpost_code").val(post_code);
	        	$("#maddr_detail").val("");
	        }
	    }).open();
			
		})

	$(".pw").keyup(function() {
		var pass1 = $("#mpw").val();
		var pass2 = $("#mpw2").val();
		
		if(pass1 != "" || pass2 != ""){
			if(pass1 == pass2){
				$("#passwordCheck").text("비밀번호가 일치합니다.");
				$("#passwordCheck").attr("color", "#FFD369");
			}else{
				$("#passwordCheck").text("비밀번호가 일치하지 않습니다.")
				$("#passwordCheck").attr("color", "red");
			}
		}
	})
})


</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
