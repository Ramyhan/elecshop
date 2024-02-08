<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function(){
	var timage = $("#image-thoumb-div").clone();
	var infoimage = $("#image-sub-div").clone();
	var infoimagess = $(".image-sub-div").clone();
	var infoimages = $(".image-info-div > div:eq(0)").clone;
	console.log("timage: ", timage);
	console.log("infoImage: ", infoimage);
	console.log("infoimagess: ", infoimagess);
	console.log("infoimages: ", infoimages);
	$("#select-mno").find("option[value=${productInfo.mno}]").attr("selected",true);
	
	$("#btn-productList").click(function(){
		$(location).attr("href","/admin/admin_product");
	});
	$(document).on("click",".btn-delete",function(){
		console.log(this);
		var that = $(this);
		var ono = $(this).attr("data-ono");
		var pno = $(this).attr("data-pno");
		console.log(ono);
		console.log(pno);
		
		if(ono != "" && pno != ""){
			sData = {
					"ono" : ono,
					"pno" : pno
			}
			$.post("/admin/admin_deleteOption",sData,function(rData){
				console.log(rData);
				if(rData == true){
					var div = that.closest("div").parent();
					div.remove();
				}
			});
		}else{
			var div = that.closest("div").parent().parent();
			div.remove();
		}
	});
	$("#btn-add-color").click(function(){
		if($(".color-magin-div").length == 0){
			var colorClone = "<div class='color-magin-div' id='color-magin-div'>"
				colorClone +="<div class='color-option-div' style='display: flex;flex-direction: column;'>";
				colorClone +="<div style='display: flex; justify-content: space-between;'>";
				colorClone +="<span>ssd옵션</span>";
				colorClone +="<button data-ono='' data-pno='' type='button' class='btn-delete'><i class='fa fa-times'></i></button>";
				colorClone +="</div>";
				colorClone +="<select name='colorList[0].oname' class='select-option select-color product-color-select'>";
				colorClone +="<option>--선택--</option>";
				colorClone +="<option value='128GB'>128GB</option>";
				colorClone +="<option value='256GB'>256GB</option>";
				colorClone +="<option value='512GB'>512GB</option>";
				colorClone +="<option value='1TB'>1TB</option>";
				colorClone +="</select>";
				colorClone +='</div>';
				colorClone +='</div>';
				$(".color-div").append(colorClone);
		}else{
			var colorMagin = $(".color-magin-div");
			console.log(colorMagin);
			var colorClone = $(this).parent().find("#color-magin-div").clone();
			console.log("222",colorClone);
			colorClone.find("button").attr("data-ono","");
			colorClone.find("button").attr("data-pno","");
			colorClone.find("select").attr("name", "colorList["+ colorMagin.length +"].oname");
			colorClone.find("select").find("option:eq(0)").prop("selected",true);
			colorClone.find("input").val("");
			$(".color-div").append(colorClone);
		}
	});
	$(document).on("click","#btn-add-ram",function(){
		console.log($(".ram-magin-div").length);
		if($(".ram-magin-div").length == 0){
			var ramClone = "<div class='ram-magin-div' id='ram-magin-div'>"
				ramClone +="<div class='ram-option-div' style='display: flex;flex-direction: column;'>";
				ramClone +="<div style='display: flex; justify-content: space-between;'>";
				ramClone +="<span>ram옵션</span>";
				ramClone +="<button data-ono='' data-pno='' type='button' class='btn-delete'><i class='fa fa-times'></i></button>";
				ramClone +="</div>";
				ramClone +="<select name='ramList[0].oname' class='select-option select-ram product-ram-select'>";
				ramClone +="<option>--선택--</option>";
				ramClone +="<option value='8GB'>8GB</option>";
				ramClone +="<option value='16GB'>16GB</option>";
				ramClone +="<option value='32GB'>32GB</option>";
				ramClone +="</select>";
				ramClone +="<input type='number'>";
				ramClone +='</div>';
				ramClone +='</div>';
				$(".ram-div").append(ramClone);
		}else{
			var ramMagin = $(".ram-magin-div");
			console.log(ramMagin);
			var ramClone = $(this).parent().find("#ram-magin-div").clone();
			console.log(ramClone);
			ramClone.find("button").attr("data-ono","");
			ramClone.find("button").attr("data-pno","");
			ramClone.find("select").attr("name", "ramList["+ ramMagin.length +"].oname");
			ramClone.find("input").attr("name", "ramList["+ ramMagin.length +"].oprice");
			ramClone.find("select").find("option:eq(0)").prop("selected",true);
			ramClone.find("input").val("");
			$(".ram-div").append(ramClone);
		}
	});
	
	$("#btn-add-ssd").click(function(){
		if($(".ssd-magin-div").length == 0){
			var ssdClone = "<div class='ssd-magin-div' id='ssd-magin-div'>"
				ssdClone +="<div class='ssd-option-div' style='display: flex;flex-direction: column;'>";
				ssdClone +="<div style='display: flex; justify-content: space-between;'>";
				ssdClone +="<span>ssd옵션</span>";
				ssdClone +="<button data-ono='' data-pno='' type='button' class='btn-delete'><i class='fa fa-times'></i></button>";
				ssdClone +="</div>";
				ssdClone +="<select name='ssdList[0].oname' class='select-option select-ssd product-ssd-select'>";
				ssdClone +="<option>--선택--</option>";
				ssdClone +="<option value='128GB'>128GB</option>";
				ssdClone +="<option value='256GB'>256GB</option>";
				ssdClone +="<option value='512GB'>512GB</option>";
				ssdClone +="<option value='1TB'>1TB</option>";
				ssdClone +="</select>";
				ssdClone +="<input type='number'>";
				ssdClone +='</div>';
				ssdClone +='</div>';
				$(".ssd-div").append(ssdClone);
		}else{
			var ssdMagin = $(".ssd-magin-div");
			console.log(ssdMagin);
			var ssdClone = $(this).parent().find("#ssd-magin-div").clone();
			ssdClone.find("button").attr("data-ono","");
			ssdClone.find("button").attr("data-pno","");
			ssdClone.find("select").attr("name", "ssdList["+ ssdMagin.length +"].oname");
			ssdClone.find("input").attr("name", "ssdList["+ ssdMagin.length +"].oprice");
			ssdClone.find("select").find("option:eq(0)").prop("selected",true);
			ssdClone.find("input").val("");
			$(".ssd-div").append(ssdClone);
		}
	});
	$(document).on("click",".delete-image",function(){
		var that = $(this);
		var ano = $(this).attr("data-ano");
		if(ano != ""){
			$.post("/admin/deleteImage",{"ano" : ano},function(rData){
				console.log(rData)
				if(rData == true){
					var subDiv = that.closest(".image-sub-div");
					subDiv.remove();
				}
			});
		}
	});
	$(".file-img").on("change",function(e){
		console.log("11",timage);
		console.log("22",infoimage);
		var that = $(this);
		var file = e.target.files[0];
		var filename = e.target.files[0].name;
		var formData = new FormData();
		formData.append("uploadFile",file);
		var reader = new FileReader();
		console.log(reader);
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
						var thoumbDiv = that.parent().parent().find(".image-thoumb-div");
						console.log(thoumbDiv);
						var image = "<div style='display: flex;' class='image-thoumb-div'>";
						image += "<div class='image-sub-div'>";
						image +="<img src='/display?fileName='"+rData[0].aurl + "' style='width: 150;height: 80;border: 1px solid;";
// 						'data-apath >";
						image +="<i class='fa fa-times-circle deleteLike delete-image' title='삭제하기'style='position:relative; bottom: 26px; right: 26px; opacity: 1'></i>";
						image +="</div>";
						image +="</div>";
						var subImage = $(".image-info-div");
						subImage.append(infoimage);
// 								image.attr("data-file", rData[0].afileName);
// 								image.find("img").attr("data-apath", rData[0].apath);
// 								image.find("img").attr("data-uuid", rData[0].auuid);
// 								image.find("img").attr("data-url", rData[0].aurl);
// 								image.find("img").attr("src","/display?fileName=" + rData[0].aurl);
					}
				});
			}
			reader.readAsDataURL(file);
		}else{
			alert("이미지 파일만 올릴 수 있습니다");
			$(".file-img").val("");
			$(".image-preview").attr("src","/resources/css/dongyeong/default.png");
			return false;
		}
	});
	function isImageFile(file) {
	    var ext = file.name.split(".").pop().toLowerCase(); 
	    return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
	}
});
</script>
<style>
	.ram-div,.ssd-div,.color-div{
		width: 15%;
		margin: 20 30 20 30;
	}
	.ram-magin-div,.ssd-magin-div,.color-magin-div{
	margin: 20 0 20 0;
	border: 1px solid rgba(0,0,0,0.5);
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/include/top.jsp"%>
<div class="main-div">
<%@ include file="/WEB-INF/views/include/admin_sidebar.jsp"%>
	<div class="set-div">
		<div class="user-div">
			<div>
				<h1>상품 상세페이지</h1>
			</div>
			<div class="div-main">
				<div class="second-div">
					<div style="width: 80%">
						<div style="display: flex; flex-direction: column;">
						<form action="/admin/updateProduct" method="post"></form>
							<input name="pno" class="product-name" type="hidden" value="${productInfo.pno}">
							<span>상품제목</span>
							<input name="pname" class="product-name" type="text" value="${productInfo.pname}">
							<span>상품가격</span>
							<input name="pprice" class="product-name" type="text" value="${productInfo.pprice}">
							<span>상품번호</span>
							<input name="pcode" class="product-name" type="text" value="${productInfo.pcode}">
							<c:if test="${productInfo.pdno != 0 || productInfo.pdno == 3 || productInfo.pdno == 4}">
								<div>
									<span>카테고리:</span>
									<input type="radio" name="pdno" ${productInfo.pdno == 1? "checked" : ""} >스피커
									<input type="radio" name="pdno" ${productInfo.pdno == 2? "checked" : ""} >헤드셋
									<input type="radio" name="pdno" ${productInfo.pdno == 3? "checked" : ""} >이어폰
									<input type="radio" name="pdno" ${productInfo.pdno == 4? "checked" : ""} >마우스
									<input type="radio" name="pdno" ${productInfo.pdno == 5? "checked" : ""} >키보드
								</div>
							</c:if>
								<div>
									<div class="input-cell">
										<span>제조사</span>
										<select name="mno" class="select-option" id="select-mno" style="text-align: center;">
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
										</select>
									</div>
								</div>
							<div style="display: flex;">
								<c:if test="${productInfo.ptype == 1 or productInfo.ptype == 3}">
									<div class="ram-div">
										<button id="btn-add-ram">RAM<i class="fa fa-plus"></i></button>
										<c:forEach items="${productInfo.ramList}" var="ram">
										<div class="ram-magin-div" id="ram-magin-div">
											<div class="ram-option-div" style="display: flex;flex-direction: column;">
												<div style="display: flex; justify-content: space-between;">
													<span>ram옵션</span>
													<button data-ono="${ram.ono}" data-pno="${ram.pno}" type="button" class="btn-delete"><i class="fa fa-times"></i></button>
												</div>
												<select name="ramList[0].oname" class="select-option select-ram product-ram-select">
													<option>--선택--</option>
													<option value="8GB" ${ram.oname == '8GB'? 'selected' : ""}>8GB</option>
													<option value="16GB"  ${ram.oname == '16GB'? 'selected' : ""}>16GB</option>
													<option value="32GB" ${ram.oname == '32GB'? 'selected' : ""}>32GB</option>
												</select>
												<input type="number" value="${ram.oprice}" pattern="#,###">
											</div>
										</div>
										</c:forEach>
									</div>
								</c:if>
								<c:if test="${productInfo.ptype == 1 or productInfo.ptype == 3}">
									<div class="ssd-div">
										<button id="btn-add-ssd">SSD<i class="fa fa-plus"></i></button>
										<c:forEach items="${productInfo.ssdList }" var="ssd">
											<div class="ssd-magin-div" id="ssd-magin-div">
												<div class="ssd-option-div" style="display: flex;flex-direction: column;">
													<div style="display: flex; justify-content: space-between;">
														<span>ssd옵션</span>
														<button data-ono="${ssd.ono}" data-pno="${ssd.pno}" type="button" class="btn-delete"><i class="fa fa-times"></i></button>
													</div>
													<select name="ssdList[0].oname" class="select-option select-ssd product-ram-select">
														<option>--선택--</option>
														<option value="128GB"  ${ssd.oname == '128GB'? 'selected' : ""}>128GB</option>
														<option value="256GB" ${ssd.oname == '256GB'? 'selected' : ""}>256GB</option>
														<option value="512GB" ${ssd.oname == '512GB'? 'selected' : ""}>512GB</option>
														<option value="1TB" ${ssd.oname == '1TB'? 'selected' : ""}>1TB</option>
													</select>
													<input type="number" value="${ssd.oprice}" pattern="#,###">
												</div>
											</div>
										</c:forEach>
									</div>
								</c:if>
								<c:if test="${productInfo.ptype != 2}">
									<div class="color-div">
										<button id="btn-add-color">COLOR<i class="fa fa-plus"></i></button>
										<c:forEach items="${productInfo.colorList}" var="color">
											<div id="color-magin-div" class="color-magin-div">
												<div id="color-option-div" class="" style="display: flex;flex-direction: column;">
													<div style="display: flex; justify-content: space-between;">
														<span>color옵션</span>
														<button data-ono="${color.ono}" data-pno="${color.pno}" type="button" class="btn-delete"><i class="fa fa-times"></i></button>
													</div>
													<select name="colorList[0].oname" class="select-option select-color product-color">
														<option>--선택--</option>
														<option value="Black" ${color.oname == 'Black'? 'selected' : ""}>Black</option>
														<option value="Red" ${color.oname == 'Red'? 'selected' : ""}>Red</option>
														<option value="Gray" ${color.oname == 'Gray'? 'selected' : ""}>Gray</option>
														<option value="Blue" ${color.oname == 'Blue'? 'selected' : ""}>Blue</option>
													</select>
												</div>
											</div>
										</c:forEach>
									</div>
								</c:if>
							</div>
							<div style="display: contents;">
								<span>메인 정보</span>
								<textarea rows="4" cols="50"  name="pmain_info">${productInfo.pinfo_main}</textarea>
							</div>
							<div style="display: contents;">
								<span>서브 정보1</span>
								<textarea rows="4" cols="50"  name="pinfo1">${productInfo.pinfo1}</textarea>
							</div>
							<div style="display: contents;">
								<span>서브 정보2</span>
								<textarea rows="4" cols="50"  name="pinfo2">${productInfo.pinfo2}</textarea>
							</div>
							<div style="display: contents;">
								<span>서브 정보3</span>
								<textarea rows="4" cols="50"  name="pinfo3">${productInfo.pinfo3}</textarea>
							</div>
							<div style="padding: 20 0 20 0">
									<div style="display: flex; flex-direction: column;">
										<div>
											<span>썸네일 이미지</span>
											<input type="file" class="file-img">
										</div>
										<div style="display: flex;"  class="image-thoumb-div">
											<c:forEach var="thoumbnail" items="${productInfo.thoumbnailImageList}">
													<div style="display: flex;" class="image-th-div" id="image-thoumb-div">
														<div class="image-sub-div">
															<img src="/display?fileName=${thoumbnail.aurl}" style="width: 150;height: 80;border: 1px solid;">
															<i class="fa fa-times-circle deleteLike delete-image" title="삭제하기" data-ano="${thoumbnail.ano}"
															style=" position:relative; bottom: 26px; right: 26px; opacity: 1"></i>
														</div>
													</div>
											</c:forEach>
										</div>
									</div>
									<div style="display: flex; flex-direction: column;">
										<div>
											<span>정보 이미지</span>
											<input type="file" class="file-img">
										</div>
										<div style="display: flex;"  class="image-info-div">
									<c:forEach items="${productInfo.infoImageList}" var="image">
											<div  class="image-sub-div" id="image-sub-div">
												<img src="/display?fileName=${image.aurl}" style="width: 150;height: 80;border: 1px solid;">
												<i class="fa fa-times-circle deleteLike delete-image" title="삭제하기" data-ano="${image.ano}"
												style=" position:relative; bottom: 26px; right: 26px; opacity: 1"></i>
											</div>
									</c:forEach>
										</div>
								</div>
							</div>
						</div>
					</div>
					<div  style="padding: 10 0 30 0">
						<button type="button">수정하기</button>
						<button type="button" id="btn-productList">목록으로</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/bottom.jsp"%>