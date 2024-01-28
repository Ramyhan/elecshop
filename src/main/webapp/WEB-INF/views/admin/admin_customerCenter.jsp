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
							$(this).closest("tr").find(".td-state").attr("data-nno", "false");
							$(this).closest("tr").find(".td-state").text("비공개");
						}
					});
				}
			});
		}
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
		if(checked_nnos != ""){
			$.post("/admin/updateOpenState",sdata,function(rdata){
				console.log("rdata", rdata);
				if(rdata == true){
					nno.each(function(i){
						var state = $(this).closest("tr").find(".td-state").text().trim();
						console.log("ss",state);
						if(state == "비공개"){
							$(this).closest("tr").find(".td-state").attr("data-nno", "true");
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
			<button type="button" >공지 추가</button>
			<button type="button" class="btn-delete">공지 삭제</button>
			<button type="button" class="btn-open">공개 처리</button>
			<button type="button" class="btn-close">비공개 처리</button>
		</div>
			<nav class="navbar-light">
			  <form class="form-inline">
			  	<select style="height: 40px;">
			  		<option>고유번호</option>
			  		<option>제목</option>
			  		<option>카테고리</option>
			  		<option>내용</option>
			  		<option>날짜</option>
			  	</select>
			    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
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
							공지내용
						</th>
						<th>
							공지 날짜
						</th>
						<th>
							상태
						</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="adminNotice" items="${subNotice}">
						<tr style="text-align: center;">
							<td>
								<input type="checkbox" class="notice-checkbox" data-nno="${adminNotice.nno}">
							</td>
							<td>
								${adminNotice.nno}
							</td>
							<td>
								${adminNotice.ncategory }
							</td>
							<td>
								${adminNotice.ncontent}
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