async function profileLoadHandler(event) {
		const userid = event.target.parentNode.getAttribute('value')
		const profileImg = document.getElementById('profileImg')
		const userDetail = document.getElementById('userDetail')
		
		const url = cpath + '/manage/userDetail/' + userid
		const dto = await fetch(url).then(resp => resp.json())
		
		const username = document.getElementById('username')
		username.innerText = dto.username + '님의 프로필'
		
		profileImg.style.backgroundImage = 'url(\'' + cpath + '/upload/' + dto.profile + '\')'
		
		let tag = ''
		tag += '<div class="userProfileR">'
		tag += '<p>아이디 : ' + '<span id="userid">' + dto.userid + '</span>' + '</p>'
		tag += '<p>성별 : ' + dto.gender + '</p>'
		tag += '<p>이메일 : ' + dto.email + '</p>'
		
		let birth = dto.birthYear + '-' + (dto.birthMonth < 10 ? '0' + dto.birthMonth : dto.birthMonth) + '-' + (dto.birthDay < 10 ? '0' + dto.birthDay : dto.birthDay)
		
		tag += '<p>생년월일 : ' + birth + '</p>'
		
		let tmp = new Date(dto.joinDate)
		let yyyy = tmp.getFullYear()
		let MM = tmp.getMonth() + 1
		MM = (MM < 10 ? '0' : '') + MM
		let dd = tmp.getDay()
		dd = (dd < 10 ? '0' : '') + dd
		let joinDate = yyyy + '-' + MM + '-' + dd
		tag += '<p>가입일 : ' + joinDate + '</p>'
		
		tmp = new Date(dto.lastLoginDate)
		yyyy = tmp.getFullYear()
		MM = tmp.getMonth() + 1
		MM = (MM < 10 ? '0' : '') + MM
		dd = tmp.getDay()
		dd = (dd < 10 ? '0' : '') + dd
		
		let last = yyyy + '-' + MM + '-' + dd
		
		tag += '<p>최종접속일 : ' + last + '</p>'
		tag += '</div>'
		userDetail.innerHTML = tag
		
		const stamp = document.getElementById('stamp')
		const colors = {
			"S" : "blue",
			"A" : "red",
			"B" : "orange",
			"C" : "yellow",
			"D" : "grey"
		}
		
		if(dto.grade == 'U') {
			stamp.innerText = '책정요망'
			stamp.classList = 'needGrading'
		}
		else {
			stamp.style.border = '10px solid ' + colors[dto.grade]
			stamp.style.color = colors[dto.grade]
			stamp.classList = 'grade'
			stamp.innerText = dto.grade
		}
		
		const userSpec = document.getElementById('userSpec')
		let tag2 = ''
		const marriage = dto.marriedCount == 0 ? '미혼' : dto.marriedCount == 1 ? '1회' : '2회 이상'
		tag2 += '<div>'
		tag2 += '<p>신장 : ' + dto.height + 'cm</p>'
		tag2 += '<p>결혼여부 : ' + marriage  + '</p>'
		tag2 += '<p>학력 : ' + dto.education + '</p>'
		tag2 += '<p>직업 : ' + dto.job + '</p>'
		tag2 += '</div>'
		tag2 += '<div>'
		
		const salarys = {
				"2999" : "3000만원 이하",
				"3000" : "3~4000만원",
				"4000" : "4~5000만원",
				"5000" : "5000만원 ~ 1억원",
				"10000" : "1억원 이상"
		}
		
		tag2 += '<p>연봉 : ' + salarys[dto.salary] + '</p>'
		tag2 += '<p>종교 : ' + dto.religion + '</p>'
		const estate = dto.estate == 0 ? '없음' : (dto.estate + '채 보유')
		tag2 += '<p>부동산 : ' + estate + '</p>'
		const owncar = dto.owncar == 0 ? '없음' : (dto.owncar + '대 보유')
		tag2 += '<p>자가용 : ' + owncar + '</p>'
		tag2 += '</div>'
		userSpec.innerHTML = tag2
		
		const introduce = document.getElementById('userIntroduce_inner')
		introduce.innerText = dto.introduce
		
		overlay.classList.toggle('hidden')
		userInfo.style.transitionDuration = '1s'
		userInfo.style.top = '50%'
		
		
		const needGrading = document.querySelector('.needGrading')
		if(needGrading != null) {			
			needGrading.onclick = function() {
				evaluate.classList.toggle('hidden')
				evaluateOverlay.classList.toggle('hidden')
			}
		}	
	}


async function stampHandler() {
	const grades = document.querySelectorAll('input[type="radio"]')
	let grade = ''
	grades.forEach(e => {
		if(e.checked) {
			grade = e.value
		}
	})
	
	const url = cpath + '/manage/grading'
	const ob = {
		userid : document.getElementById('userid').innerText,
		grade : grade
	}
	
	const opt = {
		method: 'POST',
		body : JSON.stringify(ob),
		headers : {
			"Content-Type" : "application/json; charset=utf-8"
		}
	}
	
	const result = await fetch(url, opt).then(resp => resp.text())
	if(result == 1) {
		const needGrading = document.querySelector('.needGrading')
		if(needGrading != null) {			
			needGrading.dispatchEvent(new Event('click'))
		}
		const stamp = document.getElementById('stamp')
		
		const colors = {
			"S" : "blue",
			"A" : "red",
			"B" : "orange",
			"C" : "yellow",
			"D" : "grey"
		}
		
		stamp.style.border = '10px solid ' + colors[grade]
		stamp.style.color = colors[grade]
		stamp.classList = 'grade'
		stamp.innerText = grade
	}
}

function profileCloseHandler() {
	overlay.classList.toggle('hidden')
	userInfo.style.transitionDuration = 'unset'
	userInfo.style.top = '200%'
}