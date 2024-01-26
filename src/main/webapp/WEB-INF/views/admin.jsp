<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script>
$(function(){
	$(document).ready(function(){
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
		})
	});
});
</script>
<style>
	.main-div{
		display:flex;
		min-height: calc(107vh);
	}
	footer{
	}
	.left-div{
		display:inline-block;
		vertical-align: middle;
		width: 12.5%;
		background-color: #393E46;
		padding-top: 15px;
	}
	.scroll-div{
		position: absolute;
	    left: 12.5%;
	    height: 16%;
	    width: 1.4%;
	    top: 39%;
	    border: 1px solid;
	    border-radius: 0px 7px 7px 0px;
	    background-color: #222831;
	    border-left: red;
	}
	.set-div{
		display:flex;
		flex-direction: column;	
		flex: 1 0 auto;
	}
	.scroll-a{
		display: block;
	    width: 100%;
	    height: 100%;
	    display: flex;
    	flex-direction: column;
    	justify-content: center;
	}
	.scroll-a i{
		position:absolute;
		transform: translate3d(0, 0, 0);
  		transition: transform .4s;
	}
	.category-div{
   	 	margin-bottom: 30px;
	}
	.category-span{
		color: C9D6DF;
	    font-size: 17px;
	    padding-left: 24px;
	    padding-right: 24px;
	    opacity: 0.5;
	}
	ul{
		list-style: none;
    	margin:0px;
    	padding:0px;
	}
	.menubar{
		color: black;
		display: block;
	}
	.menu-li{
		padding-bottom: 30px;
	}
	.menu-icon{
		padding-left: 8px;
	}
	.down-fa{
	position: absolute;
    left: 10.5%;
	}
	.admin-title{
		padding: 20px 0 30 0;
		border-bottom: 1px solid rgba(0,0,0,0.4);
	}
	.admin-border{
		background-color: #E5E1DA;
		flex: 1 0 auto;
	}
	.admin-day{
		background-color: white;
	    text-align: center;
	    position: relative;
	    width: 72%;
	    height: 7%;
	    transform: translate(7%, 16%);
	    display: flex;
	}
	.admin-graph{
		background-color: white;
	    text-align: center;
	    position: relative;
	    width: 36%;
	    height: 40%;
	    transform: translate(14%, 7%);
	}
	.admin-summary{
		background-color: white;
	    text-align: center;
	    position: relative;
	    width: 35%;
	    height: 40%;
	    transform: translate(120%, -93%);
	}
	.admin-iquiry{
		background-color: white;
	    text-align: center;
	    position: relative;
	    width: 35%;
	    height: 40%;
	    transform: translate(15%, -89%);
	}
	.admin-info{
		background-color: white;
	    text-align: center;
	    position: relative;
	    width: 20%;
	    height: 48.6%;
	    transform: translate(392%, -259%);
	}
	.day-tag{
		display: inline-block;
	}
	.admin-day ul li{
		display: inline-block;
	}
	.day-div{
		display: flex;
	    flex: 1 0 auto;
	    align-items: center;
	    flex-direction: column;
	}
	.day-num{
		color: red;
	}
	.day-result{
		background-color: red;
    	padding: 0 10 0 10;
    	border-radius: 20px;
	}
	.admin-day-title{
		margin: 4px;
   		font-weight: 700;
	}
</style>
<%@include file="/WEB-INF/views/include/top.jsp"%>
<div class="main-div">
		<div class="scroll-div">
			<a class="scroll-a" href="#">
			<i class="scroll-right fa fa-angle-double-right" style="display: none;"></i>
			<i class="scroll-left fa fa-angle-double-left"></i>
			</a>
		</div>
	<div class="left-div">
		<div class="category-div">
		<ul>
			<li class="menu-li">
				<a href="#" class="menubar">
					<i class="menu-icon fa fa-box" style="opacity: 0.4;"></i>
						<span class="category-span">대쉬 보드</span>
				</a>
			</li>
			<li class="menu-li">
				<a href="#" class="menubar">
				<i class="menu-icon fa fa-box" style="opacity: 0.4;"></i>
					<span class="category-span">배송 관리</span>
				<i class="down-fa fa fa-angle-down"></i>
				</a>
			</li>
			<li class="menu-li">
				<a href="#" class="menubar">
				<i class="menu-icon fa fa-box" style="opacity: 0.4;"></i>
					<span class="category-span">상품 관리</span>
				<i class="down-fa fa fa-angle-down"></i>
				</a>
			</li>
			<li class="menu-li">
				<a href="#" class="menubar">
				<i class="menu-icon fa fa-box" style="opacity: 0.4;"></i>
					<span class="category-span">사용자 관리</span>
				<i class="down-fa fa fa-angle-down"></i>
				</a>
			</li>
		</ul>
		</div>
	</div>
	<div class="set-div">
		<div class="admin-title" style="width: 100%; text-align: center;">
			<span>관리자 페이지</span>
		</div>
		<div class="admin-border">
			<div class="admin-day">
				<div class="day-div">
					<div class="admin-day-title">
						<span>오늘 할 일</span>
						<span class="day-result">43</span>
					</div>
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
				<span>방문자 현황</span>
				<div>
  					<canvas id="myChart" width="400" height="400"></canvas>
				</div>
			</div>
			<div class="admin-summary">
				일자별 요약
			</div>
			<div class="admin-iquiry">
				문의 및 구매 평
			</div>
			<div class="admin-info">
				어드민 정보
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/bottom.jsp"%>