	function getCurrentHHmm() {
	    const d = new Date();
	    let h = d.getHours();
	    let m = d.getMinutes();
	    let ampm = '오전';
	
	    // 시간이 12 이상인 경우 오후로 표시하고, 12를 빼줌
	    if (h >= 12) {
	        ampm = '오후';
	        h -= 12;
	    }
	
	    // 시간이 0인 경우 12로 변경 (자정 처리)
	    if (h === 0) {
	        h = 12;
	    }
	
	    // 한 자리 숫자일 경우 앞에 0을 붙임
	    if (h < 10)
	        h = '0' + h;
	    if (m < 10)
	        m = '0' + m;
	
	    return ampm + ' ' + h + ':' + m;
	}


	async function receiveChat(chat) {
		const content = JSON.parse(chat.body)
		const from = content.from
		let roomName = content.roomName
		const time = content.time
		const profile = content.profile
		const profileUrl = cpath + '/upload/' + profile
		const text = content.text
		const room = document.querySelector('.room[roomname="' + roomName + '"]')
		const messageArea = document.querySelector('.messageArea[roomname="' + roomName +'"]')
		// 상대방과 매칭 종료시
		if(text == '매칭종료') {
			if(room.classList.contains('hidden')) {
				const talkAlarm = document.querySelector('.talkAlarm')
				const alarmBtn = talkAlarm.children[1].children[0]
				alarmBtn.setAttribute('roomname', roomName)
				let content = ''
				content +=   '<div id="ch_matching_end">' + from + '님이 매칭을 종료하셨습니다.</div>'
				talkAlarm.children[0].innerHTML = content
				talkAlarm.style.zIndex = 10
				talkAlarm.style.opacity = 1
			}
			const disconnect = room.querySelector('.disconnect')
			disconnect.classList.remove('hidden')							
			const matchingEnd = room.querySelector('.matchingEnd')
			matchingEnd.classList.add('hidden')
			stomp.unsubscribe('/broker/chat/' + roomName)
			return;
		}
		// 현재 상대방과의 채팅방이 숨김 상태일때 알림 표시
		if(room.classList.contains('hidden')) {
			const talkAlarm = document.querySelector('.talkAlarm')
			const alarmBtn = talkAlarm.children[1].children[0]
			alarmBtn.setAttribute('roomname', roomName)
			let content = ''
			content += 	 '<div id="ch_alarm_profile" style="background-image: url(\'' + profileUrl +' \');"></div>'
			content +=   '<div id="ch_alarm_text">' + text +'</div>'
			talkAlarm.children[0].innerHTML = content
			talkAlarm.style.zIndex = 10
			talkAlarm.style.opacity = 1
		}
		
		let who = (from == username ? 'rightMsg' : 'leftMsg')
		let finalMsg = messageArea.lastElementChild
		if(finalMsg == null) {
			finalMsg = document.createElement('div')
		}
		let str = ''
		str += '<div class="' + who
				+ '" dir="' + who + '">'
 	    str += '<label class="' + (from == username ? 'hidden' : '') + '" id="oponent">'
 
 	    if(messageArea.childElementCount == 0) { 	    	
 	    	str += '<span id="oponent_profile" style="background-image: url(\'' + profileUrl + '\')"></span>'
 	    	str += '<span style="font-size: 12px;">' + from + '</span>'
 	    }
 	    else if(who == finalMsg.getAttribute('dir') && finalMsg.querySelector('sub').innerText != content.time) {
 	    	str += '<span id="oponent_profile" style="background-image: url(\'' + profileUrl + '\')"></span>'
 	    	str += '<span style="font-size: 12px;">' + from + '</span>'
 	    	
 	    }
 	    else if(who != finalMsg.getAttribute('dir')) {
 	    	str += '<span id="oponent_profile" style="background-image: url(\'' + profileUrl + '\')"></span>'
 	    	str += '<span style="font-size: 12px;">' + from + '</span>'
 	    }
		
	    if(who == finalMsg.getAttribute('dir') && finalMsg.querySelector('sub').innerText == content.time) {
 	    	finalMsg.children[1].children[2].remove()
 	    }
		
		str += '</label>'
		str += '<div>'
		str += '<span style="font-size: 12px;">' + text + '</span>'
		str += '<br><sub>' + content.time + '</sub>'
		str += '</div></div>'
		
		messageArea.innerHTML += str
		messageArea.scrollTop = messageArea.scrollHeight
	}

	function onInput(event){
		// 입력이 발생한 대상의 방 이름을 가져온다
		let roomName = event.target.parentNode.getAttribute('roomname')
		let oponent = event.target.parentNode.getAttribute('oponent')
		
		// 입력이 발생한 대상의 방 이름과 일치하는 요소를 찾아 메시지를 가져온다
		const msgInput = document.querySelector('.chatting[roomname="' + roomName +'"]').children[0]
		const text = msgInput.value
		
		
		if(text == ''){
		   return
		}
		msgInput.value = ''
		      
		stomp.send('/app/message/' + roomName, {}, JSON.stringify({     
		    from: username,
		    to: oponent,
		    text: text,
		    time: getCurrentHHmm(),
		    userid : user,
		    roomName : roomName
		    }))
		   msgInput.focus()
		}
	
	
	function sendChat(event) {
		if(event.key == 'Enter') onInput(event)		
	}
	
	
	function messageAreaHandler() {
		const areas = document.querySelectorAll('.messageArea')
		areas.forEach(e => e.scrollTop = e.scrollHeight)
	}
	
	// 채팅 리스트 가져오는 함수
	const getList = async function() {
		const url =  cpath + '/matchAjax/matchList/' + user
		
		const list = await fetch(url).then(resp => resp.json())
		
		return list
	}

	
	