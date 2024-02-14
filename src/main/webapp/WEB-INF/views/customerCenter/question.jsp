<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/include/customerCenterTop.jsp"%>
<script>
$(function(){
	$(".card-a").click(function(){
		if($(this).attr("aria-expanded") == "true"){
			$(this).find(".question-up").css("opacity", "0%");
			$(this).find(".question-down").css("opacity", "100%");
		}else{
			$(this).find(".question-up").css("opacity", "100%");
			$(this).find(".question-down").css("opacity", "0%");
		}
	});
	
});
</script>
<style>
body{
	background-color: white;
}
	.clearfix li{
		float: left;
		list-style: none;
		margin: 10px;	
	}
	.question_tab_list li a {
    display: inline-block;
    width: 102px;
    height: 115px;
    background: #fff;
    border: 1px solid #D8D8D8;
    border-radius: 2px;
    text-align: center;
}
 .question_tab_list li a:hover, .question_tab_list li a:focus, .question_tab_list li.on a { 
    border: 1px solid #1C8FED; 
    color: #1C8FED;
 } 
.question_tab_list li a 
	.question_tab_list li a .icon_wrap {
    margin: 15px auto 0;
    display: inline-block;
}
.question_tab_list li a .icon_wrap .icon {
    display: block;
    width: 48px;
    height: 48px;
    margin: 0 auto;
    background-position: 100% 0;
}
.clearfix a{
	color: black;
}

.link_title{
	font-family:fantasy;
	font-weight: 800;
}
.card:hover{
	transform:translateY(0px);
}
.card{
	border-radius: 16px;
	border:0px;
	background-color: white;
	width: 100%;
	height: 100%;
}
.card-body{
	border-bottom: 2px solid;
	background-color: white;
	color: gray;
	border-top: 0px;
}
.clearfix li a{
	background-color: white;
}
.card-header:first-child{
	background-color: white;
    border-radius: 0;
}
.card-header:first-child a{
	color: black;
}
.card-header a{
	display: block;
	width: auto;
}
.card-span{
	top: 9px;
	left: 50px;
}
.question-up,.question-down{
	position: absolute;
	left: 97.5%;
}
.question-up{
	opacity: 0;
}

</style>
<script>
$(function(){
	
})
</script>
<div class="question_tab_list" style="padding-top: 33px;">
	<div class="d-flex justify-content-center">
		<ul class="clearfix">
			<li class="on">
				<a href="#">
					<em class="icon_wrap all">
						<span class="icon" style="background:url(/resources/css/dongyeong/images/mark-48.png);background-repeat: no-repeat;"></span>
						<span class="link_title">전체</span>	
					</em>
				</a>
			</li>								
			<li id="CategoryNo_20" class="">
				<a href="#">
					<em class="icon_wrap">
						<span class="icon" style="background-image:url(/resources/css/dongyeong/images/product-48.png);background-repeat: no-repeat;"></span>
						<span class="link_title">상품</span>					
					</em>
				</a>
			</li>					
			<li id="CategoryNo_21" class="">
				<a href="#">
					<em class="icon_wrap">
						<span class="icon" style="background-image:url(//image2.compuzone.co.kr/img/faqCategory/21/faq_PCImg_21.png);background-repeat: no-repeat;"></span>
						<span class="link_title">주문/결제</span>					
					</em>
				</a>
			</li>					
			<li id="CategoryNo_22" class="">
				<a href="#">
					<em class="icon_wrap">
						<span class="icon" style="background-image:url(/resources/css/dongyeong/images/delivery-48.png);background-repeat: no-repeat;"></span>
						<span class="link_title">배송</span>					
					</em>
				</a>
			</li>					
			<li id="CategoryNo_23" class="">
				<a href="#">
					<em class="icon_wrap">
						<span class="icon" style="background-image:url(/resources/css/dongyeong/images/shipping-48.png);background-repeat: no-repeat;"></span>
						<span class="link_title">반품/교환/환불</span>					
					</em>
				</a>
			</li>					
			<li id="CategoryNo_24" class="">
				<a href="#">
					<em class="icon_wrap">
						<span class="icon" style="background-image:url(/resources/css/dongyeong/images/point-48.png);background-repeat: no-repeat;"></span>
						<span class="link_title">이벤트/적립금</span>					
					</em>
				</a>
			</li>					
			<li id="CategoryNo_91" class="">
				<a href="#">
					<em class="icon_wrap">
						<span class="icon" style="background-image:url(/resources/css/dongyeong/images/gear-48.png);background-repeat: no-repeat;"></span>
						<span class="link_title">A/S</span>					
					</em>
				</a>
			</li>					
			<li id="CategoryNo_25" class="">
				<a href="#">
					<em class="icon_wrap">
						<span class="icon" style="background-image:url(/resources/css/dongyeong/images/user-48.png);background-repeat: no-repeat;"></span>
						<span class="link_title">회원</span>					
					</em>
				</a>
			</li>					
			<li id="CategoryNo_105" class="">
				<a href="#">
					<em class="icon_wrap">
						<span class="icon" style="background-image:url(/resources/css/dongyeong/images/etc-48.png);background-repeat: no-repeat;"></span>
						<span class="link_title">기타</span>					
					</em>
				</a>
			</li>					
		</ul>
	</div>
	<div class="container-fluid">
		<div class="row" style="margin-bottom: 50px;">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
				<div style="background-color: black; height: 2px;"></div>
				<div id="card-203733">
					<c:forEach var="question" items="${questionList}">
						<div class="card">
							<div class="card-header">
								 <a data-qno="${question.qno}" class="card-a card-link collapsed" data-toggle="collapse" data-parent="#card-203733" href="#card-element-${question.qno}">
								 <i class="fa fa-question-circle"></i>
								 <span class="card-span" data-qcategory="${question.qcategory}" data-qsubcategory="${question.qsubcategory}">
								 	${question.qtitle}
								 </span>
								 <i class="question-down fa fa-angle-down"></i>
								  <i class="question-up fa fa-angle-up"></i>
								 </a>
							</div>
							<div id="card-element-${question.qno}" class="collapse">
								<div class="card-body">
									${question.qcontent}
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-2">
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>