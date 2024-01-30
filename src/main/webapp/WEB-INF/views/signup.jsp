<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<div class="container-fluid signup">
	<div class="row signup-row">
		<div class="col-md-12">
			<form role="form" class="signup-form" action="/registerMember" method="post">
				<div class="form-group">
					<label>
						아이디
					</label>
					<input type="text" class="form-control" id="mid" name="mid" required/>
				</div>
				<div class="form-group">
					 
					<label>
						비밀번호
					</label>
					<input type="password" class="form-control pw" id="mpw" name="mpw" required/>
				</div>
				<div class="form-group">
					<label>
						비밀번호 재확인
					</label>
					<input type="password" class="form-control pw" id="mpw2"  required >
					<font id="passwordCheck"></font>
				</div>
				<div class="form-group">
					<label>
						이름
					</label>
					<input type="text" class="form-control" id="mname" name="mname"  required/>
				</div>
				<div class="form-group">
					<label>
						생년월일
					</label>
					<input type="date" pattern="yyyy-MM-dd" max="2024-01-01" min="1920-01-01" value="2000-01-01" class="form-control" 
					id="mbirthday" name="mbirthday" required/>
				</div>
				<div class="form-group">
					<label>
						주소
					</label>
					<input type="text" class="form-control" id="mpost_code" name="mpost_code" style="width: 100px;"><br>
					<input type="text" class="form-control" id="maddr" name="maddr"  required><br>
					<input type="text" id="maddr_detail" name="maddr_detail"  required>
					<button type="button" id="btn-addr-search" class="btn btn-light">주소 검색</button>
				</div>
				<div class="form-group">
					<label>
						핸드폰 번호
					</label>
					<input type="text" class="form-control" id="mphone" name="mphone"  required />
				</div>
				<div class="form-group">
					<label>
						이메일
					</label>
					<input type="email" class="form-control" id="memail" name="memail"  required/>
				</div>
				<button id="btn-register" type="submit" class="btn btn-primary">
					회원가입
				</button>
			</form>
		</div>
	</div>
</div>
<!-- 카카오 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
// 	$("#btn-register").click(function(){
// 		var mname = $("#mname").val();
// 		var mid = $("#mid").val();
// 		var mpw = $("#mpw").val();
// 		var mbirthday = $("#mbirthday").val();
// 		var maddr = $("#maddr").val();
// 		var maddr_detail = $("#maddr_detail").val();
// 		var mphone = $("#mphone").val();
// 		var memail = $("#memail").val();
// 		console.log("mname", mname);
// 		console.log("mid", mid);
// 		console.log("mpw", mpw);
// 		console.log("mbirthday", mbirthday);
// 		console.log("maddr", maddr);
// 		console.log("maddr_detail", maddr_detail);
// 		console.log("mphone", mphone);
// 		console.log("memail", memail);
// 	});

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
	
// 	카카오 맵
	$("#btn-addr-search").click(function(){
    new daum.Postcode({
        oncomplete: function(data) {
        	console.log(data);
        	var roadAddr = data.roadAddress;
        	$("#maddr").val(roadAddr);
        	var post_code = data.zonecode;
        	$("#mpost_code").val(post_code);
        }
    }).open();
		
	})
});
</script>
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>