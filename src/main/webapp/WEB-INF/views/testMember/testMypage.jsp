<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	section {
		height: 1000px;
		padding-top: 95px;
	}
	button {
	  background: none;     /* 배경색 투명하게 */
	  border: none;         /* 테두리 없애기 */
	  padding: 0;           /* 기본 여백 없애기 */
	  font: inherit;        /* 부모 글꼴 스타일 그대로 물려받기 */
	  cursor: pointer;      /* 마우스 올렸을 때 손가락 모양으로 바꾸기 (★중요) */
	  outline: none;        /* 클릭했을 때 생기는 파란 테두리 제거 */
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
	div.boxMargin {
		margin-bottom: 15px;
	}
	input[type="radio"] {
		display: none;
	}
	label {
		display: flex;
		justify-content: center;
		align-items: center;
		cursor: pointer;
		border: 1px solid #ccc;
		width: 195px;
		height: 35px;
		margin-right: 8px;
	}
	div.flexBox {
		display: flex;
	}
	label:has(input[type="radio"]:checked) {
		background-color: #4A90E2;
		color: #FFFFFF;
	}
	.textBox {
		display: block;
		width: 400px;
		height: 50px;
		border: 1px solid #ccc;
		padding: 0;
		margin-bottom: 15px;
	}
	select {
		display: block;
		border: 1px solid #ccc;
		width: 127px;
		height: 40px;
		margin: 15px 10px 15px 0;
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
	const birthYear = '${login.birthYear}';
	const birthMonth = '${login.birthMonth}';
	const birthDay = '${login.birthDay}';

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
		
		let tag = '';
		tag += '<h1>회원 정보 수정</h1>';
		tag += '<form id="infoForm">'
		tag += '	<input type="text" class="textBox" value="'+ user +'">';
		tag += '	<input type="text" class="textBox" value="'+ username +'">';
		tag += '	<div class="flexBox">'
		tag += '		<label><input type="radio" name="gender" ' + (gender == '남성' ? 'checked' : '') +
				' 			value="남성" required>남성</label>';
		tag += '		<label><input type="radio" name="gender" ' + (gender == '여성' ? 'checked' : '') +
				' 			value="여성" required>여성</label>';
		tag += '	</div>';
		
		tag += '	<div class="flexBox">';
		tag += '		<select name="birthYear">'
		tag += '			<option value="">출생년</option>'
		for(let year = 2007; year >= 1944; year--) {
			tag += '		<option value="'+ year +'"'+ (year == birthYear ? " selected" : "") +'>'+ year +'년</option>'
			}
		tag += '		</select>'
		
		tag += '		<select name="birthMonth">'
		tag += '			<option value="">월</option>'
		for(let month = 1; month <= 12; month++) {
			tag += '		<option value="'+ month +'"'+ (month == birthMonth ? " selected" : "") +'>'+ month +'월</option>'
			}
		tag += '		</select>'
		
		tag += '		<select name="birthDay">'
		tag += '			<option value="">일</option>'
		for(let day = 1; day <= 31; day++) {
			tag += '		<option value="'+ day +'"'+ (day == birthDay ? " selected" : "") +'>'+ day +'일</option>'
			}
		tag += '		</select>'
		tag += '	</div>';
		
		tag += '	'
		tag += '	'
		tag += '	'
		tag += '	'
		tag += '</form>'
		
		mainContent.innerHTML = tag;
	})
	
	// 마이페이지 들어왔을때 마이프로필이 뜨도록
	infoUpdate.dispatchEvent(new Event('click'));
	
	
	
	
</script>