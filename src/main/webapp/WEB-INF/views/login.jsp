<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<div class="container-fluid login">
<div class="login-ui" style=" background-color: #202020; 
border: solid 1px #FFD369; border-radius: 15px;">
	<h3 style="text-align: center; margin-top: 20px">로그인</h3>
	<div class="row" style="margin: 110px; ">
		<div class="col-md-12">
			<form role="form">
				<div class="form-group">
					<label for="id">
						아이디
					</label>
					<input type="text" class="form-control" id="id" name="id" />
				</div>
				<div class="form-group">
					 
					<label for="pw">
						비밀번호
					</label>
					<input type="password" class="form-control" id="pw" name="pw" />
				</div>
				<button type="submit" class="btn btn-warning">
					로그인
				</button>
			</form>
		</div>
	</div>
</div>
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>