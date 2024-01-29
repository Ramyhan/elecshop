<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
	$("#divDrop").on("dragenter dragover", function (e){
		e.preventDefault();
	});
	$("#divDrop").on("drop", function (e){
		e.preventDefault();
		console.log(e.originalEvent.dataTransfer.files);
		var files = e.originalEvent.dataTransfer.files;
		var formData = new FormData();
		for(var v = 0; v < files.length; v++){
			formData.append("uploadFiles" , files[v]);
		}
		console.log("formData",formData);
		$.ajax({
			"url" : "/uploadAjax",
			"type" : "post",
			"processData" : false,
			"contentType" : false,
			"data" : formData,
			"success" : function(rData) {
				console.log("rData",rData);
				$(rData).each(function(i, obj) {
					var fileDivClone = $("#fileDiv > div:eq(0)").clone();
					fileDivClone.find(".spanFilename").text(obj.fileName);
						var fName = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
						var url = "/display?fileName=" + fName;
						fileDivClone.find("img").attr("src", url);
					fileDivClone.find(".fa-times-circle").attr("data-filename", obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
					$("#fileDiv").append(fileDivClone);
					fileDivClone.fadeIn(1000);
					
					// 서버에 보낼 데이터 세팅
					fileDivClone.attr("data-url", fName);
				});
			}
		})
	});
	$(".frm-register-notice").submit(function(){
		var that = $(this);
		var divAttach = $(".div-attach:gt(0)");
		divAttach.each(function(i){
			var url = $(this).attr("data-url");
			console.log(url);
			var inputFileName = "<input type='hidden' name='url' value='" + url + "'>";
			that.prepend(inputFileName);
		});
// 		return false;
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
			<form action="/admin/registerNotice" method="post" class="frm-register-notice">
				<h3 style="text-align: center;">공지 추가</h3>
				<div class="inquiry-div-sub" style="display: flex; ">
					<label>공지 제목</label>
					<em style=" color: green;">(필수)</em>
					<input class="input" type="text" id="ntitle" name="ntitle">
				</div>
				<div class="inquiry-div-sub d-flex">
					<label>카테고리</label>
					<em style=" color: green;">(필수)</em>
					<select id="ncategory" name="ncategory" style="margin-left: 3px;">
						<option value="배송">배송</option>
						<option value="시스템">시스템</option>
						<option value="제품">제품</option>
						<option value="커뮤니티">커뮤니티</option>
					</select>
				</div>
				<div class="inquiry-div-sub d-flex flex-wrap">
					<label>문의 내용</label>
					<em style=" color: blue;">(필수)</em>
					<textarea class="input" maxlength="1000" style="height: 200px;" name="content"></textarea>
					<span style="padding-left: 156px;">0자 입력 / 최대 1000자</span>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div id="divDrop">업로드할 파일을 드래그 &amp; 드롭하세요.</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div  id="fileDiv" 
							class="d-flex justify-content-center p-3 bg-secondary text-white">
							<div class="p-2 bg-info div-attach" style="display:none;">
								<span class="spanFilename">Flex item 1</span>
								<i class="fa fa-times-circle float-right"></i>
								<br>
								<img src="/resources/css/dongyeong/default.png" height="100">
							</div>
						</div>
					</div>
				</div>
				<div class="inquiry-div-sub d-flex" style="text-align: center; justify-content: space-around;">
					<div>
						<input type="radio" name="nstate" id="nchkbox" value="true">공개
						<input type="radio" name="nstate" id="nchkbox" checked value="false">비공개
					</div>
				</div>
				<div class="inquiry-div-sub d-flex justify-content-center">
					<button type="submit" class="inquiry-btn">문의하기</button>
				</div>
			</form>
			<!-- //notice form -->
		</div>
	</div>
	<div class="box"></div>
</div>