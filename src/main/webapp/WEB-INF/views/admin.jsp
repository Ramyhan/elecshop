<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.main-admin-div{
		min-height: calc(30vh);
	}
	footer{
	}
	.left-div{
		display:inline-block;
		vertical-align: middle;
		height: 80%;
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
	.scroll-a{
		display: block;
	    width: 100%;
	    height: 100%;
	    display: flex;
    	flex-direction: column;
    	justify-content: center;
	}
	.category-div{
		display: flex;
   	 	justify-content: space-around;
   	 	align-items: center;
   	 	margin-bottom: 30px;
	}
	.category-p{
		color: C9D6DF;
		font-size: 14px;
	}
	
</style>
<%@include file="/WEB-INF/views/include/top.jsp"%>

<div class="main-admin-div">
	<div class="left-div">
		<div class="scroll-div">
			<a class="scroll-a" href="#"><i class="fa fa-angle-double-right"></i></a>
		</div>
		<div class="category-div">
			<i class="fa fa-box" style="opacity: 0.4;"></i>
			<span class="category-p">상품관리</span>
			<i class="fa fa-angle-down"></i>
		</div>
		<div class="category-div">
			<i class="fa fa-box" style="opacity: 0.4;"></i>
			<a href="#"><span class="category-p">상품관리</span></a>
			<i class="fa fa-angle-down"></i>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/bottom.jsp"%>