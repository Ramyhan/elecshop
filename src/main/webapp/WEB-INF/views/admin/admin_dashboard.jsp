<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<link href="/resources/css/dongyeong/table.css" rel="stylesheet" />
<link href="/resources/css/dongyeong/admin.css" rel="stylesheet" />
<style>
	.summary-table {
		border-collapse: inherit;
	}
	
 	.admin-iquiry { 
 		width: 583px; 
 		height: 428px;
 		bottom: 40px;
 	}
</style>
<script>
$(function() {
	// 문의내용 확인 모달
	$(".aIquiry").click(function(e) {
		e.preventDefault();

		var ino = $(this).attr("data-ino");
		
		$.get("/iquiry/get/" + ino, function(rData) {
			console.log("rData: ", rData);
			$("#modal-title").val(rData.ititle);
			$("#mid").val(rData.mid);
			$("#ititle").val(rData.ititle);
			$("#imessage").val(rData.imessage);
			$(".btnReply").attr("data-ino", ino);
			$("#modal-iquiry").modal("show");
		});
	});
	
	// 문의내용 답장
	$(".btnReply").click(function() {
		var that = $(this);
		var ino = $(this).attr("data-ino");
		var ireply = $("#ireply").val();
		var sData = {
				"ino" : ino,
				"ireply" : ireply
		}
		
		$.ajax({
			"method" : "put",
			"url" : "/iquiry/reply",
			"data" : JSON.stringify(sData),
			"contentType" : "application/json",
			"success" : function(rData) {
				console.log("rData: ", rData);
				if (rData == "true") {
					var target = $("#btn" + ino).parent().parent();
					console.log("target: ", target);
					$("#modal-iquiry").modal("hide");
					target.fadeOut(1000);
				}
			}
		});
	});
	
	// 문의 내용 삭제
	$(".btnRemove").click(function() {
		var that = $(this);
		var rno = $(this).attr("data-ino");
		$.ajax({
			"method" : "delete",
			"url" : "/iquiry/" + rno,
			"success" : function(rData) {
				if (rData == "true") {
					var deleteTarget = that.parent().parent();
					deleteTarget.fadeOut(1000);
				}
			}
		});
	});
});
</script>
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
							<span>문의</span>
							<span class="day-num">2</span>
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
  					<script>
						var chartArea = document.getElementById('myChart').getContext('2d');
						//차트를 생성한다. 
						var myChart = new Chart(chartArea, {
						 // ①차트의 종류(String)
						 type: 'bar',
						 // ②차트의 데이터(Object)
						 data: {
						     // ③x축에 들어갈 이름들(Array)
						     labels: ['${chartVO[0].vdate}',
						     		 '${chartVO[1].vdate}',
						     		 '${chartVO[2].vdate}',
						     		 '${chartVO[3].vdate}',
						     		 '${chartVO[4].vdate}',
						     		 '${chartVO[5].vdate}'],
						     // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
						     datasets: [{
						         // ⑤dataset의 이름(String)
						         label: '# of Votes',
						         // ⑥dataset값(Array)
						         data: [${chartVO[0].vcount},
						        	    ${chartVO[1].vcount},
						        	    ${chartVO[2].vcount},
						        	    ${chartVO[3].vcount},
						        	    ${chartVO[4].vcount},
						        	    ${chartVO[5].vcount}],
						         // ⑦dataset의 배경색(rgba값을 String으로 표현)
						         backgroundColor: 'rgba(255, 99, 132, 0.2)',
						         // ⑧dataset의 선 색(rgba값을 String으로 표현)
						         borderColor: 'rgba(255, 99, 132, 1)',
						         // ⑨dataset의 선 두께(Number)
						         borderWidth: 1
						     }]
						 },
						 // ⑩차트의 설정(Object)
						 options: {
						     // ⑪축에 관한 설정(Object)
						     responsive:false,
						     scales: {
						         // ⑫y축에 대한 설정(Object)
						         y: {
						             // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
						             beginAtZero: true
						         }
						     }
						 }
						});

				</script>
<!--   					<script src="/resources/css/dongyeong/chart.js"></script> -->
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
					  <c:forEach items="${dayInfoList}" var="dayInfoDTO">
					  	<tr>
					      <td>${dayInfoDTO.vdate}</td>
					      <td>${dayInfoDTO.order_count}</td>
					      <td>${dayInfoDTO.vcount}</td>
					      <td>${dayInfoDTO.total_price}</td>
					      <td>${dayInfoDTO.join_count}</td>
					    </tr>
					  </c:forEach>
					  </tbody>
					</table>
				</div>
			</div>
			<div class="admin-iquiry">
				<div class="admin-sub-title">
					<span>문의 관리</span>
				</div>
				<div class="div-hr"></div>
				<div class="iquiry-div">
				<c:forEach items="${iquiryList}" var="iquiryVO">
					<div class="iquiry-message">
						<a href="#" data-ino="${iquiryVO.ino}" class="aIquiry">
						<span>[문의]</span>
						<span class="iquiry-first">${iquiryVO.ititle}</span>
						</a>
						<div>
							<span class="iquiry-second-name">${iquiryVO.mid}</span>
							<span class="iquiry-second-date"><fmt:formatDate value="${iquiryVO.iregdate}" pattern="yy-MM-dd"/></span>
						<button type="button" class="btn btn-secondary btnRemove" id="btn${iquiryVO.ino}" data-ino="${iquiryVO.ino}">삭제</button>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
			<div class="admin-notice">
				<div class="admin-sub-title">
					<span>공지사항 관리</span>
				</div>
				<div class="div-hr"></div>
				<div class="iquiry-div">
				<c:forEach items="${noticeList}" var="noticeVO">
					<div class="iquiry-message">
						<a href="/customerCenter/noticePage?nno=${noticeVO.nno}" data-ino="${noticeVO.nno}" class="aNotice">
						<span>[공지사항]</span>
						<span class="iquiry-first">${noticeVO.ntitle}</span>
						</a>
						<div>
							<span class="notice-second-date"><fmt:formatDate value="${noticeVO.nregdate}" pattern="yy-MM-dd"/></span>
						<button type="button" class="btn btn-secondary btnRemove" id="btn${noticeVO.nno}" data-ino="${noticeVO.nno}">삭제</button>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
<!-- 			<div class="admin-info"> -->
<!-- 			<span class="admin-sub-title">어드민 정보</span> -->
<!-- 			<div class="div-hr"></div> -->
<!-- 			</div> -->
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="modal-iquiry" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content iquiryModal">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							문의 내용 답장
						</h5> 
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="ititle">
								제목
							</label>
							<input type="text" class="form-control" id="ititle" readonly/>
						</div>
						<div class="form-group">
							<label for="imessage">
								작성자
							</label>
							<input type="text" class="form-control imessage" id="mid" readonly></input>
						</div>
						<div class="form-group">
							<label for="imessage">
								내용
							</label>
							<textarea class="form-control imessage" id="imessage" readonly></textarea>
						</div>
						<div class="form-group">
							<label for="ireply">
								답장
							</label>
							<textarea class="form-control" id="ireply" required></textarea>
						</div>
					</div>
					<div class="modal-footer">
						 
						<button type="button" class="btn btn-primary btnReply" data-ino="">
							답장하기
						</button> 
						<button type="button" class="btn btn-secondary" data-dismiss="modal">
							닫기
						</button>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>
</div>

<%@include file="/WEB-INF/views/include/bottom.jsp"%>