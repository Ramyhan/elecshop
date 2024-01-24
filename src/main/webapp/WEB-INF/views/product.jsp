<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<style>
	h1 {
		font-family: "고딕";
	}

	#productMainImage {
		width: 600px;
		height: 550px;
	}
	
	.rate{
		background: url(https://aldo814.github.io/jobcloud/html/images/user/star_bg02.png) no-repeat;
		width: 121px;
		height: 20px;
		position: relative;
	}
	.rate span{
		position: absolute;
		background: url(https://aldo814.github.io/jobcloud/html/images/user/star02.png);
		width: auto;
		height: 20px;
	}
	
	.divOptionName{
		font-family: "고딕";
		font-size: 25px;
		font-weight: 400;
		font: bold;
	}
	
	.divOption{
		border: solid 1px #ffbe33;
		border-radius: 10px;
		font-family: "고딕"
	}
	
	.selectOption{
		background-color: #151515;
		border: solid 1px #ffbe33;
		color: white;
	}
	
	.divInfo {
		border-top:solid 2px #ffbe33;
		padding-top:30px;
		margin-top: 50px;
		width:100%;
	}	
	
	.productImage{
		text-align: center;
	}
	
	.productInfoImage{
		width:1100px;
		height:750px;
	}
	
	
	.info {
		border-bottom:solid 1px #AAAAAA;
		font-family: "고딕";
	}
	
	.infoName {
		font-size: 20px;
	}
	
	.infoComment {
		font-size: 15px;
		color: #AAAAAA;
	}
	
</style>

<body>
	<div id="main" style="color: white;">
		<div class="container">
			<div class="section">
				<div class="row">
					<div class="col-md-7" style="float:right;">
						<img id="productMainImage" alt="상품 사진" src="/resources/images/galaxybook4pro.png"/>	
					</div>
					<div class="col-md-5" style="border: solid  1px #ffbe33; border-radius:10px;">
						<h1 style="font-weight: 600;">Galaxy Book4 Pro</h1><br>
						<div style="float:left;">NT960QGK-KD72G</div><br>
						<div class="rate" style="float:left;">
							<span style="width: 50%"></span>
						</div>
						<div style="margin-left:130px;">3.5점 (150건)</div><br><br>
						<h3>기준가: 3,140,000</h3><br><br>
						
						<!-- 상품옵션 -->
						<div class="divOptionName">SSD</div>
						<div class="divOption">
							<div>
								<select class="selectOption" style="width: 100%; border-radius:10px;">
									<option selected>-----옵션을 선택해주세요-----</option>
									<option>-----옵션을 선택해주세요-----</option>
									<option>-----옵션을 선택해주세요-----</option>
									<option>-----옵션을 선택해주세요-----</option>
									<option>-----옵션을 선택해주세요-----</option>
								</select>
							</div>
						</div><br>
						<div class="divOptionName">RAM</div>
						<div class="divOption">
							<div>
								<select class="selectOption" style="width: 100%; border-radius:10px;">
									<option selected>-----옵션을 선택해주세요-----</option>
									<option>-----옵션을 선택해주세요-----</option>
									<option>-----옵션을 선택해주세요-----</option>
									<option>-----옵션을 선택해주세요-----</option>
									<option>-----옵션을 선택해주세요-----</option>
								</select>
							</div>
						</div>
					</div>
					<!-- //상품옵션 -->
					
					<!-- 상품 이미지 및 스펙 -->
					<div class="divInfo	col-md-12 productImage">
						<img class="productInfoImage" alt="상품 사진" src="/resources/images/galaxybook4pro2.jpg"/>
						<img class="productInfoImage" alt="상품 사진" src="/resources/images/galaxybook4pro3.jpg"/>
					</div>
					<div class="divInfo	col-md-12 productInfo">
						<h1>스팩</h1>
						<h3 class="info" style="padding-top:10px;">갤럭시 북4 Pro 360 (40.6 cm) Core™ Ultra 7 / 1 TB NVMe SSD</h3>
						<div class="info">
							<div class="infoName">운영체계</div>
							<div class="infoComment">
								<div>Windows 11 Home</div>
							</div>
						</div>
						<div class="info">
							<div class="infoName">프로세서/칩셋</div>
							<div class="infoComment">
								<div>Intel® Core™ Ultra 7 Processor 155H</div>
								<div>(UP to 4.8 GHz 24MB L3 Cache)</div>
							</div>
						</div>
						<div class="info">
							<div class="infoName">메모리</div>
							<div class="infoComment">
								<div>32 GB LPDDR5X Memory (On Board 32 GB)</div>
							</div>
						</div>
					</div>
					<!-- //상품 이미지 및 스펙 -->
					
					<!-- 상품평 -->
					<div class="divInfo	col-md-12 review">
						<h1>상품평</h1>
						<div style="font-size:30px; font:bold">3.5(150건)</div>
						<div class="rate" style="scale: 2; left: 60px; top: 10px;">
							<span style="width: 50%"></span>
						</div>
						<div class="row" style="padding-top: 50px;">
							<div class="col-md-12">
								<table class="table" style="color: white;">
									<thead>
										<tr>
											<th>#</th>
											<th>아이디</th>
											<th>내용</th>
											<th>평점</th>
											<th>등록일</th>
											<th>수정</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>TB - Monthly</td>
											<td>01/04/2012</td>
											<td>Default</td>
											<td>Default</td>
											<td>Default</td>
											<td>Default</td>
										</tr>
										<tr class="table-active">
											<td>1</td>
											<td>TB - Monthly</td>
											<td>01/04/2012</td>
											<td>Approved</td>
											<td>Approved</td>
											<td>Approved</td>
											<td>Approved</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- //상품평 -->
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>
