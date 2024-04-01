// 프로필 미리보기
function previewHandler(event) {
	  const preview = document.querySelector('.preview')
      if(event.target.files && event.target.files[0]) {
          const reader = new FileReader()
          reader.onload = function(e) {
              preview.style.backgroundImage = 'url(' + e.target.result + ')'
              preview.style.backgroundSize = '100%'
                preview.style.fontSize = 0
          }
         reader.readAsDataURL(event.target.files[0])
        }
      else {
           preview.style.fontSize = '14px'      
       }
}

// 마이 프로필 로딩 함수
const myProfileLoadHandler = async function(event) {
	  const footer = document.querySelector('footer')
	  if(footer != null) {
		  footer.classList.remove('whenSpec')
	  }
	  const items = document.querySelectorAll('.item')
	  items.forEach(e => e.classList.remove('selected'))
	  event.target.classList.toggle('selected')
	  const content = document.querySelector('.content')
      const url = cpath + '/ajax/myprofile?userid=' + user
      const map = await fetch(url).then(resp => resp.json())
      const dto = map.dto
      
      const getmyProfileInfo = function() {
          content.innerHTML = '';
         
          let tag = '';
          tag += '        <h1 align="center">내 프로필</h1>';
          tag += '<div class="container">';
          tag += '<form method="POST" id="myprofile" enctype="multipart/form-data">';
          tag += '        <h2>프로필 사진</h2>';
          tag += '        <div class="profile">'
          tag += '         <div class="preview" onchange="previewHandler(event)" style=\"background-image: url(\'' + cpath + '/upload/' + dto.profile +  '\')\; background-position: center; background-size: 100%;">';
          tag += '            </div>';
//           tag += '            <input id="profileReg" type="file" name="upload" placeholder="프로필 이미지 선택" style="margin-top: 10px;" required>';
          tag += '        </div>';
          tag += '    </div>';
          tag += '   <div>'
          tag += '   <p style="width: 500px; font-size: 13px; color: #105dae;">이름</p>'
          tag += '            <input class="inputframe" type="text" value="' + username + '" name="username" required>';
          tag += '   <p style="width: 500px; font-size: 13px; color: #105dae;">등급</p>'            
          tag += '         <input class="inputframe" type="text" value="' + dto.grade + '" name="grade" required>';
          tag += '   </div>'
          tag += '   <p style="width: 500px; font-size: 13px; color: #105dae;">아이디</p>'
          tag += '         <input class="inputframe" type="text" value="' + user + '" name="userid" readonly required>';
          tag += '         <p>가입한 날짜 : ' + joinDate +'</p>'
          tag += '         <p style="margin-bottom: 20px;">최근 접속한 날짜 : ' + lastLoginDate +'</p>'
          tag += '</form>';
          
          content.innerHTML = tag;
      }
      
	  
      getmyProfileInfo()
      
      const form = document.forms[0]
      form.onsubmit = async function(event) {
         event.preventDefault()
         const url = cpath + '/ajax/myprofile?userid=' + user
         const formData = new FormData(event.target)
         const opt = {
            method: 'POST',
            body: formData,
         }
         const result = await fetch(url, opt).then(resp => resp.text())
         if(result == 1){
        	 myProfileLoadHandler()
         }
         
      }
      
  }


// 정보 수정 관련(수정, 탈퇴, 비밀번호 변경)
const myInfoLoadHandler = function(event) {
	const footer = document.querySelector('footer')
	if(footer != null) {
		footer.classList.remove('whenSpec')
	}
	const items = document.querySelectorAll('.item')
	items.forEach(e => e.classList.remove('selected'))
	event.target.classList.toggle('selected')
	const content = document.querySelector('.content')
    const getmyInfo = function(){
       content.innerHTML = '';
       
       let tag = '';

          tag += '<div class="mpmodify">';
          tag += '    <div class="mpmodify_inner">';
          tag += '        <h1 style="padding-left: 160px;">회원 정보 수정</h1>';
          tag += '        <div>';
          tag += '            <form id="mpmodifyForm">';
          tag += '                <input class="inputframe" type="text" value="' + user + '" name="userid" readonly required>';
          tag += '                <input class="inputframe" type="text" value="' + username + '" name="username" placeholder="이름" required>';
          tag += '                <div style="display: flex;">';
          tag += '                    <label>';
          tag += '                        <input type="radio" name="gender" value="남성"';
          tag += gender == '남성' ? ' checked' : '';
          tag += ' required>';
          tag += '                        <span class="radiotext">남성</span>';
          tag += '                    </label>';
          tag += '                    <label>';
          tag += '                        <input type="radio" name="gender" value="여성"';
          tag += gender == '여성' ? ' checked' : '';
          tag += ' required>';
          tag += '                        <span class="radiotext">여성</span>';
          tag += '                    </label>';
          tag += '                </div>';
          tag += '                <div class="birthday">';
          tag += '                    <select class="birthYear_sel" title="출생년"  name="birthYear" style="padding: 5px 10px;">';
          tag += '                        <option value="">출생년</option>';
          for (var year = 1944; year <= 2005; year++) {
              tag += '<option value="' + year + '">' + year + '년</option>';
          }
          tag += '                    </select>';
          tag += '                    <select class="birthMonth_sel" title="월 선택" name="birthMonth" style="padding: 5px 10px;">';
          tag += '                        <option value="">월 선택</option>';
          for (var month = 1; month <= 12; month++) {
              tag += '<option value="' + month + '">' + month + '월</option>';
          }
          tag += '                    </select>'; 
          tag += '                    <select class="birthDay_sel" title="일 선택" name="birthDay" style="padding: 5px 10px;">';
          tag += '                        <option value="">일 선택</option>';
          for (var day = 1; day <= 31; day++) {
              tag += '<option value="' + day + '">' + day + '일</option>';
          }
          tag += '                    </select>';
          tag += '                </div>';
          tag += '                <input class="inputframe" type="text" value="' + phoneNumber + '" name="phoneNumber" placeholder="전화번호" required>';
          tag += '                <div class="modifyBtn">';
          tag += '                    <button id="mpmodifyBtn" type="submit">정보수정</button>';
          tag += '                </div>';
          tag += '                <div class="modifyBtn">';
          tag += '                    <button id="pwmodifyBtn">비밀번호 변경</button>';
          tag += '                </div>';
          tag += '                <div class="modifyBtn">';
          tag += '                    <button id="withdrawBtn">회원 탈퇴</button>';
          tag += '                </div>';        
          tag += '            </form>';
          tag += '        </div>';
          tag += '    </div>';
          tag += '</div>';
          content.innerHTML = tag;
    }
    
   getmyInfo()                  // 선언한 함수 호출

   const form = document.forms[0]
   form.onsubmit = async function(event) {
       event.preventDefault()
       const url = cpath + '/ajax/mpmodify?userid=' + user
       const formData = new FormData(event.target)         // form의 값들을 다 불러오기
       const ob = {}
       for(let key of formData.entries()) {               // form을 순회하면서 값 저장
          ob[key[0]] = key[1]
       }
       console.log(ob)
       const opt = {
          method: 'POST',
          body: JSON.stringify(ob),
          headers: {
             'Content-Type' : 'application/json;charset=utf-8'
          }
       }
       const result = await fetch(url, opt).then(resp => resp.json())
       alert(result.message)
       location.href = cpath + '/member/logout?mypage=1'
    }
   
   const pwmodifyBtn = document.getElementById('pwmodifyBtn')
   
   
      pwmodifyBtn.onclick = function() {
      content.innerHTML = '';
      
      let tag = '';

      tag += '<div>';
      tag += '<h1 style="text-align: center;">비밀번호 변경</h1>';
      tag += '<p style="text-align: center; font-size: 14px; color: red;">';
      tag += '   · 다른 아이디/사이트에서 사용한 적 없는 비밀번호</p>';
      tag += '<p style="text-align: center; font-size: 14px; color: red;">';
      tag += '   · 이전에 사용한 적 없는 비밀번호가 안전합니다.</p>';
      tag += '</div>';
      
      tag += '<div class="mpmodify_inner">'
      tag += '   <form id="pwForm">';
      tag += '      <p><input id="inputPw1" class="inputframe" type="password" name="userpw"';
      tag += '          placeholder="새 비밀번호" required></p>';

      tag += '      <p id="pwLength" class="hidden"';
      tag += '          style="width: 500px; font-size: 13px; color: #105dae;">';
      tag += '       비밀번호는 8글자 이상 15글자 이하의 영문자 + 숫자로만 조합할 수 있습니다.</p>';
      
      tag += '      <p><input id="inputPw2" class="inputframe" type="password"';
      tag += '          placeholder="새 비밀번호 확인" required></p>';
      
      tag += '      <p id="pwConfirmTrue" class="hidden"';
      tag += '          style="width: 500px; font-size: 13px; color: #105dae;">';
      tag += '       비밀번호와 비밀번호 확인이 일치합니다.</p>';
      tag += '      <p id="pwConfirmFalse" class="hidden"';
      tag += '          style="width: 500px; font-size: 13px; color: red;">';
      tag += '       비밀번호와 비밀번호 확인이 일치하지 않습니다.</p>';

      tag += '      <input type="hidden" value="' + user + '" name="userid">'
      tag += '      <button id="pwBtn" type="submit" disabled>확인</button>';
      tag += '      <button id="cancleBtn">취소</button>';
      tag += '   </form>';
      tag += '</div>';
      content.innerHTML = tag;
      
    // 취소
    const cancleBtn = document.getElementById('cancleBtn')
    cancleBtn.addEventListener('click', function(event) {
       const inputPw1 = document.getElementById('inputPw1')
       const inputPw2 = document.getElementById('inputPw2')
       
       inputPw1.removeAttribute('required');
       inputPw2.removeAttribute('required');
       history.back();
    })
    
    
    const pwBtn = document.getElementById('pwForm').querySelector('#pwBtn');
    // 비밀번호 특정조건 만족
    function PasswordCheckHandler(event){
       var password = event.target.value
       var regex = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9]{8,15}$/;
       var pwCheck = regex.test(password)
       const pwLength = document.getElementById('pwLength')
       if(pwCheck){
          pwBtn.disabled = false
          pwLength.classList.add('hidden')
       }
       else {
          pwBtn.disabled = true
          pwLength.classList.remove('hidden')
       }
    }
    const pwInput = document.querySelector('input[name="userpw"]')
    pwInput.addEventListener('keyup', PasswordCheckHandler)
    
    
    
    // 비밀번호 일치여부
    function ConfirmPwHandler(event) {
       const pwConfirmTrue = document.getElementById('pwConfirmTrue')
       const pwConfirmFalse = document.getElementById('pwConfirmFalse')
       const confirmPassword = document.getElementById('inputPw2').value
       const password = document.querySelector('input[name="userpw"]').value
       if(confirmPassword === password) {
          pwBtn.disabled = false
          pwConfirmTrue.classList.remove('hidden')
          pwConfirmFalse.classList.add('hidden')
       }
       else {
          pwBtn.disabled = true
          pwConfirmTrue.classList.add('hidden')
          pwConfirmFalse.classList.remove('hidden')
       }
    }
    const confirmPwInput = document.getElementById('inputPw2')
    confirmPwInput.addEventListener('keyup', ConfirmPwHandler)
      
    
    
    const resetPassForm = document.forms[0]
    resetPassForm.onsubmit = async function(event) {
       event.preventDefault()
       const url = cpath + '/ajax/newPw'
       const ob = { 
             userid : event.target.querySelector('input[name="userid"]').value,
             userpw : event.target.querySelector('input[name="userpw"]').value
       }
       console.log(ob)
       
       const opt = {
          method: 'POST',
          body: JSON.stringify(ob),
          headers: {
             'Content-Type' : 'application/json;charset=utf-8'
          }
       }
       const result = await fetch(url, opt).then(resp => resp.json())
       alert(result.message)
       location.href = cpath + '/member/logout?mypage=1'
    }
   }
   
  // 회원 탈퇴

//   event.preventDefault()
   const withdrawBtn = document.getElementById('withdrawBtn');
  
   withdrawBtn.addEventListener('click', function(event) {
      event.preventDefault()
      location.href = cpath + '/member/withdrawMember/' + idx; 
   })
 
 }

// 생년월일 selected
const selectHandler = function() {
    
     
    var birthYearOptions = document.getElementsByClassName("birthYear_sel")[0].options;
    var birthMonthOptions = document.getElementsByClassName("birthMonth_sel")[0].options;
    var birthDayOptions = document.getElementsByClassName("birthDay_sel")[0].options;
     
     for (var i = 0; i < birthYearOptions.length; i++) {
         if (birthYearOptions[i].value === loginBirthYear) {
             birthYearOptions[i].setAttribute("selected", "selected");
         }
     }
     
    for (var i = 0; i < birthMonthOptions.length; i++) {
       if (birthMonthOptions[i].value === loginBirthMonth) {
          birthMonthOptions[i].setAttribute("selected", "selected");
       }
    }
    
    for (var i = 0; i < birthDayOptions.length; i++) {
       if (birthDayOptions[i].value === loginBirthDay) {
          birthDayOptions[i].setAttribute("selected", "selected");
       }
    }
 }

// 스펙 수정 관련
async function specModify(event) {
	const footer = document.querySelector('footer')
	footer.classList.add('whenSpec')
	const items = document.querySelectorAll('.item')
	items.forEach(e => e.classList.remove('selected'))
	event.target.classList.toggle('selected')
    var contentDiv = document.querySelector('.content')
    
    const url = cpath + '/member/spec?userid=' + user
    const map = await fetch(url).then(resp => resp.json())
    const dto = map.dto
    const profile = map.profile
    const getSpec = function(){
       contentDiv.innerHTML = '';
      
      
        var tag = "";
        tag += '<form id="specForm" method="POST" enctype="multipart/form-data">';
        tag += '    <div>';
        tag += '        <h2>신장</h2>';
        tag += '        <input class="numberInput" type="number" name="height" value="' + dto.height + '">';
        tag += '    </div>';
        tag += '    <div>';
       tag += '        <h2>과거 결혼 여부</h2>';
       tag += '        <div class="wrap">';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="marriedCount" value="0" ' + (dto.marriedCount === 0 ? 'checked' : '') + '>';
       tag += '                <span class="resText">미혼</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="marriedCount" value="1" ' + (dto.marriedCount === 1 ? 'checked' : '') + '>';
       tag += '                <span class="resText">1회 있음</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="marriedCount" value="2" ' + (dto.marriedCount === 2 ? 'checked' : '') + '>';
       tag += '                <span class="resText">2회 이상</span>';
       tag += '            </label>';
       tag += '        </div>';
       tag += '    </div>';
       tag += '    <div>';
       tag += '        <h2>거주지 선택</h2>';
       tag += '        <div class="wrap">';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="residence" value="서울/경기" ' + (dto.residence === '서울/경기' ? 'checked' : '') + '>';
       tag += '                <span class="resText">서울/경기</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="residence" value="강원도" ' + (dto.residence === '강원도' ? 'checked' : '') + '>';
       tag += '                <span class="resText">강원도</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="residence" value="충청도" ' + (dto.residence === '충청도' ? 'checked' : '') + '>';
       tag += '                <span class="resText">충청도</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="residence" value="전라도" ' + (dto.residence === '전라도' ? 'checked' : '') + '>';
       tag += '                <span class="resText">전라도</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="residence" value="경상도" ' + (dto.residence === '경상도' ? 'checked' : '') + '>';
       tag += '                <span class="resText">경상도</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="residence" value="제주도" ' + (dto.residence === '제주도' ? 'checked' : '') + '>';
       tag += '                <span class="resText">제주도</span>';
       tag += '            </label>';
       tag += '        </div>';
       tag += '    </div>';
       tag += '    <div>';
       tag += '        <h2>학력</h2>';
       tag += '        <div class="wrap">';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="education" value="중졸" ' + (dto.education === '중졸' ? 'checked' : '') + '>';
       tag += '                <span class="resText">중졸</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="education" value="고졸" ' + (dto.education === '고졸' ? 'checked' : '') + '>';
       tag += '                <span class="resText">고졸</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="education" value="2년제 학사" ' + (dto.education === '2년제 학사' ? 'checked' : '') + '>';
       tag += '                <span class="resText">2년제 학사</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="education" value="4년제 학사" ' + (dto.education === '4년제 학사' ? 'checked' : '') + '>';
       tag += '                <span class="resText">4년제 학사</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="education" value="석사" ' + (dto.education === '석사' ? 'checked' : '') + '>';
       tag += '                <span class="resText">석사</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="education" value="박사" ' + (dto.education === '박사' ? 'checked' : '') + '>';
       tag += '                <span class="resText">박사</span>';
       tag += '            </label>';
       tag += '        </div>';
       tag += '    </div>';
       tag += '    <div>';
       tag += '        <h2>직업</h2>';
       tag += '        <div class="wrap">';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="job" value="전문직" ' + (dto.job === '전문직' ? 'checked' : '') + '>';
       tag += '                <span class="resText">전문직</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="job" value="공기업/금융" ' + (dto.job === '공기업/금융' ? 'checked' : '') + '>';
       tag += '                <span class="resText">공기업/금융</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="job" value="공무원" ' + (dto.job === '공무원' ? 'checked' : '') + '>';
       tag += '                <span class="resText">공무원</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="job" value="사기업" ' + (dto.job === '사기업' ? 'checked' : '') + '>';
       tag += '                <span class="resText">사기업</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="job" value="교육직" ' + (dto.job === '교육직' ? 'checked' : '') + '>';
       tag += '                <span class="resText">교육직</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="job" value="예체능" ' + (dto.job === '예체능' ? 'checked' : '') + '>';
       tag += '                <span class="resText">예체능</span>';
       tag += '            </label>';
       tag += '        </div>';
       tag += '    </div>';
       tag += '    <div>';
       tag += '        <h2>연봉</h2>';
       tag += '<select class="numberInput" name="salary">';
       tag += '<option>======= 연봉 선택 =======</option>';
       tag += '<option value="2999" ' + (dto.salary <= 2999 ? 'selected' : '') + '>3천만원 이하</option>';
       tag += '<option value="3000" ' + (dto.salary === 3000 ? 'selected' : '') + '>3-4000만원</option>';
       tag += '<option value="4000" ' + (dto.salary === 4000 ? 'selected' : '') + '>4-5000만원</option>';
       tag += '<option value="5000" ' + (dto.salary === 5000 ? 'selected' : '') + '>5000만원 ~ 1억원</option>';
       tag += '<option value="10000" ' + (dto.salary === 10000 ? 'selected' : '') + '>1억원 이상</option>';
       tag += '</select>';
       tag += '    </div>';
       tag += '    <div>';
       tag += '        <h2>종교</h2>';
       tag += '        <div class="wrap">';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="religion" value="무교" ' + (dto.religion === '무교' ? 'checked' : '') + '>';
       tag += '                <span class="resText">무교</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="religion" value="기독교" ' + (dto.religion === '기독교' ? 'checked' : '') + '>';
       tag += '                <span class="resText">기독교</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="religion" value="불교" ' + (dto.religion === '불교' ? 'checked' : '') + '>';
       tag += '                <span class="resText">불교</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="religion" value="천주교" ' + (dto.religion === '천주교' ? 'checked' : '') + '>';
       tag += '                <span class="resText">천주교</span>';
       tag += '            </label>';
       tag += '            <label class="resOption">';
       tag += '         <input type="radio" name="religion" value="기타" ' + (dto.religion === '기타' ? 'checked' : '') + '>';
       tag += '                <span class="resText">기타</span>';
       tag += '            </label>';
       tag += '        </div>';
       tag += '    </div>';
       tag += '    <div>';
       tag += '        <h2>부동산 보유여부</h2>';
       tag += '      <input class="numberInput" type="number" name="estate" placeholder="보유수를 입력하세요" value="' + dto.estate + '" required>';
       tag += '    </div>';
       tag += '    <div>';
       tag += '        <h2>자가용 보유여부</h2>';
       tag += '      <input class="numberInput" type="number" name="owncar" placeholder="보유수를 입력하세요" value="' + dto.owncar + '" required>';
       tag += '    </div>';
       tag += '    <div>';
       tag += '        <h2>프로필 사진</h2>';
       tag += '        <div class="profile">'
       tag += '         <div class="preview" style=\"background-image: url(\'' + cpath + '/upload/' + profile +  '\')\; background-position: center; background-size: 100%;">';
       tag += '            </div>';
       tag += '            <input id="profileReg" type="file" name="upload" onchange="previewHandler(event)" placeholder="프로필 이미지 선택" style="margin-top: 10px;" required>';
       tag += '        </div>';
       tag += '    </div>';
       tag += '   <p style="width: 500px; font-size: 13px; color: #105dae;">등급</p>'            
       tag += '         <input class="inputframe" type="text" value="' + dto.grade + '" name="grade" required>';
       tag += '    <div>';
       tag += '        <h2>자기소개</h2>';
       tag += '      <textarea name="introduce" class="introduce" placeholder="자기소개를 작성하세요." required>' + dto.introduce + '</textarea>';
       tag += '    </div>';
       tag += '    <div class="modifyBtn">';
       tag += '        <button id="specmodifyBtn" type="submit">스펙 수정</button>';
       tag += '     </div>';
       tag += '</form>';
       
//        content.innerHTML += tag
       
        contentDiv.innerHTML = tag;
    }
    
    getSpec()
    
    const form = document.forms[0]
    form.onsubmit = async function(event){
       event.preventDefault()
       const closeBtn = document.getElementById('close')
       const modal = document.querySelector('.modal')
       
       const closeclickHandler = function(event){
    	   modal.classList.add('hidden')
       }
       const flag = confirm('정말로 변경하시겠습니까?')
       if(flag){
    	   swal.fire({
               title: '수정성공',
               html: '수정이 완료되었습니다. <br> 등급 재측정은 최대 2일간 소요됩니다.',
               icon: 'success',
               confirmButtonText: '확인'
            })
       }
       const url = cpath + '/member/spec?userid=' + user
       
       const formData = new FormData(event.target)
       
       // 기존의 등급을 제거한 후,
       formData.delete('grade');
       
       // 등급을 U로 설정
       formData.append('grade', 'U')
       
       const opt = {
          method: 'POST',
          body: formData,
//           headers: {
//                'Content-Type' : 'multipart/form-data; charset=utf-8'
//             }
       }
       body: JSON.stringify({ grade: 'U' }) // "U" 값을 전달
       
       const result = await fetch(url, opt).then(resp => resp.text())
       if(result == 1){
          specModify()
       }
    }
}