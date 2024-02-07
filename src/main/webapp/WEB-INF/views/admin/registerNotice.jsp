<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
					var dataType="file";
					if(obj.image == true){
						dataType="image";
						var fName = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
						var url = "/display?fileName=" + fName;
						fileDivClone.find("img").attr("src", url);
					}
					fileDivClone.find(".fa-times-circle").attr("data-filename", obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
					$("#fileDiv").append(fileDivClone);
					fileDivClone.fadeIn(1000);
					fileDivClone.find(".fa-times-circle").attr("data-type", dataType);
					
					// 서버에 보낼 데이터 세팅
					fileDivClone.attr("data-url", obj.url);
					fileDivClone.attr("data-fileName", obj.fileName);
				});
			}
		})
	});
	//공지 추가 버튼
	$(".inquiry-btn").click(function(){
		var that = $(this);
		var ntitle = $("#ntitle").val();
		var ncontent = $("#ncontent").val();
		var ncategory = $("#ncategory").val();
		var nstate = $("#nstate:checked").val();
		var divAttach = $(".div-attach:gt(0)");
		var url = "";
		var file = "";
		var nurls = [];
		var files = [];
		divAttach.each(function(i){
			url = $(this).attr("data-url");
			file = $(this).attr("data-fileName");
			nurls.push(url);
			files.push(file);
		});
		var nurl = nurls.join(",");
		var nfilename = files.join(",");
		console.log("nurl",nurl);
		sData={
				"ntitle" : ntitle,
				"ncontent" : ncontent,
				"ncategory": ncategory,
				"nstate" : nstate,
				"nfileName" : nfilename,
				"nurl" : nurl
		}
		$.post("/admin/registerNotice",sData,function(rData){
			if(rData == true){
				alert("공지사항이 추가 되었습니다");
				$.ajax({
					type : "get",
					url : "/admin/admin_customTable",
					success : function(rdata){
						$(".tbl-tbody").empty();
						$(".tbl-tbody").append(rdata);
					}
				});
			}else{
				alert("공지사항 추가가 실패 하였습니다");
				return
			}
		});
	});
	// 첨부파일 삭제
	$("#fileDiv").on("click", ".fa-times-circle", function() {
		var that = $(this);
		var url = "/deleteFile";
		var sendData = {
				"fileName" : that.attr("data-filename"),
				"dataType" : that.attr("data-type")
		};
		$.post(url, sendData, function(rData) {
			console.log("rData:", rData);
			if (rData == "true") {
				that.parent().remove();
			}
		});
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
					<textarea class="input" maxlength="1000" style="height: 200px;" id="ncontent" name="ncontent"></textarea>
					<span style="padding-left: 156px;">0자 입력 / 최대 1000자</span>
				</div>
				<div class="inquiry-div-sub d-flex" style="text-align: center; justify-content: space-around;">
					<div>
						<input type="radio" name="nstate" id="nstate" value="true">공개
						<input type="radio" name="nstate" id="nstate" checked value="false">비공개
					</div>
				</div>
				<div class="inquiry-div-sub d-flex justify-content-center">
					<button type="submit" class="inquiry-btn">공지추가</button>
				</div>
			</form>
			<!-- //notice form -->
		</div>
	</div>
	<div class="box"></div>
</div>