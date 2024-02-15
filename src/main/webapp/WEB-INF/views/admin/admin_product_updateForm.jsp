<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function(){
	var timage = $("#image-th-div").clone();
	var infoimage1 = $("#image-info-sub1-div").clone();
	var infoimage2 = $("#image-info-sub2-div").clone();
	
	
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
		var div = that.closest("div").parent().parent();
		div.remove();
	});
	$("#btn-add-color").click(function(){
		if($(".color-magin-div").length == 0){
			var colorClone = "<div class='color-magin-div' id='color-magin-div'>"
				colorClone +="<div class='color-option-div' style='display: flex;flex-direction: column;'>";
				colorClone +="<div style='display: flex; justify-content: space-between;'>";
				colorClone +="<span>color옵션</span>";
				colorClone +="<button data-ono='' data-pno='' type='button' class='btn-delete'><i class='fa fa-times'></i></button>";
				colorClone +="</div>";
				colorClone +="<select name='colorList[0].oname' class='select-option select-color product-color-select'>";
				colorClone +="<option>--선택--</option>";
				colorClone +="<option value='white'>white</option>";
				colorClone +="<option value='black'>black</option>";
				colorClone +="<option value='blue'>blue</option>";
				colorClone +="<option value='red'>red</option>";
				colorClone +="</select>";
				colorClone +="<input id='color-oprice' type='hidden' name='colorList[0].oprice' value=0>";
				colorClone +="<input id='color-pno' type='hidden' name='colorList[0].pno' value=${productInfo.pno}>";
				colorClone +="<input id='color-otype' type='hidden' name='colorList[0].otype' value=3>";
				colorClone +="<input id='color-ono' type='hidden' name='colorList[0].ono' value=0>";
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
			colorClone.find("#color-ono").attr("name", "colorList["+ colorMagin.length +"].ono");
			colorClone.find("#color-otype").attr("name", "colorList["+ colorMagin.length +"].otype");
			colorClone.find("#color-oprice").attr("name", "colorList["+ colorMagin.length +"].oprice");
			colorClone.find("#color-pno").attr("name", "colorList["+ colorMagin.length +"].pno");
			colorClone.find("select").find("option:eq(0)").prop("selected",true);
			colorClone.find("#color-oprice").val(0);
			colorClone.find("#color-ono").val(0);
			$(".color-div").append(colorClone);
		}
	});
	$(document).on("click","#btn-add-ram",function(){
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
				ramClone +="<input id='ram-oprice' type='number' name='ramList[0].oprice' value=0>";
				ramClone +="<input id='ram-pno' type='hidden' name='ramList[0].pno' value=${productInfo.pno}>";
				ramClone +="<input id='ram-otype' type='hidden' name='ramList[0].otype' value=1>";
				ramClone +="<input id='ram-ono' type='hidden' name='ramList[0].ono' value=0>";
				ramClone +='</div>';
				ramClone +='</div>';
				$(".ram-div").append(ramClone);
		}else{
			var ramMagin = $(".ram-magin-div");
			console.log(ramMagin.length);
			var ramClone = $(this).parent().find("#ram-magin-div").clone();
			console.log(ramClone);
			ramClone.find("button").attr("data-ono","");
			ramClone.find("button").attr("data-pno","");
			ramClone.find("select").attr("name", "ramList["+ ramMagin.length +"].oname");
			ramClone.find("#ram-oprice").attr("name", "ramList["+ramMagin.length+"].oprice");
			ramClone.find("#ram-ono").attr("name", "ramList["+ ramMagin.length +"].ono");
			ramClone.find("#ram-otype").attr("name", "ramList["+ ramMagin.length +"].otype");
			ramClone.find("#ram-pno").attr("name", "ramList["+ ramMagin.length +"].pno");
			ramClone.find("select").find("option:eq(0)").prop("selected",true);
			ramClone.find("#ram-oprice").val(0);
			ramClone.find("#ram-ono").val(0);
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
				ssdClone +="<input id='ssd-oprice' type='number' name='ssdList[0].oprice' value=0>";
				ssdClone +="<input id='ssd-pno' type='hidden' name='ssdList[0].pno' value=${productInfo.pno}>";
				ssdClone +="<input id='ssd-otype' type='hidden' name='ssdList[0].otype' value=2>";
				ssdClone +="<input id='ssd-ono' type='hidden' name='ssdList[0].ono' value=0>";
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
			ssdClone.find("#ssd-oprice").attr("name", "ssdList["+ ssdMagin.length +"].oprice");
			ssdClone.find("#ssd-otype").attr("name", "ssdList["+ ssdMagin.length +"].otype");
			ssdClone.find("#ssd-pno").attr("name", "ssdList["+ ssdMagin.length +"].pno");
			ssdClone.find("#ssd-ono").attr("name", "ssdList["+ ssdMagin.length +"].ono");
			ssdClone.find("select").find("option:eq(0)").prop("selected",true);
			ssdClone.find("#ssd-oprice").val(0);
			ssdClone.find("#ssd-ono").val(0);
			$(".ssd-div").append(ssdClone);
		}
	});
	$(document).on("click",".delete-image",function(){
		var that = $(this);
		console.log(this);
		var ano = $(this).attr("data-ano");
		var subDiv = that.parent().parent();
		console.log($("#image-thoumb-div").children().length);
		var file = $(this).siblings("img").attr("data-file");
		console.log(file);
		if(that.parent().parent().parent().get(0)=== $("#image-thoumb-div").get(0)){
			$("#thoumb-input").prop("disabled",false);
		}else if(that.parent().parent().parent().get(0)=== $("#image-info1-div").get(0)){
			$("#info1-input").prop("disabled",false);
		}else if(that.parent().parent().parent().get(0)=== $("#image-info2-div").get(0)){
			$("#info2-input").prop("disabled",false);
		}
		var sendData = {
				"fileName" : that.attr("data-filename")
		};
		$.post("/deleteFile",sendData,function(rData){
			console.log(rData)
		});
		subDiv.remove();
		console.log($("#image-thoumb-div").children().length);
	});
	$(".file-image").on("change",function(e){
		console.log("11",timage);
		console.log("22",infoimage1);
		var that = $(this);
		var file = e.target.files[0];
		console.log(file);
		var filename = e.target.files[0].name;
		var formData = new FormData();
		formData.append("uploadFile",file);
		var reader = new FileReader();
		var qwe = that.siblings("span");
		var isImage = isImageFile(file);
		if(isImage == true){
			reader.onload = function(e){
					if(qwe.text().trim() == "썸네일 이미지"){
					var image = timage.clone(true);
					console.log(image);
					image.find("img").attr("src",e.target.result);
					var thoumb = $(".image-thoumb-div");
					thoumb.append(image);
				}else if(qwe.text().trim()== "정보 이미지1"){
					var infoImage1 = infoimage1.clone(true);
					var infoDiv1 = $("#image-info1-div");
					console.log(infoImage1);
					infoImage1.find("img").attr("src",e.target.result);
					infoDiv1.append(infoImage1);
				}else if(qwe.text().trim()== "정보 이미지2"){
					var infoImage2 = infoimage2.clone(true);
					var infoDiv2 = $("#image-info2-div");
					infoImage2.find("img").attr("src",e.target.result);
					infoDiv2.append(infoImage2);
				}
					that.attr("disabled",true);
			}
			$.ajax({
				
					"url" : "/uploadAjax",
					"type" : "post",
					"processData" : false,
					"contentType" : false,
					"data" : formData,
					"success" : function(rData){
						console.log(rData);
						var img = that.parent().siblings("div").find("img");
						console.log(img);
						img.parent().find("i").attr("data-filename",rData[0].aurl);
						img.attr("data-file", rData[0].afileName);
						img.attr("data-apath", rData[0].apath);
						img.attr("data-uuid", rData[0].auuid);
						img.attr("data-url", rData[0].aurl);
						img.parent().find("#image-info").val(rData[0].aurl);
						img.parent().find("#afileName").val(rData[0].afileName);
						img.parent().find("#apath").val(rData[0].apath);
						img.parent().find("#auuid").val(rData[0].auuid);
						img.parent().find("#aurl").val(rData[0].aurl);
					}
			})
			reader.readAsDataURL(file);
			that.val("");
		}else{
			alert("이미지 파일만 올릴 수 있습니다");
			$(".file-img").val("");
			$(".image-preview").attr("src","/resources/css/dongyeong/default.png");
			return false;
		}
	});
	$("#btn-update").click(function(){
		$("#frm-update").submit();
	})
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
	input{
		text-align: right;
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
						<form id="frm-update" action="/admin/updateProduct" method="post">
						<div style="display: flex; flex-direction: column;">
							<div style="display: flex;">
								<input name="pno" class="product-name" type="hidden" value="${productInfo.pno}">
								<div>
									<span>상품제목</span>
									<input name="pname" class="product-name" type="text" value="${productInfo.pname}">
								</div>
								<div>
									<span>상품가격</span>
									<input name="pprice" class="product-name" type="number" value="${productInfo.pprice}">
								</div>
								<div>
									<span>재고수량</span>
									<input name="order_count" class="product-name" type="number" value="${productInfo.order_count}">
								</div>
								<div>
									<span>상품번호</span>
									<input name="pcode" class="product-name" type="text" value="${productInfo.pcode}">
								</div>
								<div>
									<div class="input-cell">
										<span>제조사</span>
										<select name="mno" class="select-option" id="select-mno" style="text-align: center;">
											<option>--선택--</option>
											<c:forEach var="items" items="${facturer}" varStatus="status">
												<option value="${items.mno}" ${items.mno == productInfo.mno? 'selected' : '' }>${items.mname}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<c:if test="${productInfo.pdno != 0 || productInfo.pdno == 3 || productInfo.pdno == 4}">
								<div>
									<span>카테고리:</span>
									<input type="radio" name="pdno" ${productInfo.pdno == 1? "checked" : ""} value="1">스피커
									<input type="radio" name="pdno" ${productInfo.pdno == 2? "checked" : ""} value="2">헤드셋
									<input type="radio" name="pdno" ${productInfo.pdno == 3? "checked" : ""} value="3">이어폰
									<input type="radio" name="pdno" ${productInfo.pdno == 4? "checked" : ""} value="4">마우스
									<input type="radio" name="pdno" ${productInfo.pdno == 5? "checked" : ""} value="5">키보드
								</div>
							</c:if>
							<div style="display: flex;">
								<c:if test="${productInfo.ptype == 1 or productInfo.ptype == 3}">
									<div class="ram-div">
										<button type="button" id="btn-add-ram">RAM<i class="fa fa-plus"></i></button>
										<c:forEach items="${productInfo.ramList}" var="ram" varStatus="status">
										<div class="ram-magin-div" id="ram-magin-div">
											<div class="ram-option-div" style="display: flex;flex-direction: column;">
												<div style="display: flex; justify-content: space-between;">
													<span>ram옵션</span>
													<button data-ono="${ram.ono}" data-pno="${ram.pno}" type="button" class="btn-delete"><i class="fa fa-times"></i></button>
												</div>
												<select name="ramList[${status.index}].oname" class="select-option select-ram product-ram-select">
													<option>--선택--</option>
													<option value="8GB" ${ram.oname == '8GB'? 'selected' : ""}>8GB</option>
													<option value="16GB"  ${ram.oname == '16GB'? 'selected' : ""}>16GB</option>
													<option value="32GB" ${ram.oname == '32GB'? 'selected' : ""}>32GB</option>
												</select>
												<input id="ram-ono" type="hidden" name="ramList[${status.index}].ono" value="${ram.ono}">
												<input id="ram-pno" type="hidden" name="ramList[${status.index}].pno" value="${ram.pno}">
												<input id="ram-oprice" type="number" name="ramList[${status.index}].oprice" value="${ram.oprice}" pattern="#,###">
												<input id="ram-otype" type="hidden" name="ramList[${status.index}].otype" value="1">
											</div>
										</div>
										</c:forEach>
									</div>
								</c:if>
								<c:if test="${productInfo.ptype == 1 or productInfo.ptype == 3}">
									<div class="ssd-div">
										<button type="button" id="btn-add-ssd">SSD<i class="fa fa-plus"></i></button>
										<c:forEach items="${productInfo.ssdList }" var="ssd" varStatus="status">
											<div class="ssd-magin-div" id="ssd-magin-div">
												<div class="ssd-option-div" style="display: flex;flex-direction: column;">
													<div style="display: flex; justify-content: space-between;">
														<span>ssd옵션</span>
														<button data-ono="${ssd.ono}" data-pno="${ssd.pno}" type="button" class="btn-delete"><i class="fa fa-times"></i></button>
													</div>
													<select name="ssdList[${status.index}].oname" class="select-option select-ssd product-ram-select">
														<option>--선택--</option>
														<option value="128GB"  ${ssd.oname == '128GB'? 'selected' : ""}>128GB</option>
														<option value="256GB" ${ssd.oname == '256GB'? 'selected' : ""}>256GB</option>
														<option value="512GB" ${ssd.oname == '512GB'? 'selected' : ""}>512GB</option>
														<option value="1TB" ${ssd.oname == '1TB'? 'selected' : ""}>1TB</option>
													</select>
													<input id="ssd-pno" type="hidden" name="ssdList[${status.index}].pno" value="${ssd.pno}">
													<input id="ssd-oprice" type="number" name="ssdList[${status.index}].oprice" value="${ssd.oprice}" pattern="#,###">
													<input id="ssd-otype" type="hidden" name="ssdList[${status.index}].otype" value="2">
													<input id="ssd-ono" type="hidden" name="ssdList[${status.index}].ono" value="${ssd.ono}">
												</div>
											</div>
										</c:forEach>
									</div>
								</c:if>
									<div class="color-div">
										<button type="button" id="btn-add-color">COLOR<i class="fa fa-plus"></i></button>
										<c:forEach items="${productInfo.colorList}" var="color" varStatus="status">
											<div id="color-magin-div" class="color-magin-div">
												<div id="color-option-div" class="" style="display: flex;flex-direction: column;">
													<div style="display: flex; justify-content: space-between;">
														<span>color옵션</span>
														<button data-ono="${color.ono}" data-pno="${color.pno}" type="button" class="btn-delete"><i class="fa fa-times"></i></button>
													</div>
													<select name="colorList[${status.index}].oname" class="select-option select-color product-color">
														<option>--선택--</option>
														<option value="Black" ${color.oname == 'Black'? 'selected' : ""}>Black</option>
														<option value="Red" ${color.oname == 'Red'? 'selected' : ""}>Red</option>
														<option value="white" ${color.oname == 'white'? 'selected' : ""}>white</option>
														<option value="Gray" ${color.oname == 'Gray'? 'selected' : ""}>Gray</option>
														<option value="Blue" ${color.oname == 'Blue'? 'selected' : ""}>Blue</option>
													</select>
													<input id="color-pno" type="hidden" name="colorList[${status.index}].pno" value="${color.pno}">
													<input id="color-oprice" type="hidden" name="colorList[${status.index}].oprice" value="0">
													<input id="color-otype" type="hidden" name="colorList[${status.index}].otype" value="3">
													<input id="color-ono" type="hidden" name="colorList[${status.index}].ono" value="${color.ono}">
												</div>
											</div>
										</c:forEach>
									</div>
							</div>
							<div style="display: contents;">
								<span>메인 정보</span>
								<textarea rows="4" cols="50"  name="pinfo_main">${productInfo.pinfo_main}</textarea>
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
												<input type="file" id="thoumb-input" class="file-image" ${not empty productInfo.pimage_thoumb? "disabled" : ''}>
										</div>
										<div style="display: flex;"  class="image-thoumb-div" id="image-thoumb-div">
											<div style="display: flex;" class="image-th-div" id="image-th-div">
												<div class="image-sub-div">
													<img src="/display?fileName=${productInfo.pimage_thoumb}" style="width: 150;height: 80;border: 1px solid;">
													<input id="image-info" type="hidden" name="pimage_thoumb" value="${productInfo.pimage_thoumb}">
													<input id="ano" type="hidden" name="imageThoumb.ano" data-ano="${productInfo.imageThoumb.ano}" value="${productInfo.imageThoumb.ano}">
													<input id="pno" type="hidden" name="imageThoumb.pno" data-pno="${productInfo.imageThoumb.pno}" value="${productInfo.imageThoumb.pno}">
													<input id="afileName" type="hidden" name="imageThoumb.afileName" data-.afileName="${productInfo.imageThoumb.afileName}" value="${productInfo.imageThoumb.afileName}">
													<input id="apath" type="hidden" name="imageThoumb.apath" data-apath="${productInfo.imageThoumb.apath}" value="${productInfo.imageThoumb.apath}">
													<input id="auuid" type="hidden" name="imageThoumb.auuid" data-auuid="${productInfo.imageThoumb.auuid}" value="${productInfo.imageThoumb.auuid}">
													<input id="aurl" type="hidden" name="imageThoumb.aurl" data-aurl="${productInfo.imageThoumb.aurl}" value="${productInfo.imageThoumb.aurl}">
													<input id="image_info" type="hidden" name="imageThoumb.image_info" data-info="${productInfo.imageThoumb.image_info}" value="${productInfo.imageThoumb.image_info}">
													<i class="fa fa-times-circle deleteLike delete-image" title="삭제하기" 
													data-ano="${productInfo.imageThoumb.ano}" data-fileName=""
													style=" position:relative; bottom: 26px; right: 26px; opacity: 1"></i>
												</div>
											</div>
										</div>
									</div>
									<div style="display: flex; flex-direction: column;">
										<div>
											<span>정보 이미지1</span>
											<input type="file" id="info1-input" class="file-image"  ${not empty productInfo.pimage_info1?"disabled" : ''}>
										</div>
									<div style="display: flex;"  class="image-info1-div" id="image-info1-div">
										<div style="display: flex;" class="image-info-sub1-div" id="image-info-sub1-div">
											<div  class="image-sub-div" id="image-sub-div">
												<img src="/display?fileName=${productInfo.pimage_info1}" style="width: 150;height: 80;border: 1px solid;">
												<input id="image-info" type="hidden" name="pimage_info1" value="${productInfo.pimage_info1}">
												<input id="ano" type="hidden" name="imageInfo1.ano" data-ano="${productInfo.imageInfo1.ano}" value="${productInfo.imageInfo1.ano}">
												<input id="pno" type="hidden" name="imageInfo1.pno" data-pno="${productInfo.imageInfo1.pno}" value="${productInfo.imageInfo1.pno}">
												<input id="afileName" type="hidden" name="imageInfo1.afileName" data-.afileName="${productInfo.imageInfo1.afileName}" value="${productInfo.imageInfo1.afileName}">
												<input id="apath" type="hidden" name="imageInfo1.apath" data-apath="${productInfo.imageInfo1.apath}" value="${productInfo.imageInfo1.apath}">
												<input id="auuid" type="hidden" name="imageInfo1.auuid" data-auuid="${productInfo.imageInfo1.auuid}" value="${productInfo.imageInfo1.auuid}">
												<input id="aurl"  type="hidden" name="imageInfo1.aurl" data-aurl="${productInfo.imageInfo1.aurl}" value="${productInfo.imageInfo1.aurl}">
												<input  id="image_info"type="hidden" name="imageInfo1.image_info" data-info="${productInfo.imageInfo1.image_info}" value="${productInfo.imageInfo1.image_info}">
												<i class="fa fa-times-circle deleteLike delete-image" title="삭제하기" data-fileName=""
												data-ano="${productInfo.imageInfo1.ano}"
												style=" position:relative; bottom: 26px; right: 26px; opacity: 1"></i>
											</div>
										</div>
									</div>
								</div>
								<div style="display: flex; flex-direction: column;">
									<div>
										<span>정보 이미지2</span>
										<input type="file" id="info2-input" class="file-image"  ${not empty productInfo.pimage_info2?"disabled" : ''}>
									</div>
									<div style="display: flex;"  class="image-info2-div" id="image-info2-div">
										<div style="display: flex;" class="image-info-sub2-div" id="image-info-sub2-div">
											<div  class="image-sub-div" id="image-sub-div">
												<img src="/display?fileName=${productInfo.pimage_info2}" style="width: 150;height: 80;border: 1px solid;">
												<input id="image-info" type="hidden" name="pimage_info2" value="${productInfo.pimage_info2}">
												<input id="ano" type="hidden" name="imageInfo2.ano" data-ano="${productInfo.imageInfo2.ano}" value="${productInfo.imageInfo2.ano}">
												<input id="pno" type="hidden" name="imageInfo2.pno" data-pno="${productInfo.imageInfo2.pno}" value="${productInfo.imageInfo2.pno}">
												<input id="afileName"  type="hidden" name="imageInfo2.afileName" data-.afileName="${productInfo.imageInfo2.afileName}" value="${productInfo.imageInfo2.afileName}">
												<input id="apath" type="hidden" name="imageInfo2.apath" data-apath="${productInfo.imageInfo2.apath}" value="${productInfo.imageInfo2.apath}">
												<input id="auuid" type="hidden" name="imageInfo2.auuid" data-auuid="${productInfo.imageInfo2.auuid}" value="${productInfo.imageInfo2.auuid}">
												<input id="aurl"  type="hidden" name="imageInfo2.aurl" data-aurl="${productInfo.imageInfo2.aurl}" value="${productInfo.imageInfo2.aurl}">
												<input  id="image_info" type="hidden" name="imageInfo2.image_info" data-info="${productInfo.imageInfo2.image_info}" value="${productInfo.imageInfo2.image_info}">
												<i class="fa fa-times-circle deleteLike delete-image" title="삭제하기" data-fileName=""
												 data-ano="${productInfo.imageInfo2.ano}"
												style=" position:relative; bottom: 26px; right: 26px; opacity: 1"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div  style="padding: 10 0 30 0;display: flex; justify-content: center;">
								<div>
									<button id="btn-update" type="button">수정하기</button>
									<button type="button" id="btn-productList">목록으로</button>
								</div>
							</div>
						</div>
							</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/bottom.jsp"%>