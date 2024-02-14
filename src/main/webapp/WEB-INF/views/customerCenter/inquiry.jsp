<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/customerCenterTop.jsp" %>
<style>
body{
}
.inquiry-table{
	display: table;
	width: 100%;
	max-width:100%;
	padding-top: 5%;
}
.inquiry-table .box{
	display: table-cell;
}
.box h3{
	font-size:40px;
	font-weight: 1000;
}
.inquiry-div-main{
	margin: 0 450px;
}
.inquiry-div-sub{
	padding-bottom: 50px;
}
.input{
	width:77%;
	border-radius: 5px;
}
.inquiry-btn{
	border-radius: 15px; 
	color : white;
/*  	border-color: gray;  */
 	background-color: #03c75a; 
	width: 195px;
	padding: 14px 0;
}
</style>
<script>
$(function() {
	// 제한글자수 변경
	$(".imessage").keydown(function() {
		var imessage = $(this).val();
// 		console.log("imessage: ", imessage.length);
		$(".limitText").text(imessage.length + "자 입력 / 최대 1000자");
	});
	
	// 문의내용 보내기
	$(".inquiry-btn").click(function() {
		var ititle = $(".ititle").val();
		var imessage = $(".imessage").val();
		var sData = {
				"mid" : "${loginInfo.mid}",
				"ititle" : ititle,
				"imessage" : imessage
		}
		console.log("sData: ", sData);
		
		$.ajax({
			"method" : "post",
			"url" : "/iquiry/add",
			"data" : JSON.stringify(sData),
			"contentType" : "application/json",
			"success" : function(rData) {
				console.log("rData: ", rData);
				if(rData == "true") {
					alert("문의 내용을 전달했습니다.");
					$(".ititle").val("");
					$(".imessage").val("");
				}
			}
		});
	});
});
</script>
<div class="inquiry-table">
	<div class="box"></div>
	<div class="box">
		<div class="inquiry-div-main">
		<!-- inquiry form -->
<!-- 			<form action="" method="post" enctype="multipart/"> -->
				<h3 style="text-align: center;">1:1문의</h3>
				<div class="inquiry-div-sub d-flex">
					<label>아이디</label>
					<em style="padding-right: 85px; color: green;">(선택)</em>
					<c:choose>
						<c:when test="${not empty loginInfo}">
							<input type="hidden" id="mid" name="iid" value="${loginInfo.mid}">
							<div>${loginInfo.mid}</div>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="mid" name="iid" value="비사용자">
							<div>비회원</div>
						</c:otherwise>
					</c:choose>
				</div>
				<!--
				<div class="inquiry-div-sub d-flex">
					<label>카테고리</label>
					<em style="padding-right: 73px; color: green;">(필수)</em>
					<select id="icategory">
						<option value="반품/환불">반품/환불</option>
						<option value="노트북">노트북</option>
						<option value="모니터">모니터</option>
						<option value="태블릿">태블릿</option>
						<option value="음향기기">음향기기</option>
						<option value="주변기기">주변기기</option>
					</select>
				</div>
				-->
				<div class="inquiry-div-sub d-flex">
					<label>제목</label>
					<em style="padding-right: 107px; color: blue;">(필수)</em>
					<input class="input ititle" type="text" id="iemail" name="iemail">
				</div>
				<div class="inquiry-div-sub d-flex flex-wrap">
					<label>문의 내용</label>
					<em style="padding-right: 66px; color: blue;">(필수)</em>
					<textarea class="input imessage" maxlength="1000" style="height: 200px;" name="imessage"></textarea>
					<span class="limitText" style="padding-left: 176px; padding-top: 15px">0자 입력 / 최대 1000자</span>
				</div>
				<div class="inquiry-div-sub d-flex justify-content-center">
					<button type="button" class="inquiry-btn">문의하기</button>
				</div>
<!-- 			</form> -->
			<!-- //inquiry form -->
		</div>
	</div>
	<div class="box"></div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>