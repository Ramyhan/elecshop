<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div class="inquiry-table">
	<div class="box"></div>
	<div class="box">
		<div class="inquiry-div-main">
		<!-- inquiry form -->
			<form action="">
				<h3 style="text-align: center;">1:1문의</h3>
				<div class="inquiry-div-sub d-flex">
					<label>아이디</label>
					<em style="padding-right: 85px; color: green;">(선택)</em>
					<div>아이디명</div>
				</div>
				<div class="inquiry-div-sub d-flex">
					<label>카테고리</label>
					<em style="padding-right: 73px; color: green;">(필수)</em>
					<select>
						<option>반품/환불</option>
						<option>노트북</option>
						<option>모니터</option>
						<option>태블릿</option>
						<option>음향기기</option>
						<option>주변기기</option>
					</select>
				</div>
				<div class="inquiry-div-sub d-flex">
					<label>이메일</label>
					<em style="padding-right: 86px; color: blue;">(필수)</em>
					<input class="input" type="text" >
				</div>
				<div class="inquiry-div-sub d-flex flex-wrap">
					<label>문의 내용</label>
					<em style="padding-right: 66px; color: blue;">(필수)</em>
					<textarea class="input" maxlength="1000" style="height: 200px;"></textarea>
					<span style="padding-left: 176px; padding-top: 15px">0자 입력 / 최대 1000자</span>
				</div>
				<div  class="inquiry-div-sub d-flex">
					<label>파일첨부</label>
					<em style="padding-right: 72px; color: green;">(선택)</em>
					<input type="file">
				</div>
				<div class="inquiry-div-sub d-flex justify-content-center">
					<button type="button" class="inquiry-btn">문의하기</button>
				</div>
			</form>
			<!-- //inquiry form -->
		</div>
	</div>
	<div class="box"></div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>