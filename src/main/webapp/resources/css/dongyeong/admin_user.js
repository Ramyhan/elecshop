$(function(){
	$(".user-chkboxAll").change(function(){
		var checked = $(this).prop("checked");
		$(".user-chkbox").prop("checked", checked);
	});
	$(".page-num").on("click",function(e){
		console.log(this);
		e.preventDefault();
		var pageNum = $(this).attr("href");
		console.log(pageNum);
		console.log("g",'${page.endPage}');
		sData = {
			"pageNum" : pageNum	
		}
		$.get("/admin/admin_user", sData, function(rData){
			
				$(".user-div").empty();
				$(".user-div").html(rData);
			
		});
	});
	$(".user-create").on("click",function(){
		$(".create-modal").modal("show");
	});
	$(document).on("click",".btn-create",function(){
		var tname = $("#test-name").val();
		var tid = $("#test-id").val();
		var tpw = $("#test-pw").val();
		var taddr = $("#test-addr").val();
		var tdetail = $("#test-addr-detail").val();
		var tbir = $("#test-bir").val();
		var tstate = $(".state:checked").val();
		var tphone = $("#test-phone").val();
		var memail = $("#test-email").val();
		
		sData = {
				mname : tname,
				mid : tid,
				mpw : tpw,
				maddr : taddr,
				maddr_detail : tdetail,
				mbirthday : tbir,
				mstate : tstate,
				mphone : tphone,
				memail : memail
		}
		
		$.get("/admin/create_user",sData,function(rData){
			console.log("44",rData)
		});
	});
});