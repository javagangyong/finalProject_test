
function profileToggle() {
    const profile = document.getElementById('ch_oponent_profile')
    const overlay = document.getElementById('ch_profile_overlay')
    const kdoverlay = document.getElementById('kdoverlay')
    profile.classList.toggle('ch_height_toggle')
    overlay.classList.toggle('ch_height_toggle')
    kdoverlay.classList.toggle('hidden')
}




async function kdprofileLoadHandler(event) {
      let oponent = event.target.getAttribute('value')
      const profile = document.getElementById('ch_oponent_profile')
      
      console.log(oponent)

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
    const reqUser = user
    const respUser = oponent
    const matchCountUrl = cpath + '/matchAjax/matchCount?reqUser=' + reqUser + '&respUser=' + respUser
    const matchCount = await fetch(matchCountUrl).then(resp => resp.text())

	const reqGender = gender
    if(matchCount === '0') {
  	  tag += '<p><button onclick="tryMatchHandler(event)" class="tryMatch  ' + (reqGender === '남성' ? 'tryMatch_bg_women' : 'tryMatch_bg_men') + '" value="' + oponent + '">매칭 시도</button></p>';
    } else {
  	  tag += '	<p class="alreadyMatch">이미 매칭시도중인 상대입니다</p>'
    }
	tag += '</div>'
      
    tag += '<button id="ch_profile_close">닫기</button>'
      
      
      profile.innerHTML = tag
//      console.log(kduserInfo)
//      console.log(tag)
      
      profile.innerHTML = tag
	  profileToggle()
	  const profileCloseBtn = document.getElementById('ch_profile_close')
	  profileCloseBtn.onclick = profileToggle
      
}
   
   
   
   
async function tryMatchHandler(event) {
    const reqUser = user
    const reqUsername = username
    const respUser = event.target.getAttribute('value')
    event.preventDefault()
  
    
    stomp.send('/app/tryMatch/' + respUser, {}, JSON.stringify({
            from: reqUser,
            to: respUser,
            time: reqUsername
    }))
    
    const tryMatchUrl = cpath + '/matchAjax/tryMatch'
    const tryMatchOb = { reqUser, respUser }
    
    const tryMatchOpt = {
       method: 'POST',
       body: JSON.stringify(tryMatchOb),
       headers: {
          'Content-Type' : 'application/json;charset=utf-8'
       }
    }
    
    
    const map = await fetch(tryMatchUrl, tryMatchOpt).then(resp => resp.json())
    membershipCountHandler()
    profileToggle()
    
    alert(map.message)
 }
 
 
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
