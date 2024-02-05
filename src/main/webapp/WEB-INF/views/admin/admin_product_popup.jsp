<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
.popup-main, .popup-name {
	display: flex;
	flex-direction: column;
}

.product-table {
	display: table;
	width: 100%;
	height: auto;
}

.div-header, .div-cell {
	display: table-row;
	width: 100%;
}

.div-header-cell {
	display: table-cell;
}

.input-cell {
	display: table-cell;
}

.product-input-first, .product-input-second {
	width: 96%;
}

.product-select,.product-state,.product-ram-select,.product-ssd-select {
	width: 98%;
}

.info-div {
	height: 100%;
}

.info-area {
	width: 99%;
	height: 100%;
}
</style>
<meta charset="UTF-8">
<title>상품 추가 팝업</title>
<script>
	$(function() {
		$(".product-select").change(function() {
			var category = $(this).val();
			if(category == 1 || category == 3){
				$("#sub-select-div").css("display", "flex");
			}else{
				$("#sub-select-div").css("display", "none");
			}
		});
		$("#btn-ram").click(function() {
			var ramClone = $("#add-ram-select").clone();
			var selectRam = $(".add-ram-select");
			$("#add-ram-div").append(ramClone);
			ramClone.find("select").attr("name","ramList["+ selectRam.length +"].oname");
			ramClone.find("[type=number]").attr("name","ramList["+ selectRam.length +"].oprice");
			ramClone.find("[type=hidden]").attr("name","ramList["+ selectRam.length +"].otype");
			console.log($(".add-ram-select"));
		});
		$("#btn-ssd").click(function() {
			var ssdClone = $("#add-ssd-select").clone();
			var selectssd = $(".add-ssd-select");
			ssdClone.find("select").attr("name","ssdList["+ selectssd.length + "].oname");
			ssdClone.find("[type=number]").attr("name","ssdList["+ selectssd.length +"].oprice");
			ssdClone.find("[type=hidden]").attr("name","ssdList["+ selectssd.length +"].otype");
			$("#add-ssd-div").append(ssdClone);
		});
		$(".file-img").on("change",function(e){
			var that = $(this)
			var file = e.target.files[0];
			var filename = e.target.files[0].name;
			var formData = new FormData();
			formData.append("uploadFile",file);
			var reader = new FileReader();
			var isImage = isImageFile(file);
			if(isImage == true){
				reader.onload = function(e){
					$.ajax({
						"url" : "/uploadAjax",
						"type" : "post",
						"processData" : false,
						"contentType" : false,
						"data" : formData,
						"success" : function(rData){
							console.log(rData);
							that.parent().next().find(".image-preview").attr("data-file", rData[0].afileName);
							that.parent().next().find(".image-preview").attr("data-apath", rData[0].apath);
							that.parent().next().find(".image-preview").attr("data-uuid", rData[0].auuid);
							that.parent().next().find(".image-preview").attr("data-url", rData[0].aurl);
							that.parent().next().find(".image-preview").attr("src","/display?fileName=" + rData[0].aurl);
						}
					})
				}
				reader.readAsDataURL(file);
			}else{
				alert("이미지 파일만 올릴 수 있습니다");
				$(".file-img").val("");
				$(".image-preview").attr("src","/resources/css/dongyeong/default.png");
				return false;
			}
			
		});
		$("#btn-close").click(function(){
			self.close();
		})
		$("#btn-register").click(function(){
			var preview = $(".image-preview");
			preview.each(function(i,obj){
				var file = $(this).attr("data-file");
				var uuid = $(this).attr("data-uuid");
				var url = $(this).attr("data-url");
				var apath = $(this).attr("data-apath");
				var thoumbnail = $(this).attr("data-thoumbnail");
				console.log(thoumbnail);
				var hiddenThoumb = "<input type='hidden' name='attrProductList["+i+"].athoumbnail' value='" + thoumbnail + "'>";
				var hiddenFile = "<input type='hidden' name='attrProductList["+i+"].afileName' value='" + file + "'>";
				var hiddenUuid = "<input type='hidden' name='attrProductList["+i+"].auuid' value='" + uuid + "'>";
				var hiddenUrl = "<input type='hidden' name='attrProductList["+i+"].aurl' value='" + url + "'>";
				var hiddenPath = "<input type='hidden' name='attrProductList["+i+"].apath' value='" + apath + "'>";
				$("#frm-popup").prepend(hiddenFile);
				$("#frm-popup").prepend(hiddenUuid);
				$("#frm-popup").prepend(hiddenUrl);
				$("#frm-popup").prepend(hiddenPath);
				$("#frm-popup").prepend(hiddenThoumb);
			});
		$("#frm-popup").submit();
		alert("상품 추가 완료");
		self.close();
		});
		
		function isImageFile(file) {
		    var ext = file.name.split(".").pop().toLowerCase(); 
		    return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
		}
	});
</script>
</head>
<body>
	<div class="popup-main">
		<div style="text-align: center;">
			<span>상품 추가</span>
			<hr>
		</div>
		<!--  id="frm-popup" action="" method="post" -->
		<form id="frm-popup" action="/admin/adminProductRegister" method="post" target="/admin/admin_product">
			<div class="popup-name">
				<span>상품 이름</span> <input name="pname" class="product-name" type="text">
			</div>
			<div class="product-table">
				<div class="div-header">
					<div class="div-header-cell">
						<span>상품가격</span>
					</div>
					<div class="div-header-cell">
						<span>상품일련번호</span>
					</div>
					<div class="div-header-cell">
						<span>재고수량</span>
					</div>
				</div>
				<div class="div-cell">
					<div class="input-cell">
						<input name="pprice" class="product-input-first" type="number">
					</div>
					<div class="input-cell">
						<input name="pcode" class="product-input-second" type="text">
					</div>
					<div class="input-cell">
						<input name="order_count" class="product-input-second" type="number">
					</div>
				</div>
				<div class="div-header">
					<div class="div-header-cell">
						<span>상품종류</span>
					</div>
					<div class="div-header-cell">
						<span>상품공개여부</span>
					</div>
				</div>
				<div class="div-cell">
					<div class="input-cell">
						<select name="ptype" class="product-select">
							<option>--선택--</option>
							<option value="1">노트북</option>
							<option value="2">모니터</option>
							<option value="3">태블릿</option>
							<option value="4">음향기기</option>
							<option value="5">주변기기</option>
						</select>
					</div>
					<div class="input-cell">
						<select name="pstate" class="product-state">
							<option>--선택--</option>
							<option value="1">공개</option>
							<option value="0">비공개</option>
						</select>
					</div>
				</div>
			</div>
			<div style="display: none;" id="sub-select-div">
				<div id="add-ram-div">
					<button type="button" id="btn-ram">램옵션 추가</button>
					<div class="add-ram-select" id="add-ram-select">
						<div class="div-header">
							<div class="div-header-cell">
								<span>ㄹ에엠선택</span>
							</div>
						</div>
						<div class="div-cell">
							<div class="input-cell">
								<select name="ramList[0].oname" class="select-ram product-ram-select" disabled>
									<option>--선택--</option>
									<option value="8GB">8GB</option>
									<option value="16GB">16GB</option>
									<option value="32GB">32GB</option>
								</select>
							</div>
						</div>
						<div class="div-header">
							<div class="div-header-cell">
								<span>옵션 가격</span>
							</div>
						</div>
						<div class="div-cell">
							<div class="input-ram input-cell">
								<input name="ramList[0].oprice" class="input" type="number" disabled>
								<input type="hidden" name="ramList[0].otype" value="1" disabled>
							</div>
						</div>
					</div>
				</div>
				<div id="add-ssd-div">
					<button type="button" id="btn-ssd">ssd옵션 추가</button>
					<div class="add-ssd-select" id="add-ssd-select">
						<div class="div-header">
							<div class="div-header-cell">
								<span>스스디추가</span>
							</div>
						</div>
						<div class="div-cell">
							<div class="input-cell">
								<select name="ssdList[0].oname" class="select-ssd product-ssd-select" disabled>
									<option>--선택--</option>
									<option value="128GB">128GB</option>
									<option value="256GB">256GB</option>
									<option value="512GB">512GB</option>
									<option value="1TB">1TB</option>
								</select>
							</div>
						</div>
						<div class="div-header">
							<div class="div-header-cell">
								<span>옵션 가격</span>
							</div>
						</div>
						<div class="div-cell">
							<div class="input-ssd input-cell">
								<input name="ssdList[0].oprice" type="number" disabled>
								<input name="ssdList[0].otype" type="hidden" value="2" disabled>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div>
					<span>상품메인정보</span>
				</div>
			</div>
			<div class="product_info">
				<div class="info-div">
					<textarea name="pinfo_main" class="info-area"></textarea>
				</div>
			</div>
			<div>
				<div>
					<span>상품서브정보1</span>
				</div>
			</div>
			<div class="product_info">
				<div class="info-div">
					<textarea name="pinfo1" class="info-area"></textarea>
				</div>
			</div>
			<div>
				<div>
					<span>상품서브정보2</span>
				</div>
			</div>
			<div class="product_info">
				<div class="info-div">
					<textarea name="pinfo2" class="info-area"></textarea>
				</div>
			</div>
			<div>
				<div>
					<span>상품서브정보3</span>
				</div>
			</div>
			<div class="product_info">
				<div class="info-div">
					<textarea name="pinfo3" class="info-area"></textarea>
				</div>
			</div>
			<div>
				<div>
					<span>썸네일 이미지(이미지 파일만 첨부 가능)</span>
				</div>
			</div>
			<div>
				<div>
					<input class="file-img" type="file">
				</div>
				<div class="thoumbneil">
					<div>
						<img data-thoumbnail="y" class="image-preview" src="/resources/css/dongyeong/default.png" style="width: 80px; height: 80px;">
					</div>
				</div>
			</div>
			<div>
				<div>
					<span>추가 이미지 1(이미지 파일만 첨부 가능)</span>
				</div>
			</div>
			<div>
				<div>
					<input class="file-img" type="file">
				</div>
				<div class="image">
					<div>
						<img data-thoumbnail="n" class="image-preview" src="/resources/css/dongyeong/default.png" style="width: 80px; height: 80px;">
					</div>
				</div>
			</div>
			<div>
				<div>
					<span>추가 이미지 2(이미지 파일만 첨부 가능)</span>
				</div>
			</div>
			<div>
				<div>
					<input class="file-img" type="file">
				</div>
				<div class="image">
					<div>
						<img data-thoumbnail="n" class="image-preview" src="/resources/css/dongyeong/default.png" style="width: 80px; height: 80px;">
					</div>
				</div>
			</div>
			<div>
				<button id="btn-register" type="button">추가하기</button>
				<button type="button" id="btn-close">닫기</button>
			</div>
		</form>
	</div>
</body>
</html>