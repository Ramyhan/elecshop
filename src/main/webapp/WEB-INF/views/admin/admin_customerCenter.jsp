<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
 .set-div{
 	background-color: grey;
 }
 .container-div{
 	width: 90%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
 }
 .now-title{
 	display: flex;
    margin: 30 30 0 30;
    flex-direction: row;
    align-items: baseline;
    justify-content: space-between;
 }
</style>
<script>
$(function(){
	//전체 선택/해제
	$(".notice-check-all").change(function(){
		var checked = $(this).prop("checked");
		$(".notice-checkbox").prop("checked", checked);
	});
	//비공개 버튼
	$(".btn-close").on("click",function(){
		var nno = $(".notice-checkbox:checked");
		var checked_nnos =[];
		console.log(nno);
		nno.each(function(){
			var state = $(this).parent().siblings(".td-state").attr("data-state")
			if(state == "true"){
			var nno_num = $(this).attr("data-nno");
			checked_nnos.push(parseInt(nno_num));
			}
		});
		var sdata ={
				"nnos" : checked_nnos
		}
		if(checked_nnos != ""){
			$.post("/admin/updateCloseState",sdata,function(rdata){
				console.log("rdata", rdata);
				if(rdata == true){
					nno.each(function(i){
						var state = $(this).closest("tr").find(".td-state").text().trim();
						if(state == "공개"){
							var qwe = $(this).closest("tr").find(".td-state");
							ssz = qwe.attr("data-state", "false");
							console.log("ssz", ssz);
							$(this).closest("tr").find(".td-state").text("비공개");
						}
					});
				}
			});
		}
// 		var stxt = nno.closest("tr").find(".td-state");
// 		stxt.text("비공개");
// 		console.log("s1s1", stxt);
	});
	//공개버튼
	$(".btn-open").on("click",function(){
		var nno = $(".notice-checkbox:checked");
		var checked_nnos =[];
		console.log(nno);
		nno.each(function(){
			var state = $(this).parent().siblings(".td-state").attr("data-state")
			if(state == "false"){
			var nno_num = $(this).attr("data-nno");
			checked_nnos.push(parseInt(nno_num));
			}
		});
		var sdata ={
				"nnos" : checked_nnos
		}
		console.log("checked_nnos",	checked_nnos);
		if(checked_nnos != ""){
			$.post("/admin/updateOpenState",sdata,function(rdata){
				console.log("rdata", rdata);
				if(rdata == true){
					nno.each(function(i){
						var state = $(this).closest("tr").find(".td-state").text().trim();
						console.log("ss",state);
						if(state == "비공개"){
							var td = $(this).closest("tr").find(".td-state");
							tdData = td.attr("data-state", "true");
							console.log("tdData", tdData);
							$(this).closest("tr").find(".td-state").text("공개");
						}
					});
				}
			});
		}
	});
	//삭제 버튼
	$(".btn-delete").click(function(){
		var nno = $(".notice-checkbox:checked");
		var checked_nnos =[];
		console.log(nno);
		nno.each(function(){
			var nno_num = $(this).attr("data-nno");
			checked_nnos.push(parseInt(nno_num));
		});
		var sdata = {
				"nnos" : checked_nnos
		}
		$.post("/admin/deleteNotice",sdata,function(rdata){
			if(rdata >= 1){
				nno.each(function(){
					$(this).closest("tr").fadeOut(1500);
				});
			}
		})
	});
	$(".btn-register").click(function(){
		$.ajax({
			type :"post",
			url : "/admin/notice/register",
			success : function(rdata){
				$(".set-div").empty();
				$(".set-div").append(rdata);
			},
			error : function(){
				alret("페이지 이동이 불가합니다");
			}
		})
	});
	//검색버튼
	$(".search-btn").on("click",function(){
		var select = $(".select-box").val();
		var searchBar = $(".sb").val();
		if(searchBar.trim() == "공개"){
			searchBar = "true";
		}else if(searchBar.trim() == "비공개"){
			searchBar = "false";
		}
		sData = {
				"select" : select,
				"word" : searchBar
		}
		if(searchBar != ""){
			$.post("/admin/searchWord",sData,function(rData){
				$(".tbltbody").empty();
				$(".tbltbody").append(rData);
			});
		}
	});
	function formatDate(date) {
	    
	    var d = new Date(date),
	    
	    month = '' + (d.getMonth() + 1) , 
	    day = '' + d.getDate(), 
	    year = d.getFullYear();
	    
	    if (month.length < 2) month = '0' + month; 
	    if (day.length < 2) day = '0' + day; 
	    
	    return [year, month, day].join('-');
	    
	    }

});
</script>
<div class="Center-div-title" style="text-align: center;">
	<span>공지사항 관리</span>
</div>
<div>
	<div class="container-div">
		<div class="now-title">
		<div>
			<span style="font-size: 30px; font-weight: 900;">현재 공지 내용</span>
			<button type="button" class="btn-register">공지 추가</button>
			<button type="button" class="btn-delete">공지 삭제</button>
			<button type="button" class="btn-open">공개 처리</button>
			<button type="button" class="btn-close">비공개 처리</button>
		</div>
			<nav class="navbar-light">
			  <form class="form-inline">
			  	<select class="select-box" style="height: 40px;">
			  		<option value="n">고유번호</option>
			  		<option value="t">제목</option>
			  		<option value="c">카테고리</option>
			  		<option value="d">날짜</option>
			  		<option value="s">상태</option>
			  	</select>
			    <input class="sb form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			    <button class="search-btn btn btn-outline-success my-2 my-sm-0" type="button">검색</button>
			  </form>
			</nav>
		</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr style="text-align: center;">
						<th>
							<input type="checkbox" class="notice-check-all">
						</th>
						<th>
							고유번호
						</th>
						<th>
							카테고리
						</th>
						<th>
							공지제목
						</th>
						<th>
							공지 날짜
						</th>
						<th>
							상태
						</th>
					</tr>
				</thead>
				<tbody class="tbltbody">
				<c:forEach var="adminNotice" items="${subNotice}">
						<tr class="tbltr" style="text-align: center;">
							<td>
								<input type="checkbox" class="notice-checkbox" data-nno="${adminNotice.nno}">
							</td>
							<td>
								${adminNotice.nno}
							</td>
							<td>
								${adminNotice.ncategory}
							</td>
							<td>
								${adminNotice.ntitle}
							</td>
							<td>
								<fmt:formatDate value="${adminNotice.nregdate}"/>
							</td>
							<td class="td-state" data-state="${adminNotice.nstate }">
							<c:choose>
								<c:when test="${adminNotice.nstate == 'false'}">비공개</c:when>
								<c:otherwise>공개</c:otherwise>
							</c:choose>
							</td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>