<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
	$(".menubar").click(function(e){
		e.preventDefault();
		console.log("this",this);
		var url = $(this).attr("href");
		console.log("href",url);
		var type = "post";
		if(url == "/admin/admin_dashboard"){
			type = "get";
		}
		$.ajax({
			type : type,
			url: url,
			success:function(rdata){
				if(type == "get"){
					$("body").empty();
					$("body").append(rdata);
					console.log(rdata);
				}else{
					
					$(".set-div").empty();
					$(".set-div").append(rdata);
				}
				
			}
		});
	});
});
</script>
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
				<a href="/admin/admin_dashboard" class="menubar">
					<i class="menu-icon fa fa-box" style="opacity: 0.4;"></i>
						<span class="category-span">대쉬 보드</span>
				</a>
			</li>
			<li class="menu-li">
				<a href="/admin/admin_delivery" class="menubar">
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
				<a href="/admin/admin_customerCenter" class="menubar">
				<i class="menu-icon fa fa-box" style="opacity: 0.4;"></i>
					<span class="category-span">고객센터 관리</span>
				<i class="down-fa fa fa-angle-down"></i>
				</a>
			</li>
		</ul>
		</div>
	</div>