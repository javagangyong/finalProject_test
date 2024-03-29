function showConfirm() {
	    // SweetAlert를 사용하여 confirm 창 표시
	    swal.fire({
	        title: '매칭알림',
	        html: "신청받은 매칭이 " + waitCount + '건 있습니다. <br>확인 페이지로 이동하시겠습니까?',
	        showCancelButton: true,
	        confirmButtonText: '네',
	        cancelButtonText: '아니오',
	      }).then((result) => {
	        if (result.isConfirmed) {
	          // 확인 버튼이 클릭되었을 때 수행할 동작
			  location.href = cpath + '/match/mymatch'
	        } else if (result.dismiss === Swal.DismissReason.cancel) {
	          // 취소 버튼이 클릭되었을 때 수행할 동작
				return false
	        }
	      })
	    }

function profileSlideHandlerW() {
	const wProfile = document.querySelector('#ch_member_women')
	const currentLeft = parseFloat(wProfile.style.left) || 0; 
	wProfile.style.left = (currentLeft - 1) + 'px'; 
	const firstImg = wProfile.children[0]	// wProfile의 첫번째 요소
	let firstImgRect = firstImg.getBoundingClientRect()	
	let firstImgX = firstImgRect.left + window.pageXOffset // 그 요소의 X축 값
	
	// 첫번째 요소가 화면을 벗어나면
	if(firstImgX <= -415) {
		const firstClone = firstImg.cloneNode(true)
		wProfile.appendChild(firstClone)
		wProfile.removeChild(firstImg)
		wProfile.style.left = 0
	}
}

function profileSlideHandlerM() {
	const mProfile = document.querySelector('#ch_member_men')
	const currentLeft = parseFloat(mProfile.style.left) || 0; 
	mProfile.style.left = (currentLeft + 1) + 'px'; 
	const lastImg = mProfile.lastElementChild
	let lastImgRect = lastImg.getBoundingClientRect()	
	let lastImgX = lastImgRect.left + window.pageXOffset // 그 요소의 X축 값
	
	// 마지막 요소가 화면을 벗어나면
	if(lastImgX >= window.innerWidth) {
		const lastClone = lastImg.cloneNode(true)
		mProfile.insertBefore(lastClone, mProfile.children[0])
		mProfile.removeChild(lastImg)
		mProfile.style.left = '-2446px'
	}
}