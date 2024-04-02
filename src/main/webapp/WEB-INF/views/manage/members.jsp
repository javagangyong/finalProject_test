<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../managerheader.jsp" %>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Kumar+One&family=Rubik+Maps&display=swap');
	
	.memberList {
		width: 900px;
		border-collapse: collapse;
		margin: 0 auto;
	}
	
	.memberList th,
	.memberList td {
		text-align: center;
		border-bottom: 1px solid black;
	}
	
	.userlist > tr:hover {
		background-color: lightskyblue;
	}
	
	.userInfo {
	    position: fixed;
	    top: 200%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    width: 700px;
	    height: 900px;
	    background-color: white;
	    box-shadow: 1px 1px 10px 1px black;
	    z-index: 2;
	    transition-duration: 1s;
	}
	
	#userInfoInner {
		display: flex;
		justify-content: space-between;
		height: 30%;
	}
	
	#userInfoInner > div {
		height: 100%;
	}
	
	#userProfile {
		flex: 2;
		display: flex;
		justify-content: center;
		margin-top: 20px;
	}
	
	#profileImg {
	    width: 180px;
	    height: 242px;
	    background-position: center;
	    background-size: 100% 100%;
	    background-repeat: no-repeat;
	    border: 1px solid black;
	}
	
	#userDetail {
		margin-top: 10px;
		flex: 3;
	}
	
	.userInfo_overlay {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		z-index: 1;
	}
	
	.userProfileR {
		display: flex;
	    justify-content: center;
	    align-items: center;
	    flex-direction: column;
	}
	
	.userProfileR > p {
		width: 300px;
	    margin: 10px 0;
	    border-bottom: 1px solid black;
	    font-size: 13px;
	    font-weight: 400;
	    box-sizing: border-box;
	    padding: 3px 0;
	}
	
	#userSpecs {
		width: 100%;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	#userGrade {
		flex: 2;
		height: 200px;
		display: flex;
		justify-content: center;
	}
	
	#userGrade_box {
		width: 180px;
		height: 150px;
		border: 1px solid black;
		display: flex;
	  	justify-content: center;
	  	align-items: center;
	}
	
	#stamp {
		width: 120px;
	    height: 120px;
	    border-radius: 50%;
	    font-weight: bold;
	    display: flex;
	    justify-content: center;
	    box-sizing: border-box;
	    padding: 5px 0px;
	}
	
	
	#userSpec {
		display: flex;
		flex: 3;
		height: 200px;
	}
	
	#userSpec > div {
		flex: 1;
		height: 155px;
    	display: flex;
    	flex-direction: column;
    	justify-content: space-between;
	}
	
	#userSpec > div > p {
		font-size: 13px;
		margin: 0;
	}
	
	.grade {
		font-size: 60px;
		font-family: "Kumar One", serif;
		align-items: unset;
	}
	
	.needGrading {
		border: 0 !important;
		color: black !important;
		font-size: 29px;
		font-family: '궁서체';
		align-items: center;
	}
	
	#userIntroduce {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	
	#userIntroduce_inner {
		width: 600px;
		height: 200px;
		box-sizing: border-box;
		padding: 5px;
		white-space: pre-wrap; 
  		overflow-wrap: break-word; 
  		word-wrap: break-word; 
		border: 1px solid black;
		font-size: 14px;
	}
	
	#evaluate {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		width: 300px;
		height: 250px;
		border: 1px solid black;
		background-color: white;
		z-index: 5;
	}
	
	#evaluate_inner {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	
	.grades {
		margin-top: 25px;
		margin-left: -114px;
	}
	
	.grades > label {
		position: relative;
		margin-left: 60px;
	}
	
	.grades > label > input[type="radio"] {
		position: absolute;
		top: 0;
		opacity: 0;
		width: 40px;
		height: 100px;
	}
	
	.grades > label > span {
		font-size: 70px;
		position: absolute;
		top:0;
	}
	
	.grades > label > span:hover {
		font-weight: bold;
		cursor: pointer;	
	}
	
	.grades > label > input[type="radio"]:checked + span {
		font-weight: bold;
	}
	
	#gradeS:hover > span {
		color: blue;
	}
	
	input[value="S"]:checked + span {
		color: blue;
	}
	
	#gradeA:hover > span {
		color: red;
	}
	
	input[value="A"]:checked + span {
		color: red;
	}
	
	#gradeB:hover > span {
		color: orange;
	}
	
	input[value="B"]:checked + span {
		color: orange;
	}
	
	#gradeC:hover > span {
		color: yellow;
	}
	
	input[value="C"]:checked + span {
		color: yellow;
	}
	
	#gradeD:hover > span {
		color: grey;
	}
	
	input[value="D"]:checked + span {
		color: grey;
	}
		
	.evaluate_overlay {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.5);
		z-index: 3;
	}
	
	#stamping {
		position: absolute;
	    top: 200px;
	    left: 50%;
	    transform: translate(-50%);
	    width: 200px;
	    height: 35px;
	    border: 0;
	    background-color: aquamarine;
	    border-radius: 20px;
	    font-size: 15px;
	    font-weight: bold;
	    color: white;
	}
	
	#stamping:hover {
		cursor: pointer;
		background: skyblue;
	}
	
	#ch_profile_close {
		all: unset;
		font-size: 15px;
		font-weight: bold;
		cursor: pointer;
		
	}
</style>


<section class="frame" style="margin: 150px auto; width: 900px; height: 900px; overflow-x: hidden; overflow-y: scroll;">
	<h2 align="center" style="font-weight: 200;">회원 목록</h2>
	
	<table class="memberList">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>가입일자</th>
				<th>최종접속일</th>
			</tr>
		</thead>
		
		<tbody class="userlist">
			<c:forEach var="user" items="${list }">			
				<tr value="${user.userid }">
					<td>${user.userid }</td>
					<td>${user.username }</td>
					<td>${user.email }</td>
					<td>${user.gender }</td>
					<td>${user.phoneNumber }</td>
					<td>${user.joinDate }</td>
					<td>${user.lastLoginDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>

<div class="userInfo">
	<h2 align="center" id="username" style="font-weight: 300; margin: 5px;"></h2>
	<div id="userInfoInner">
		<div id="userProfile">
			<div id="profileImg"></div>
		</div>
		<div id="userDetail">
			
		</div>
	</div>
	<div style="display: flex;">	
		<h2 style="font-weight: 300; flex: 2; text-align: center;">등급</h2>
		<h2 style="font-weight: 300; flex: 3; text-align: center;">
			<span style="margin-right: 100px;">스펙</span>
		</h2>
	</div>
	<div id="userSpecs">
		<div id="userGrade">		
			<div id="userGrade_box">
				<div id="stamp"></div>
			</div>
		</div>	
		<div id="userSpec">
			
		</div>
	</div>
	<div id="userIntroduce">
		<h2 style="font-weight: 300; text-align: center; margin: 0;">자기소개</h2>
		<pre id="userIntroduce_inner">
		
		</pre>
	</div>
	<div style="width: 100%; display: flex; justify-content: center;">	
		<button id="ch_profile_close" onclick="profileCloseHandler()">닫기</button>
	</div>
</div>
<div class="userInfo_overlay hidden"></div>

<div class="hidden" id="evaluate">
	<div id="evaluate_inner">
		<h2 style="font-weight: 300; margin: 5px 0;">등급 책정</h2>
		<div class="grades">
			<label id="gradeS">
				<input type="radio" name="grade" value="S">
				<span>S</span>
			</label>
			<label id="gradeA">
				<input type="radio" name="grade" value="A">
				<span>A</span>
			</label>
			<label id="gradeB">
				<input type="radio" name="grade" value="B">
				<span>B</span>
			</label>
			<label id="gradeC">
				<input type="radio" name="grade" value="C">
				<span>C</span>
			</label>
			<label id="gradeD">
				<input type="radio" name="grade" value="D">
				<span>D</span>
			</label>
		</div>
	</div>
	<button id="stamping">책정하기</button>
</div>
<div class="evaluate_overlay hidden"></div>

<script>
	const userlist = document.querySelectorAll('.userlist > tr')
	const userInfo = document.querySelector('.userInfo')
	const overlay = document.querySelector('.userInfo_overlay')
	const evaluate = document.getElementById('evaluate')
	const stamping = document.getElementById('stamping')
	const evaluateOverlay = document.querySelector('.evaluate_overlay')
	
	
	userlist.forEach(e => e.onclick = profileLoadHandler)
	
	
	overlay.onclick = function() {
		overlay.classList.toggle('hidden')
		userInfo.style.transitionDuration = 'unset'
		userInfo.style.top = '200%'
	}
	

	stamping.onclick = stampHandler
	
	
	evaluateOverlay.onclick = function() {
		evaluateOverlay.classList.toggle('hidden')
		evaluate.classList.toggle('hidden')
	}
 </script>

</body>
</html>