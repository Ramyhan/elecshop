<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		ul{
		list-style: none;
    	margin:0px;
    	padding:0px;
	}
</style>
<!-- <div class="scroll-div"> -->
<!-- 			<a class="scroll-a" href="#"> -->
<!-- 			<i class="scroll-right fa fa-angle-double-right" style="display: none;"></i> -->
<!-- 			<i class="scroll-left fa fa-angle-double-left"></i> -->
<!-- 			</a> -->
<!-- 		</div> -->
	<div class="left-div">
		<div class="category-div">
		<ul>
			<li class="menu-li">
				<a href="/admin/admin_dashboard" class="menubar">
					<i class="menu-icon fa fa-box" style="opacity: 0.4;"></i>
						<span class="category-span">대쉬 보드</span>
				</a>
			</li>
			<li class="menu-li">
				<a href="/admin/admin_order" class="menubar">
				<i class="menu-icon fa fa-box" style="opacity: 0.4;"></i>
					<span class="category-span">배송 관리</span>
				<i class="down-fa fa fa-angle-down"></i>
				</a>
			</li>
			<li class="menu-li">
				<a href="/admin/admin_product" class="menubar">
				<i class="menu-icon fa fa-box" style="opacity: 0.4;"></i>
					<span class="category-span">상품 관리</span>
				<i class="down-fa fa fa-angle-down"></i>
				</a>
			</li>
			<li class="menu-li">
				<a href="/admin/admin_user" class="menubar">
				<i class="menu-icon fa fa-box" style="opacity: 0.4;"></i>
					<span class="category-span">사용자 관리</span>
				<i class="down-fa fa fa-angle-down"></i>
				</a>
			</li>
			<li class="menu-li">
				<a href="/admin/admin_point" class="menubar">
				<i class="menu-icon fa fa-box" style="opacity: 0.4;"></i>
					<span class="category-span">포인트 관리</span>
				<i class="down-fa fa fa-angle-down"></i>
				</a>
			</li>
			<li class="menu-li">
				<a href="/admin/admin_customerCenter" class="menubar">
				<i class="menu-icon fa fa-box" style="opacity: 0.4;"></i>
					<span class="category-span">고객센터 관리</span>
				<i class="down-fa fa fa-angle-down"></i>
				</a>
			</li>
		</ul>
		</div>
	</div>