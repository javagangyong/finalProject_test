<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	section {
		height: 1000px;
		padding-top: 95px;
	}
	div.container {
		display: flex;
		gap: 50px;
		height: 100%;
	}
	.bar {
		flex: 1;
		border: 1px solid black;
	}
	.mainContent {
		flex: 5;
		border: 1px solid black;
	}
	div.asideTitle {
		font-weight: bold;
		font-size: 20px;
		text-align: center;
	}
	div.item {
		margin-top: 13px;
		display: flex;
		justify-content: center;
	}
	div.item:hover {
		cursor: pointer;
		transform: translateY(-2px);
	}
	div.item.selected {
		font-weight: bold;
		color: #FD2B75;
	}
	div.picture {
		width: 400px;
		height: 300px;
		background-position: center;
		background-size: 100%;
	}
	.mypageString {
		font-size: 14px;
		color: #6699CC;
		margin-bottom: 0px;
	}
	div.mypageBox {
		width: 400px;
		height: 50px;
		border: 1px solid #4E5154;
		display: flex;
		align-items: center;
	}
	
</style>

<section>

<div class="container">
	<aside class="bar">
		<div class="asideTitle">마이페이지</div>	
		<div class="item" id="myProfile">내 프로필</div>	
		<div class="item" id="infoUpdate">내 정보 수정</div>	
		<div class="item">스펙 수정</div>	
	</aside>
	
	<div class="mainContent"></div>
</div>

</section>


<script>
	const joinDate = '${login.joinDate}';
	const lastLoginDate = '${login.lastLoginDate}';

	const myProfile = document.getElementById('myProfile');
	
	myProfile.addEventListener('click', async (event) => {
		
		const items = document.querySelectorAll('.item');
		items.forEach(e => e.classList.remove('selected'));
		event.target.classList.add('selected')
		
		const mainContent = document.querySelector('.mainContent');
		const url = cpath + '/testMemberAjax/myProfile/' + user;
		const info = await fetch(url).then(resp => resp.json());
		let tag = '';
		tag += '<h1 align="center">내 프로필</h1>';
		tag += '<h2>프로필 사진</h2>';
		tag += '<div class="picture" style="background-image: url(\'' + cpath + '/upload/' + info.profile + '\')"></div>';
		tag += '<p class="mypageString">이름</p>';
		tag += '<div class="mypageBox">' + info.username + '</div>';
		tag += '<p class="mypageString">등급</p>';
		tag += '<div class="mypageBox">' + info.grade + '</div>';
		tag += '<p class="mypageString">아이디</p>';
		tag += '<div class="mypageBox">' + info.userid + '</div>';
		tag += '<p>가입한 날짜 : ' + joinDate + '</p>';
		tag += '<p>최근 접속 한 날짜 : ' + lastLoginDate + '</p>';
// 		tag += '';
		mainContent.innerHTML = tag;
		
	})
	
	const infoUpdate = document.getElementById('infoUpdate');
	
	infoUpdate.addEventListener('click', async (event) => {
		
		const items = document.querySelectorAll('.item');
		items.forEach(e => e.classList.remove('selected'));
		event.target.classList.add('selected')
		
		const mainContent = document.querySelector('.mainContent');
		
		
	})
	
	// 마이페이지 들어왔을때 마이프로필이 뜨도록
	myProfile.dispatchEvent(new Event('click'));
	
	
	
	
</script>