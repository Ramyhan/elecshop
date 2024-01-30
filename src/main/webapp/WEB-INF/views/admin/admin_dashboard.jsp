<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<link href="/resources/css/dongyeong/table.css" rel="stylesheet" />
<link href="/resources/css/dongyeong/admin.css" rel="stylesheet" />
<script>
$(function(){
	$(".left-div").show();
	$(".scroll-a").on("click",function(e){
	   e.preventDefault();
       $(".scroll-a i").toggle();
	    $('.left-div').animate({width:'toggle'});
	   var left =  $(".scroll-a").find(".scroll-left").css("display");
	   var right =  $(".scroll-a").find(".scroll-right").css("display");
	   console.log("left",left);
	   console.log("right",right);
	   if(left == "block"){
		   $(".scroll-div").animate({left:"12.5%"});
	   }else{
		  $(".scroll-div").animate({left:"0%"});
	   }
	});
});
</script>
<style>
	.summary-table{
		border-collapse: inherit;
	}
</style>
<%@include file="/WEB-INF/views/include/top.jsp"%>
<div class="main-div">
<%@ include file="/WEB-INF/views/include/admin_sidebar.jsp"%>
	<div class="set-div">
		<div class="admin-title" style="width: 100%; text-align: center;">
			<span>관리자 페이지</span>
		</div>
		<div class="admin-border">
			<div class="admin-day">
				<div class="day-div">
					<div class="admin-sub-title">
						<span>오늘 할 일</span>
						<span class="day-result">43</span>
					</div>
					<div class="div-hr"></div>
					<div>
						<div>
							<span>주문</span>
							<span class="day-num">1</span>
							<span>환불</span>
							<span class="day-num">2</span>
							<span>취소</span>
							<span class="day-num">3</span>
							<span>문의</span>
							<span class="day-num">4</span>
						</div>
					</div>
				</div>
			</div>
			<div class="admin-graph">
				<div class="admin-sub-title">
					<span>방문자 현황</span>
				</div>
				<div class="div-hr"></div>
				<div>
  					<canvas id="myChart" width="588" height="322"></canvas>
  					<script src="/resources/css/dongyeong/chart.js"></script>
				</div>
			</div>
			<div class="admin-summary">
				<div class="admin-sub-title">
					<span>일자별 요약</span>
				</div>
				<div class="div-hr"></div>
				<div style="height: 91%; overflow: auto;">
					<table class="summary-table">
					  <thead>
					    <tr>
					      <th>일자</th>
					      <th>주문수</th>
					      <th>방문자</th>
					      <th>매출액</th>
					      <th>가입</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <td>24-01-28</td>
					      <td>Marco Belinelli</td>
					      <td>G</td>
					      <td>6-5</td>
					      <td>195</td>
					    </tr>
					    <tr>
					      <td>24-01-28</td>
					      <td>Carlos Boozer</td>
					      <td>F</td>
					      <td>6-9</td>
					      <td>266</td>
					    </tr>
					    <tr>
					      <td>21</td>
					      <td>Jimmy Butler</td>
					      <td>G-F</td>
					      <td>6-7</td>
					      <td>220</td>
					    </tr>
					    <tr>
					      <td>9</td>
					      <td>Luol Deng</td>
					      <td>F</td>
					      <td>6-9</td>
					      <td>220</td>
					    </tr>
					    <tr>
					      <td>22</td>
					      <td>Taj Gibson</td>
					      <td>F</td>
					      <td>6-9</td>
					      <td>225</td>
					    </tr>
					    <tr>
					      <td>32</td>
					      <td>Richard Hamilton</td>
					      <td>G</td>
					      <td>6-7</td>
					      <td>193</td>
					    </tr>
					    <tr>
					      <td>12</td>
					      <td>Kirk Hinrich</td>
					      <td>G</td>
					      <td>6-4</td>
					      <td>190</td>
					    </tr>
					    <tr>
					      <td>12</td>
					      <td>Kirk Hinrich</td>
					      <td>G</td>
					      <td>6-4</td>
					      <td>190</td>
					    </tr>
					  </tbody>
					</table>
				</div>
			</div>
			<div class="admin-iquiry">
				<div class="admin-sub-title">
					<span>문의 및 구매 평</span>
				</div>
				<div class="div-hr"></div>
				<div class="iquiry-div">
					<div class="iquiry-message">
						<img src="/resources/css/dongyeong/default.png" style="float: left;">
							<a href="#">
							<span>[문의]</span>
							<span class="iquiry-first">구매 문의 입니다</span>
							</a>
						<div>
							<span class="iquiry-second-name">구매자</span>
							<span class="iquiry-second-date">24-01-28</span>
						</div>
					</div>
				</div>
			</div>
			<div class="admin-info">
			<span class="admin-sub-title">어드민 정보</span>
			<div class="div-hr"></div>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/bottom.jsp"%>