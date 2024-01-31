<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.set-div{
		background-color: grey;
	}
	.user-div{
		display: flex;
		align-items: center;
		flex-direction: column;
	}
	.user-input{
		font-size: small;
		width: 90;
	}
	.user-table div{
		padding: 30 30 30 30;
		border: 1px solid;
	}
	.user-table{
		display: flex;
		justify-content: space-around;
		border-bottom: 1px solid;
	}
</style>
<div>
	<span>유저 관리</span>
</div>
<div class="user-div" style="width: 100%; height: 100%;">
	<div style="width: 70%; height: 15%;  background-color: white;">
		<div>
			<span style="font-weight: 900">유저 관리 도구</span>
		</div>
		<div>
			<input class="user-input" type="text" placeholder="Search">
		</div>
	</div>
	<div style="width: 85%; height: 70%; background-color: white;">
		<div class ="user-table">
			<div>
				<span>유저 번호</span>
			</div>
			<div>
				<span>이름</span>
			</div>
			<div>
				<span>아이디</span>
			</div>
			<div>
				<span>이메일</span>
			</div>
			<div>
				<span>주소</span>
			</div>
			<div>
				<span>연락처</span>
			</div>
			<div>
				<span>포인트</span>
			</div>
		</div>
		<div>
			
		</div>
	</div>
</div>