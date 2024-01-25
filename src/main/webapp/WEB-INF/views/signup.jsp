<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<div class="container-fluid signup">
	<div class="row signup-row">
		<div class="col-md-12">
			<form role="form" class="signup-form" action="/registerMember" method="post">
				<div class="form-group">
					<label for="mpw">
						아이디
					</label>
					<input type="text" class="form-control" id="mid" name="mpw" />
				</div>
				<div class="form-group">
					 
					<label for="mpw">
						비밀번호
					</label>
					<input type="password" class="form-control" id="mpw" name="mpw" />
				</div>
<!-- 				<div class="form-group"> -->
					 
<!-- 					<label for="mpw2"> -->
<!-- 						비밀번호 재확인 -->
<!-- 					</label> -->
<!-- 					<input type="password" class="form-control" id="mpw2" name="mpw2" /> -->
<!-- 				</div> -->
				<div class="form-group">
					<label for="mname">
						이름
					</label>
					<input type="text" class="form-control" id="mname" name="mname" />
				</div>
				<div class="form-group">
					<label for="date">
						생년월일
					</label>
					<input type="date" max="2024-01-01" min="1920-01-01" value="2000-01-01" class="form-control" 
					id="mbirthday" name="mbirthday" />
				</div>
				<div class="form-group">
					<label for="maddr">
						주소
					</label>
					<input type="text" class="form-control" id="maddr" name="maddr" readonly><br>
					<input type="text" id="maddr_detail" name="maddr_detail">
					<button type="button" id="btn-addr-search" class="btn btn-light">주소 검색</button>
				</div>
				<div class="form-group">
					<label for="mphone">
						핸드폰 번호
					</label>
					<input type="number" oninput="oninputPhone(this)" class="form-control" id="mphone" name="mphone" />
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
	$("#btn-addr-search").click(function(){
    new daum.Postcode({
        oncomplete: function(data) {
        	console.log(data);
        	var roadAddr = data.roadAddress;
        	console.log(roadAddr);
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