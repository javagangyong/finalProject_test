function profileToggle() {
	    const profile = document.getElementById('ch_oponent_profile')
	    const overlay = document.getElementById('ch_profile_overlay')
	    profile.classList.toggle('ch_height_toggle')
	    overlay.classList.toggle('ch_height_toggle')
	}

// 상대방 프로필 확인
async function ChProfileLoadHandler(event) {
		let oponent = event.target.value
		const profile = document.getElementById('ch_oponent_profile')
		const url = cpath + '/matchAjax/userInfo/' + oponent
		const info = await fetch(url).then(resp => resp.json())
		let year = new Date()
		profile.innerHTML = ''
		let profileURL = cpath + '/upload/' + info.profile
		let tag = ''
		tag += '<div id="ch_oponent_img">'
		tag += 		'<div style="margin-top: 15px; background-image: url(\'' + profileURL +'\')">'
		tag += 		'</div>'
		tag += '</div>'
		tag += '<div id="ch_oponent_detail">'
		tag += 		'<p>' + info.username + ' (' + (year.getFullYear() - info.birthYear + 1) + ' 세)' + '</p>'
		tag +=		'<p>' + info.birthYear + '년 ' + info.birthMonth + '월 ' + info.birthDay + '일생' + '</p>'
		tag +=		'<p>결혼여부 : ' + (info.marriedCount == 0 ? '없음' : (info.marreidCount == 1 ? '1회 있음' : '2회 이상') ) + '</p>'
		tag +=		'<p>거주지역 : ' + info.residence + '</p>'
		tag +=		'<p>직업 : ' + info.job + '</p>'
		
		const salarys = {
				"2999" : "3000만원 이하",
				"3000" : "3천만원대",
				"4000" : "4천만원대",
				"5000" : "5천이상 ~ 1억원 이하",
				"10000" : "1억원 이상"
		}
		
		tag +=		'<p>연봉 : ' + salarys[info.salary] + '</p>'
		tag +=		'<p>종교 : ' + info.religion + '</p>'
		tag +=		'<p style="font-size: 20px; margin-top: 10px;">자기소개</p>'
		tag	+=		'<pre>' + info.introduce + '</pre>'
		tag += '</div>'
		tag += '<button id="ch_profile_close">닫기</button>'
	
		
		
		profile.innerHTML = tag
		profileToggle()
		const profileCloseBtn = document.getElementById('ch_profile_close')
	    profileCloseBtn.onclick = profileToggle
	}

// 매칭 성사 알림	
function showMatchSuccess() {	
		if(matching != '') {
			swal.fire({
				title: '매칭성사',
				text: '매칭이 성사되어 채팅방이 열렸습니다! 확인해보세요~',
				icon: 'success',
				confirmButtonText: '확인'
			})
		}
}

// 매칭 거절 처리
function denyHandler(event) {
	event.preventDefault()
	let target = event.target
	while(target.tagName != 'A') {
		target = target.parentNode
	}
	let oponent = target.getAttribute('value')
	console.log(oponent)
	stomp.send('/broker/' + oponent, {}, JSON.stringify({
		from : username,
		text : '매칭거부',
	}))
	location.href = target.href
}

// 매칭 수락 처리
async function acceptHandler(event) {
	event.preventDefault()
	
	let target = event.target
	while(target.tagName != 'A') {
		target = target.parentNode
	}
	let oponent = target.getAttribute('value')
	
	const url = cpath + '/matchAjax/currentMatching/' + oponent
	const result = await fetch(url).then(resp => resp.json())
	
	if(result >= 5) {
		swal.fire({
	         title: '매칭불가',
	         html: '상대방이 현재 최대 매칭가능 인원과 매칭중입니다. <br> 다음에 다시 시도해주세요',
	         icon: 'info',
	         confirmButtonText: '확인'
	      })
	    return
	}
	
	stomp.send('/broker/' + oponent, {}, JSON.stringify({
		from : username,
		text : '매칭수락',
	}))
	location.href = target.href
}

// 남은 매칭 횟수 확인
async function membershipCountHandler(event) {
 	const possibleMatch = document.querySelector('.possibleMatch')
 	const userid = user
 	const url = cpath + '/matchAjax/membershipCount?userid=' + userid
 	console.log(url)
 	
 	const dto = await fetch(url).then(resp => resp.json())
 	console.log(dto)
 	
 	possibleMatch.innerText = '나의 매칭 가능 횟수 : ' + dto.matchCount
}
 
 window.onload = membershipCountHandler;
	
