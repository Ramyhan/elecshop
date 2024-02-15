<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function(){
	$("#notice-tarea").keydown(function() {
		var imessage = $(this).val();
// 		console.log("imessage: ", imessage.length);
		$("#limit").text(imessage.length + "자 입력 / 최대 1000자");
	});
	//공지 추가 버튼
	$(".inquiry-btn").click(function(){
		var that = $(this);
		var ntitle = $("#ntitle").val();
		var ncontent = $("#ncontent").val();
		var ncategory = $("#ncategory").val();
		var nstate = $("#nstate:checked").val();
		var sData = {
				"ntitle" : ntitle,
				"ncontent" : ncontent,
				"ncategory": ncategory,
				"nstate" : nstate
		}
		console.log(sData);
	});	
});
	
</script>
<style>
#divDrop {
	margin: auto;
	width: 70%;
	height: 100px;
	line-height: 100px;
	background: gray;
	border: 2px dashed blue;
	text-align: center;
}
.set-div{
	background-color: gainsboro;
}
.inquiry-table{
	display: table;
	width: 100%;
	max-width:100%;
	height:50%;
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
	margin: 30 30 30 30;
}
.input{
	width:70%;
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
em{
	padding-right: 30px;
}
</style>

<div class="inquiry-table">
	<div class="box"></div>
	<div class="box">
		<div class="inquiry-div-main">
		<!-- notice form -->
		<form action="/admin/registerNotice" method="post">
				<h3 style="text-align: center;">공지 추가</h3>
				<div class="inquiry-div-sub" style="display: flex;">
					<label>공지 제목</label>
					<em style=" color: green;">(필수)</em>
					<input class="input" type="text" id="ntitle" name="ntitle" required="required">
				</div>
				<div class="inquiry-div-sub d-flex">
					<label>카테고리</label>
					<em style=" color: green;">(필수)</em>
					<select id="ncategory" name="ncategory" style="margin-left: 3px;">
						<option value="배송">배송</option>
						<option value="시스템">시스템</option>
						<option value="제품">제품</option>
					</select>
				</div>
				<div class="inquiry-div-sub d-flex flex-wrap">
					<label>문의 내용</label>
					<em style=" color: blue;">(필수)</em>
					<textarea id="notice-tarea" class="input" maxlength="1000" style="height: 200px;" id="ncontent" name="ncontent" required="required"></textarea>
					<span id="limit" style="padding-left: 156px;">0자 입력 / 최대 1000자</span>
				</div>
				<div class="inquiry-div-sub d-flex" style="text-align: center; justify-content: space-around;">
					<div>
						<input type="radio" name="nstate" id="nstate" value="true">공개
						<input type="radio" name="nstate" id="nstate" checked value="false">비공개
					</div>
				</div>
				<div class="inquiry-div-sub d-flex justify-content-center">
					<button type="submit" class="inquiry-btn">공지등록</button>
				</div>
			</form>
			<!-- //notice form -->
		</div>
	</div>
	<div class="box"></div>
</div>