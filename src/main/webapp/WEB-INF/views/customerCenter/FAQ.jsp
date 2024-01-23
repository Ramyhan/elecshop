<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/customerCenterTop.jsp"%>
<style>
body{
 	background-color: white;
}
.faq-card{ 
  	display: block; 
} 
.card-link{ 
  	display: flex; 
  	justify-content: space-between; 
}
a{
	color: black;
}
i{
	margin-top: 5px;
}
</style>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12" style="margin-top: 4px;">
					<div class="row">
						<div class="col-md-2">
						</div>
						<div class="col-md-4">
							<table class="table">
								<thead>
									<tr>
										<th>공지사항</th>
										<th></th>
										<th style="text-align: right;"><a href="#">더보기</a></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>번호</td>
										<td>제목</td>
										<td style="text-align: right;">01/04/2012</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-4">
							<table class="table">
								<thead>
									<tr>
									<th>나의 문의 내역</th>
									<th></th>
									<th></th>
									<th style="text-align: right;"><a href="#">더보기</a></th>
								</tr>
								</thead>
								<tbody>
									<tr>
									<td>1</td>
									<td>살려주세요 너무 어려워요</td>
									<td></td>
									<td style="text-align: right;">01/04/2012</td>
								</tr>
								</tbody>
							</table>
						</div>
						<div class="col-md-2">
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- 질문카드 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<div class="d-flex justify-content-between">
					<h3 style="font">자주 묻는 질문 리스트</h3>
					<a href="#">더보기</a>
					</div>	
					<hr style="border: solid;">
					<div id="card-51726" >
						<div class="faq-card">
							<div class="card-header">
								 <a class="question card-link" data-toggle="collapse" data-parent="#card-51726" href="#question1">
								  <i class="fa fa-question-circle"></i>
								 <span style="width:100%; margin-left:9px">question1</span>
								 <i class="fa fa-angle-down"></i>
								 </a>
							</div>
							<div id="question1" class="collapse">
								<div class="card-body">
									Anim pariatur cliche...
								</div>
							</div>
						</div>
						<div class="faq-card">
							<div class="card-header">
								 <a class="question card-link" data-toggle="collapse" data-parent="#question2" href="#question2">
								 <i class="fa fa-question-circle"></i>
								 <span style="width:100%; margin-left:9px">question2</span>
								 <i class="fa fa-angle-down"></i>
								 </a>
							</div>
							<div id="question2" class="collapse">
								<div class="card-body">
									Anim pariatur cliche...
								</div>
							</div>
						</div>
						<div class="faq-card">
							<div class="card-header">
								 <a class="question card-link" data-toggle="collapse" data-parent="#card-51726" href="#question3">
								 <i class="fa fa-question-circle"></i>
								 <span style="width:100%; margin-left:9px">question3</span>
								 <i class="fa fa-angle-down"></i>
								 </a>
							</div>
							<div id="question3" class="collapse">
								<div class="card-body">
									Anim pariatur cliche...
								</div>
							</div>
						</div>
						<div class="faq-card">
							<div class="card-header">
								 <a class="question card-link" data-toggle="collapse" data-parent="#card-51726" href="#question4">
								 <i class="fa fa-question-circle"></i>
								 <span style="width:100%; margin-left:9px">question4</span>
								 <i class="fa fa-angle-down"></i>
								 </a>
							</div>
							<div id="question4" class="collapse">
								<div class="card-body">
									Anim pariatur cliche...
								</div>
							</div>
						</div>
						<div class="faq-card">
							<div class="card-header">
								 <a class="question card-link" data-toggle="collapse" data-parent="#card-51726" href="#question5">
								 <i class="fa fa-question-circle"></i>
								 <span style="width:100%; margin-left:9px">question5</span>
								 <i class="fa fa-angle-down"></i>
								 </a>
							</div>
							<div id="question5" class="collapse">
								<div class="card-body">
									Anim pariatur cliche...
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- //질문카드 -->
				<div class="col-md-2">
				
				</div>
			</div>
		</div>
</body>
</html>