<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.set-div{
		background-color: F6F6F6;
	}
	.user-div{
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.user-table{
		display: table;
		width: 97%;
		height: auto;
		
	}
	.user-tbl-header{
		display: table-row;
	    font-weight: bold;
	    text-align: center;
	    
	}
	.header-cell{
       display: table-cell;
	   border-width: thin;
	   padding: 15 15 15 15;
	   background-color: beige;
	   border-right: 2px solid rgb(255,255,255);
	}
	.user-input{
		font-size: small;
		width: 90;
	}
	.user-div-row{
		display: table-row;
		text-align: center;
	}
	.cell {
    display: table-cell;
    border-width: thin;
    padding: 15 15 15 15;
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
	}
	.second-div{
		width: 95%;
	    height: 100%;
	    background-color: white;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	}
	.user-tbl-header div span{
		opacity: 0.5;
	}
</style>
<div>
	<span>유저 관리</span>
</div>
<div class="user-div" style="width: 100%; height: 100%;">
	<div style="width: 95%; height: 15%;  background-color: white;">
		<div>
			<span style="font-weight: 900">유저 관리 도구</span>
		</div>
		<div>
			<input class="user-input" type="text" placeholder="Search">
		</div>
	</div>
	<div class="second-div" style="background-color: white;" >
		<div class ="user-table">
			<div class="user-tbl-header">
				<div class="header-cell" style="opacity: 1">
					<input type="checkbox">
				</div>
				<div class="header-cell">
					<span>#</span>
				</div>
				<div class="header-cell">
					<span>이름</span>
				</div>
				<div class="header-cell">
					<span>아이디</span>
				</div>
				<div class="header-cell">
					<span>이메일</span>
				</div>
				<div class="header-cell">
					<span>주소</span>
				</div>
				<div class="header-cell">
					<span>연락처</span>
				</div>
				<div class="header-cell">
					<span>포인트</span>
				</div>
			</div>
			<div class="user-div-row">
				<div class="cell">
					<input type="checkbox">
				</div>
				<div class="cell">
					<span>##</span>
				</div>
				<div class="cell">
					<span>이름</span>
				</div>
				<div class="cell">
					<span>아이이ㅣ이ㅣ잉디</span>
				</div>
				<div class="cell">
					<span>이미미미메메메메메밀</span>
				</div>
				<div class="cell">
					<span>주저즈즈즈ㅜ주소</span>
				</div>
				<div class="cell">
					<span>연띾ㄲㄲㄲ처</span>
				</div>
				<div class="cell">
					<span>포인트</span>
				</div>
			</div>
		</div>
	</div>
</div>