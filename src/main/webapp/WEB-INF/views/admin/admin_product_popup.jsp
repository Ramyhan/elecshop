<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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

.product-select,.select-option {
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
				$("#sub-select-div").find("input").attr("disabled",false);
				$("#sub-select-div").find("select").attr("disabled",false);
				$("#sub-select-div").find("input").attr("required",true);
				$("#sub-select-div").find("select").attr("required",true);
			}else{
				$("#sub-select-div").css("display", "none");
				$("#sub-select-div").find("input").attr("disabled",true);
				$("#sub-select-div").find("select").attr("disabled",true);
				$("#sub-select-div").find("input").attr("required",false);
				$("#sub-select-div").find("select").attr("required",false);
			}
			if(category == 4){
				$("#sound-detail").css("display","flex");
				$("#sound-detail").find("select").attr("disabled",false);
				$("#sound-detail").find("input").attr("disabled",false);
				$("#sound-detail").find("select").attr("required",true);
				$("#sound-detail").find("input").attr("required",true);
			}else{
				$("#sound-detail").css("display","none");
				$("#sound-detail").find("select").attr("disabled",true);
				$("#sound-detail").find("input").attr("disabled",true);
				$("#sound-detail").find("select").attr("required",false);
				$("#sound-detail").find("input").attr("required",false);
			}
			if(category == 5){
				$("#Peripherals-detail").css("display","flex");
				$("#Peripherals-detail").find("select").attr("disabled",false);
				$("#Peripherals-detail").find("input").attr("disabled",false);
				$("#Peripherals-detail").find("select").attr("required",true);
				$("#Peripherals-detail").find("input").attr("required",true);
			}else{
				$("#Peripherals-detail").css("display","none");
				$("#Peripherals-detail").find("select").attr("disabled",true);
				$("#Peripherals-detail").find("input").attr("disabled",true);
				$("#Peripherals-detail").find("select").attr("required",false);
				$("#Peripherals-detail").find("input").attr("required",false);
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
		$("#btn-sound-color").click(function() {
			var colorClone = $("#add-color-sound").clone();
			var selectColor = $(".add-color-sound");
			colorClone.find("select").attr("name","colorList["+ selectColor.length + "].oname");
			colorClone.find("input:eq(0)").attr("name","colorList["+ selectColor.length + "].opirce");
			colorClone.find("input:eq(1)").attr("name","colorList["+ selectColor.length + "].otype");
			$("#add-color-sound-div").append(colorClone);
		});
		$("#btn-Peripherals-color").click(function() {
			var colorClone = $("#add-color-Peripherals").clone();
			var selectColor = $(".add-color-Peripherals");
			colorClone.find("select").attr("name","colorList["+ selectColor.length + "].oname");
			colorClone.find("input:eq(0)").attr("name","colorList["+ selectColor.length + "].opirce");
			colorClone.find("input:eq(1)").attr("name","colorList["+ selectColor.length + "].otype");
			$("#add-color-Peripherals-div").append(colorClone);
		});
		$("#btn-pc-color").click(function(){
			var colorClone = $("#add-color-select").clone();
			var selectColor = $(".add-color-select");
			colorClone.find("select").attr("name","colorList["+ selectColor.length + "].oname");
			colorClone.find("input:eq(0)").attr("name","colorList["+ selectColor.length + "].opirce");
			colorClone.find("input:eq(1)").attr("name","colorList["+ selectColor.length + "].otype");
			$("#add-color-div").append(colorClone);
		});
		$(".file-img").on("change",function(e){
			var that = $(this)
			var file = e.target.files[0];
			var filename = e.target.files[0].name;
			var formData = new FormData();
			formData.append("uploadFile",file);
			var reader = new FileReader();
			var isImage = isImageFile(file);
			console.log(reader.onload);
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
		$("#frm-popup").submit(function(){
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
				if(thoumbnail == "y"){
					var hiddenThoumb2 ="<input type='hidden' name='pimage_thoumb' value='" + url + "'>";
					console.log("hiddenThoumb2: ", hiddenThoumb2);
				$("#frm-popup").prepend(hiddenThoumb2);
				}else{
					var hiddenImage = "<input type='hidden' name='pimage_info" + i + "' value='" + url + "'>";
					console.log("hiddenImage: ", hiddenImage);
					$("#frm-popup").prepend(hiddenImage);
				}
				$("#frm-popup").prepend(hiddenFile);
				$("#frm-popup").prepend(hiddenUuid);
				$("#frm-popup").prepend(hiddenUrl);
				$("#frm-popup").prepend(hiddenPath);
				$("#frm-popup").prepend(hiddenThoumb);
			});
		window.close();
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
		<form id="frm-popup" action="/admin/adminProductRegister" method="post" target="/admin/admin_product">
			<div class="popup-name">
				<span>상품 이름</span> <input name="pname" class="product-name" type="text" required>
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
						<input name="pprice" class="product-input-first" type="number" required>
					</div>
					<div class="input-cell">
						<input name="pcode" class="product-input-second" type="text">
					</div>
					<div class="input-cell">
						<input name="order_count" class="product-input-second" type="number" required>
					</div>
				</div>
				<div class="div-header">
					<div class="div-header-cell">
						<span>상품종류</span>
					</div>
					<div class="div-header-cell">
						<span>상품공개여부</span>
					</div>
					<div class="div-header-cell">
						<span>제조사</span>
					</div>
				</div>
				<div class="div-cell">
					<div class="input-cell">
						<select name="ptype" class="select-option product-select" required>
							<option>--선택--</option>
							<option value="1">노트북</option>
							<option value="2">모니터</option>
							<option value="3">태블릿</option>
							<option value="4">음향기기</option>
							<option value="5">주변기기</option>
						</select>
					</div>
					<div class="input-cell">
						<select name="pstate" class="select-option product-state" required>
							<option>--선택--</option>
							<option value="1">공개</option>
							<option value="0">비공개</option>
						</select>
					</div>
					<div class="input-cell">
						<select name="mno" class="select-option product-state" required>
							<option>--선택--</option>
							<option value="1">삼성</option>
							<option value="2">엘지</option>
							<option value="3">애플</option>
							<option value="4">델</option>
							<option value="5">아수스</option>
							<option value="6">레이져</option>
							<option value="7">msi</option>
							<option value="8">레노버</option>
							<option value="9">hp</option>
							<option value="10">소니</option>
							<option value="11">젠하이져</option>
							<option value="12">akg</option>
							<option value="13">브리츠</option>
							<option value="14">크리에이티브</option>
							<option value="15">로지텍</option>
							<option value="16">앱코</option>
							<option value="17">하이파이맨</option>
							<option value="18">매드캣츠</option>
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
								<span>RAM선택</span>
							</div>
						</div>
						<div class="div-cell">
							<div class="input-cell">
								<select name="ramList[0].oname" class="select-option select-ram product-ram-select" disabled>
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
								<select name="ssdList[0].oname" class="select-option select-ssd product-ssd-select" disabled>
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
				<div id="add-color-div">
					<button type="button" id="btn-pc-color">색상 추가</button>
					<div class="add-color-select" id="add-color-select">
						<div class="div-header">
							<div class="div-header-cell">
								<span>색상 선택</span>
							</div>
						</div>
						<div class="div-cell">
							<div class="input-cell">
								<select name="colorList[0].oname" class="select-option product-color" disabled>
									<option>--선택--</option>
									<option value="Black">Black</option>
									<option value="white">white</option>
									<option value="Red">Red</option>
									<option value="Gray">Gray</option>
									<option value="Blue">Blue</option>
								</select>
								<input type="hidden" name="colorList[0].oprice" value="0" disabled>
								<input type="hidden" name="colorList[0].otype" value="3" disabled>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none;" id="sound-detail">
				<div id="add-detail-div">
					<div class="sound-category-div" id="sound-category-div">
						<div class="div-header">
							<div class="div-header-cell">
								<span>카테고리 선택</span>
							</div>
						</div>
						<div class="div-cell">
							<div class="input-cell">
								<select name="pdno" class="select-sound" disabled>
									<option>--선택--</option>
									<option value="1">스피커</option>
									<option value="2">헤드셋</option>
									<option value="3">이어폰</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div id="add-color-sound-div">
					<button type="button" class="btn-color" id="btn-sound-color">색상 추가</button>
					<div class="add-color-sound" id="add-color-sound">
						<div class="div-header">
							<div class="div-header-cell">
								<span>색상선택</span>
							</div>
						</div>
						<div class="div-cell">
							<div class="input-cell">
								<select name="colorList[0].oname" class="select-option product-color" disabled>
									<option>--선택--</option>
									<option value="Black">Black</option>
									<option value="Red">Red</option>
									<option value="Gray">Gray</option>
									<option value="Blue">Blue</option>
								</select>
								<input type="hidden" name="colorList[0].oprice" value="0" disabled>
								<input type="hidden" name="colorList[0].otype" value="3" disabled>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none;" id="Peripherals-detail">
				<div id="add-detail-div">
					<div class="sound-category-div" id="sound-category-div">
						<div class="div-header">
							<div class="div-header-cell">
								<span>카테고리 선택</span>
							</div>
						</div>
						<div class="div-cell">
							<div class="input-cell">
								<select name="pdno" class="select-sound" disabled>
									<option>--선택--</option>
									<option value="4">마우스</option>
									<option value="5">키보드</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div id="add-color-Peripherals-div">
					<button type="button" class="btn-color" id="btn-Peripherals-color">색상 추가</button>
					<div class="add-color-Peripherals" id="add-color-Peripherals">
						<div class="div-header">
							<div class="div-header-cell">
								<span>색상선택</span>
							</div>
						</div>
						<div class="div-cell">
							<div class="input-cell">
								<select name="colorList[0].oname" class="select-option product-color" disabled>
									<option>--선택--</option>
									<option value="Black">Black</option>
									<option value="Red">Red</option>
									<option value="Gray">Gray</option>
									<option value="Blue">Blue</option>
								</select>
								<input type="hidden" name="colorList[0].oprice" value="0" disabled>
								<input type="hidden" name="colorList[0].otype" value="3" disabled>
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
					<textarea name="pinfo_main" class="info-area" required></textarea>
				</div>
			</div>
			<div>
				<div>
					<span>상품서브정보1</span>
				</div>
			</div>
			<div class="product_info">
				<div class="info-div">
					<textarea name="pinfo1" class="info-area" required></textarea>
				</div>
			</div>
			<div>
				<div>
					<span>상품서브정보2</span>
				</div>
			</div>
			<div class="product_info">
				<div class="info-div">
					<textarea name="pinfo2" class="info-area" required></textarea>
				</div>
			</div>
			<div>
				<div>
					<span>상품서브정보3</span>
				</div>
			</div>
			<div class="product_info">
				<div class="info-div">
					<textarea name="pinfo3" class="info-area" required></textarea>
				</div>
			</div>
			<div>
				<div>
					<span>썸네일 이미지(이미지 파일만 첨부 가능)</span>
				</div>
			</div>
			<div>
				<div>
					<input class="file-img" type="file" required>
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
					<input class="file-img" type="file" required>
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
					<input class="file-img" type="file" required>
				</div>
				<div class="image">
					<div>
						<img data-thoumbnail="n" class="image-preview" src="/resources/css/dongyeong/default.png" style="width: 80px; height: 80px;">
					</div>
				</div>
			</div>
			<div>
				<button id="btn-register" type="submit">추가하기</button>
				<button type="button" id="btn-close">닫기</button>
			</div>
		</form>
	</div>
</body>
</html>