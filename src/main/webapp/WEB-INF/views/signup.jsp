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
					<input type="text" class="form-control" id="mid" name="mid" />
				</div>
				<div class="form-group">
					 
					<label>
						비밀번호
					</label>
					<input type="password" class="form-control" id="mpw" name="mpw" />
				</div>
				<div class="form-group">
					<label>
						이름
					</label>
					<input type="text" class="form-control" id="mname" name="mname" />
				</div>
				<div class="form-group">
					<label>
						생년월일
					</label>
					<input type="date" pattern="yyyy-MM-dd" max="2024-01-01" min="1920-01-01" value="2000-01-01" class="form-control" 
					id="mbirthday" name="mbirthday" />
<!-- 					<input type="text" class="form-control" id="mbirthday" name="mbirthday" /> -->
				</div>
				<div class="form-group">
					<label>
						주소
					</label>
					<input type="text" class="form-control" id="maddr" name="maddr"><br>
					<input type="text" id="maddr_detail" name="maddr_detail">
					<button type="button" id="btn-addr-search" class="btn btn-light">주소 검색</button>
				</div>
				<div class="form-group">
					<label>
						핸드폰 번호
					</label>
					<input type="text" class="form-control" id="mphone" name="mphone" />
				</div>
				<div class="form-group">
					<label>
						이메일
					</label>
					<input type="email" class="form-control" id="memail" name="memail" />
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
	$("#btn-register").click(function(){
		var mname = $("#mname").val();
		var mid = $("#mid").val();
		var mpw = $("#mpw").val();
		var mbirthday = $("#mbirthday").val();
		var maddr = $("#maddr").val();
		var maddr_detail = $("#maddr_detail").val();
		var mphone = $("#mphone").val();
		var memail = $("#memail").val();
		console.log("mname", mname);
		console.log("mid", mid);
		console.log("mpw", mpw);
		console.log("mbirthday", mbirthday);
		console.log("maddr", maddr);
		console.log("maddr_detail", maddr_detail);
		console.log("mphone", mphone);
		console.log("memail", memail);
	});
	$("#btn-addr-search").click(function(){
    new daum.Postcode({
        oncomplete: function(data) {
        	console.log(data);
        	var roadAddr = data.roadAddress;
        	$("#maddr").val(roadAddr);
        }
    }).open();
		
	})
});
// function oninputPhone(target) {
//     target.value = target.value
//         .replace(/[^0-9]/g, '')
//         .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
// }
</script>
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>