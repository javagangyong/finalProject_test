<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	#section {
		width: 1000px;
		height: 1500px;
		margin: 95px auto 0 auto;
		border: 1px solid black;
	}
	#matchList {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
	}
	.matchUser {
		border: 1px solid black;
		width: 150px;
		height: 300px;
		margin: 10px;
	}
	.userListProfile {
		width: 100%;
		height: 200px;
		background-size: cover;
		background-position: center;
		background-repeat: no-repeat;
	}
	.userListProfile:hover {
		cursor: pointer;
	}
	#testUserInfo {
		position: fixed;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -47%);
		width: 400px;
		height: 700px;
		background-color: #fafafa;
		border: 1px solid #e9ecef;
		z-index: 7;
		display: none;
		overflow: hidden;
	}
	#testUserProfile {
		width: 280px;
		height: 300px;
		margin: 30px auto;
		background-size: cover;
		background-position: center;
		background-repeat: no-repeat;
	}
	#userCon {
		width: 280px;
		height: 315px;
		margin: 0 auto;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-content: center;
	}
	.testHeightToggle {
		display: block !important;
	}
	#testOverlay {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		z-index: 6;
		background-color: rgba(0, 0, 0, 0.3);
	}
	#tryMatchFont {
		font-size: 17px; 
		font-weight: bold; 
		margin: 3px auto;
		color: #FF6B6B;
	}
	#tryMatchFont:hover {
		transform: translateY(-2px);
		cursor: pointer;
	}
	
	#userCon > p {
		margin-top: 3px;
		margin-bottom: 3px;
	}
	#userCon > pre {
		white-space: pre-wrap;
	}
</style>




<section id="section">



<div id="matchList">
	<c:forEach var="dto" items="${list }">
		<div class="matchUser">
			<div class="userListProfile" style="background-image: url('${cpath}/upload/${dto.profile}')" 
				value="${dto.userid }" onclick="userLoadHandler(event)"></div>
			<div>이름 : ${dto.username }</div>
			<div>${dto.birthYear }년 ${dto.birthMonth }월 ${dto.birthDay }일생</div>
		</div>
	</c:forEach>
</div>


<div id="testUserInfo"></div>
<div id="testOverlay" class="hidden"></div>
	
</section>






<script>
	async function userLoadHandler(event) {
		const opponent = event.target.getAttribute('value')
		const testUserInfo = document.getElementById('testUserInfo')
		
		const url = cpath + '/testMatchAjax/userInfo/' + opponent
		const info = await fetch(url).then(resp => resp.json())
		
		const testDate = new Date()
		const testAge = testDate.getFullYear() - info.birthYear + 1
		
		let tag = ''
		tag += '<div id="testUserProfile" style="background-image: url(\'' + cpath + '/upload/' + info.profile + '\')"></div>'
		tag += '<div id="userCon">'
		tag += '	<p>' + info.username + '(' + testAge + '세)</p>'
		tag += '	<p>' + info.birthYear + '년 ' + info.birthMonth + '월 ' + info.birthDay + '일생</p>'
		tag += '	<p>결혼여부 : ' + (info.marriedCount == 0 ? '없음' : (info.marriedCount == 1 ? '1회' : '2회이상')) + '</p>'
		tag += '	<p>거주지역 : ' + info.residence + '</p>'
		tag += '	<p>직업 : ' + info.job + '</p>'
		tag += '	<p>연봉 : ' + info.salary + '</p>'
		tag += '	<p>종교 : ' + info.religion + '</p>'
		tag += '	<p style="font-size: 20px; margin: 3px auto;">자기소개</p>'
		tag += '	<pre>' + info.introduce + '</pre>'
		tag += '	<p id="tryMatchFont" value="' + opponent + '" onclick="tryMatchHandler(event)">매칭시도</p>'
		tag += '</div>'
		
		
		testUserInfo.innerHTML = tag
		console.log(opponent)
		infoToggle()
		
		const testOverlay = document.getElementById('testOverlay')
		testOverlay.onclick = infoToggle
	}
	
	
	function infoToggle() {
		const userInfo = document.getElementById('testUserInfo')
		const overlay = document.getElementById('testOverlay')
		userInfo.classList.toggle('testHeightToggle')
		overlay.classList.toggle('hidden')
	}
	
	
	async function tryMatchHandler(event) {
		const respUser = event.target.getAttribute('value')
		const reqUser = user
		const reqUserName = username
		
		stomp.send('/app/testTryMatch/' + respUser, {}, JSON.stringify({
			from: reqUser,
			to: respUser,
			time: reqUserName
		}))
		
		const url = cpath + '/testMatchAjax/testTryMatch'
		const ob = {reqUser, respUser}
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type' : 'application/json;charset=utf-8'
			}
		}
		
		const map = await fetch(url, opt).then(resp => resp.json())
		
		infoToggle()
		
		alert(map.message)
		
		
	}
	
	

</script>




<%@ include file="../footer.jsp" %>