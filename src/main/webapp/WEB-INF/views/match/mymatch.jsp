<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src="${cpath }/resources/js/mymatch.js"></script>
<style>
	.matchingList {
		display: flex;
		width: 100%;
		list-style: none;
		margin: 0;
		padding: 0;
		border-bottom: 1px solid black;
	}
	
	
	.matchingList > li {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.matchingList > li:nth-child(1) {
		flex: 2;
	}
	
	.matchingList > li:nth-child(2) {
		flex: 1;
	}
	
	.matchingList > li:nth-child(3) {
		flex: 1;
	}
	
	#oponent {
		width: 100%;
	}
	
	.ch_match_btns > a {
		text-decoration: none;
		color: white;
		font-size: 14px;
		font-weight: bold;
	}
	
	.ch_match_btns {
		margin-right: -70px;
		transform: translate(6px);
	}
	
	.ch_match_btns button {
		all: unset;
		display: inline-block;
		width: 40px;
		height: 30px;
		text-align: center;
		background-color: black;
		border-radius: 5px;
	}
	
	.ch_match_btns button:hover {
		cursor: pointer;
		background-color: rgba(0, 0, 0, 0.7);
	}
	
	.ch_profile_view {
		all: unset;
		display: inline-block;
		width: 60px;
		height: 30px;
		text-align: center;
		background-color: black;
		border-radius: 5px;
		font-size: 14px;
		font-weight: bold;
		color: white;
		margin-right: -60px;
    	transform: translate(10px);
	}
	
	.ch_profile_view:hover {
		cursor: pointer;
		background-color: rgba(0, 0, 0, 0.7);
	}
	
	#ch_oponent_profile {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		box-shadow: 1px 1px 15px ${login.gender == '남성' ? 'hotpink' : 'skyblue'};
		border-radius: 15px;
		width: 35%;
		height: 0px;
		z-index: 5;
		transition-duration: 1.2s;
		overflow-y: hidden;
	}
	
	#ch_oponent_profile > div {
		width: 100%;
		height: 50%;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	#ch_oponent_profile > div:nth-child(2) {
		justify-content: flex-start;
		align-items: flex-start;
	}
	
	#ch_profile_overlay {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		border-radius: 15px;
		width: 35%;
		height: 0px;
		background-color: white;
		z-index: 4;
		transition-duration: 1s;
	}
	
	.ch_height_toggle {
		height: 96% !important;
	}
	
	#ch_profile_close {
		all: unset;
		color: white;
		font-size: 15px;
		font-weight: bold;
		position: absolute;
		bottom: 5px;
		right: 10px;
	}
	
	#ch_oponent_img > div {
		width: 350px;
		height: 350px;
		border-radius: 50%;
		box-shadow: 1px 1px 15px grey inset;
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
	
	#ch_oponent_detail {
		width: 100%;
	}
	
	#ch_oponent_detail > p {
		margin: 2px auto;
		width: fit-content;
		font-size: 17px;
		font-weight: bold;
		color: white;
	}
	
	#ch_oponent_detail > pre {
		margin: 5px auto;
		color: white;
		font-size: 15px;
		font-weight: bold;
		width: 300px;
		height: 120px;
		white-space: pre-wrap; 
    	word-wrap: break-word; 
		box-sizing: border-box;
		border-radius: 15px;
		box-shadow: 1px 1px 40px ${login.gender == '남성' ? 'hotpink' : 'skyblue'} inset;
		padding: 10px;
	}
	
	.ch_bg_women {
		background-color: rgba(242, 140, 191, 0.4);
	}
	.ch_bg_men {
		background-color: rgb(135, 206, 235, 0.4);
	}
	
	
	
	
	
	
	.myframe {
		width: 900px;
		margin: 0 auto;
		padding: 95px 0;
		position: relative;
	}
	.possibleMatch {
		position: absolute;
		right: 0px;
		top: 125px;
	}
	
</style>

<section class="myframe">
	<h2 style="font-weight: 300; text-align: center;">매칭 현황</h2>
	<div class="possibleMatch">dd</div>
	<div>
		<ul class="matchingList" style="border-top: 1px solid black;">
			<li>매칭 상대</li>
			<li>신청 여부</li>
			<li>상태</li>
		</ul>
	</div>
	<c:forEach var="match" items="${list }">
	<div class="mymatches">
			<ul class="matchingList" style="height: 40px;">
				<li id="oponent">		
					${match.reqUser == login.userid ? match.respUsername : match.reqUsername }
					<button onclick="ChProfileLoadHandler(event)" class="ch_profile_view" value="${match.reqUser == login.userid ? match.respUser : match.reqUser }">프로필</button>
				</li>
				<li>${match.reqUser == login.userid ? '보냄' : '받음' }</li>
				<li>
					<span>				
						${match.matched == 0 ? '매칭 대기' : (match.matched == 1 ? '매칭중' : (match.matched == 2 ? '매칭거부' : '매칭종료')) }
					</span>
					<span class="ch_match_btns ${match.matched != 0 or match.reqUser == login.userid ? 'hidden' : '' }">
						<a value="${match.reqUser }" href="${cpath }/match/accept?reqUser=${match.reqUser}"><button class="accept">수락</button></a>
						<a value="${match.reqUser }" href="${cpath }/match/deny?reqUser=${match.reqUser}"><button class="deny">거절</button></a>
					</span>
				</li>
			</ul>
	</div>	
	</c:forEach>
</section>

<div class="${login.gender == '남성' ? 'ch_bg_women' : 'ch_bg_men' }" id="ch_oponent_profile">
	
</div>

<div id="ch_profile_overlay">
<script>
	const matching = '${matching}'
		
	document.addEventListener('DOMContentLoaded', function() {
		const denyBtns = document.querySelectorAll('.deny')
		denyBtns.forEach(btn => btn.onclick = denyHandler)
	})
	
	document.addEventListener('DOMContentLoaded', function() {
		const acceptBtns = document.querySelectorAll('.accept')
		acceptBtns.forEach(btn => btn.onclick = acceptHandler)
	})
	
	document.addEventListener('DOMContentLoaded', function() {
    setTimeout(showMatchSuccess, 500)
	})
</script>
</div>
</body>
</html>