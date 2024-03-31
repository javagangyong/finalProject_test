<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
body, html { 
   height: 100%; 
   margin: 0; 
   display: flex; 
   justify-content: center; 
   align-items: center;
        }
aside {
   position: fixed;
   top: 100px;
   left: 0;
   width: 20%;
   height: 100%;
/*    background-color: lightgray; */
   box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3); 
/*    z-index: 3; */
   transition-duration: 0.5s;
}

aside>* {
   margin: 20px;
}

#root {
   display: flex;
   width: 156px;
   padding: 0;
}

aside>div.item {
   text-align: center;
   height: 30px;
   border-bottom-color: white;
}

aside>div.item.selected {
   font-weight: bold;
   color: #FD2B75;
}

aside>div.item:hover {
   cursor: pointer;
   background-color: #FB4357;
   color: white;
}

div.content {
   position: relative;
   top: 150px;
   left: -88%;
   justify-content: center;
   align-items: center;
}

mpmodify {
   padding-top: 95px;
   width: 100%;
   height: 920px;
   display: flex;
   justify-content: center;
}

.mpmodify_inner {
   width: 700px;
   margin-top: 80px;
   margin-bottom: 150px;
}

#mpmodifyForm {
   position: relative;
   display: flex;
   flex-flow: column;
   justify-content: center;
   align-items: center;
}

label {
   width: 248px;
   height: 50px;
   border: 1px solid lightgrey;
   position: relative;
   color: lightgray;
}

label:first-child {
   margin-right: 5px;
}

input[type="radio"] {
   all: unset;
   display: inline-block;
   position: absolute;
   width: 250px;
   height: 50px;
}

input[type="radio"]:checked+span {
   background-color: #105dae;
}

.radiotext {
   position: absolute;
   display: flex;
   width: 250px;
   height: 50px;
   justify-content: center;
   align-items: center;
}


button:hover {
   cursor: pointer;
}

#mpmodifyBtn:disabled {
   background-color: lightgrey;
   cursor: not-allowed;
}

#mpmodifyForm>* {
   margin-top: 15px;
   width: 501px;
}

p {
   margin: 0;
   margin-top: 5px;
}

.birthday>select {
   width: 165px;
   height: 50px;
   border: 1px solid lightgrey;
   position: relative;
}

.modifyBtn {
   position: relative;
   display: flex;
   flex-flow: column;
   justify-content: center;
   align-items: center;
}

#mpmodifyBtn, #pwmodifyBtn, #specmodifyBtn, #withdrawBtn {
   margin-top: 20px;
   width: 400px;
   height: 50px;
   border: 1px solid lightgrey;
   background-color: #105dae;
   font-size: 20px;
   color: white;
   text-align: center;
   font-weight: bold;
}

header {
   color: black;
   border-bottom: 1px solid lightgrey;
}

.survey {
   padding: 95px;
   width: 700px;
   margin: 0 auto;
   margin-top: 150px;
}

.resOption {
   display: flex;
   position: relative;
   width: 250px;
   height: 40px;
   border: 1px solid lightgrey;
   background-color: white;
   box-sizing: border-box;
   margin-right: 10px;
   margin-top: 10px;
}

.resText {
   position: absolute;
   width: 100%;
   height: 40px;
   color: grey;
   font-size: 16px;
   display: flex;
   justify-content: center;
   align-items: center;
}

input[type="radio"] {
   all: unset;
   position: absolute;
   width: 100%;
   height: 40px;
}

input[type="radio"]:checked+.resText {
   color: white;
   background-color: #105dae;
}

.wrap {
   width: 900px;
   display: flex;
   flex-wrap: wrap;
}

.survey>form>div {
   margin-top: 40px;
}

.numberInput {
   width: 300px;
   height: 40px;
   text-align: center;
   font-size: 20px;
}

.survey input[type="file"] {
   border: 1px solid black;
   border-radius: 8px;
   width: 300px;
   height: 30px;
   box-sizing: border-box;
   padding: 3px 46px;
}

div.profile {
   height: 300px;
   position: relative;
   display: flex;
   flex-flow: column;
}

div.preview {
   position: absolute;
   margin-bottom: 10px;
   background-size: cover;
   background-repeat: no-repeat;
   background-position: center;
   top: 0;
   left: 0;
   display: flex;
/*    justify-content: center; */
/*    align-items: center; */
   width: 300px;
   height: 300px;
/*    border: 1px solid #ccc; */
   border-radius: 50%;
}

#profileReg {
   all: unset;
   position: absolute;
   top: 0;
   left: 0;
   width: 300px;
   height: 300px;
   border-radius: 50%;
   opacity: 0;
}

textarea.introduce {
   width: 100%;
   height: 200px;
   border: 1px solid grey;
   font-size: 15px;
   color: black;
   box-sizing: border-box;
   padding: 5px 5px;
}
#pwForm {
   position: relative;
   display: flex;
   flex-flow: column;
   justify-content: center;
   align-items: center;
}
#pwBtn, #cancleBtn {
   margin-top: 20px;
   margin-bottom: 10px;
   width: 400px;
   height: 50px;
   border: 1px solid lightgrey;
   background-color: #105dae;
   font-size: 20px;
   color: white;
   text-align: center;
   font-weight: bold;
}

#cancleBtn {
   background-color: #EEEEEE;
   margin-top: 0;
   color: #ABABAB;
}
.box {
	width: 300px;
	height: 250px;
	background-color: white;
	background-position: center;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
.overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

   form {
      width: 500px;
      font-size: 13px;
      color: #105dae;
     }
	.container {
/*       border: 1px solid #ccc; */
      padding: 20px;
      border-radius: 5px;
  }
/*     #myprofile { */
/*        	position: relative; */
/*        	display: flex; */
/*        	flex-flow: column; */
/*        	justify-content: center; */
/*        	align-items: center; */
/*          	} */
   .inputframe {
   		width: 500px;
   		height: 60px;
   		border: 1px solid lightgrey;
   		box-sizing: border-box;
   		padding: 5px 10px;
   		color: black;
   		font-size: 16px;
       }
    #specForm{
    	transform: translateY(600px);
    }   
</style>

<section id="root">
   <aside class="menu">
      <h3>마이페이지</h3>
      <div class="item selected">내 프로필</div>
      <div class="item">내 정보 수정</div>
      <div class="item">스펙 수정</div>
<!--       <div class="item">신고 목록</div> -->
<!--       <div class="item">내가 쓴 글</div> -->
   </aside>
   <div class="content"></div>
</section>

<div class="modal hidden">
	<div class="box">
		<p align="center">
			수정이 완료되었습니다. <br>
			등급 재측정은 최대 2일간 소요됩니다.		
		</p>
		<p align="center"><button id="close">닫기</button></p>
	</div>
</div>


<script>
   const menuItems = document.querySelectorAll('.menu > .item')
//    const contentItems = document.querySelectorAll('.content > .item')
    const content = document.querySelector('.content')
   

   const menuItemsHandler = (element, index) => {
      element.addEventListener('click', function(event) {
         menuItems.forEach(menuItem => menuItem.classList.remove('selected'))
//          contentItems.forEach(contentItem => contentItem.classList.remove('selected'))
         
         menuItems[index].classList.add('selected')
//          contentItems[index].classList.add('selected')
      })
   }
   
   menuItems.forEach(menuItemsHandler)
   
   const myProfileLoadHandler = async function() {
      var contentDiv = document.querySelector('.content')
      const url = '${cpath}/ajax/myprofile?userid=${login.userid}'
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
          tag += '         <div class="preview" style=\"background-image: url(\'' + cpath + '/upload/' + dto.profile +  '\')\; background-position: center; background-size: 100%;">';
          tag += '            </div>';
//           tag += '            <input id="profileReg" type="file" name="upload" placeholder="프로필 이미지 선택" style="margin-top: 10px;" required>';
          tag += '        </div>';
          tag += '    </div>';
          tag += '   <div>'
          tag += '   <p style="width: 500px; font-size: 13px; color: #105dae;">이름</p>'
          tag += '            <input class="inputframe" type="text" value="' + '${login.username}' + '" name="username" required>';
          tag += '   <p style="width: 500px; font-size: 13px; color: #105dae;">등급</p>'            
          tag += '         <input class="inputframe" type="text" value="' + dto.grade + '" name="grade" required>';
          tag += '   </div>'
          tag += '   <p style="width: 500px; font-size: 13px; color: #105dae;">아이디</p>'
          tag += '         <input class="inputframe" type="text" value="' + '${login.userid}' + '" name="userid" readonly required>';
          tag += '         <p>가입한 날짜 : ${login.joinDate}</p>'
          tag += '         <p style="margin-bottom: 20px;">최근 접속한 날짜 : ${login.lastLoginDate}</p>'
          tag += '</form>';
          
          contentDiv.innerHTML = tag;
      }
      
      getmyProfileInfo()
      
      const form = document.forms[0]
      form.onsubmit = async function(event) {
         event.preventDefault()
         const url = '${cpath}/ajax/myprofile?userid=${login.userid}'
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
   
   document.addEventListener('DOMContentLoaded', myProfileLoadHandler)
   
   menuItems[0].onclick = myProfileLoadHandler
   
   
   const myInfoLoadHandler = function() {
      const getmyInfo = function(){
         content.innerHTML = '';
         
         let tag = '';

            tag += '<div class="mpmodify">';
            tag += '    <div class="mpmodify_inner">';
            tag += '        <h1 style="padding-left: 160px;">회원 정보 수정</h1>';
            tag += '        <div>';
            tag += '            <form id="mpmodifyForm">';
            tag += '                <input class="inputframe" type="text" value="' + '${login.userid}' + '" name="userid" readonly required>';
            tag += '                <input class="inputframe" type="text" value="' + '${login.username}' + '" name="username" placeholder="이름" required>';
            tag += '                <div style="display: flex;">';
            tag += '                    <label>';
            tag += '                        <input type="radio" name="gender" value="남성"';
            tag += '${login.gender}' == '남성' ? ' checked' : '';
            tag += ' required>';
            tag += '                        <span class="radiotext">남성</span>';
            tag += '                    </label>';
            tag += '                    <label>';
            tag += '                        <input type="radio" name="gender" value="여성"';
            tag += '${login.gender}' == '여성' ? ' checked' : '';
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
            tag += '                <input class="inputframe" type="text" value="' + '${login.phoneNumber}' + '" name="phoneNumber" placeholder="전화번호" required>';
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
         const url = '${cpath}/ajax/mpmodify?userid=${login.userid}'
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
         location.href = '${cpath}/member/logout?mypage=1'
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

        tag += '      <input type="hidden" value="${login.userid}" name="userid">'
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
         const url = '${cpath}/ajax/newPw'
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
         location.href = '${cpath}/member/logout?mypage=1'
      }
     }
     
    // 회원 탈퇴

//     event.preventDefault()
     const withdrawBtn = document.getElementById('withdrawBtn');
    
     withdrawBtn.addEventListener('click', function(event) {
        event.preventDefault()
        location.href = '${cpath}/member/withdrawMember/${login.idx}'; 
     })
   
   }
   
   const selectHandler = function() {
      var loginBirthYear = "${login.birthYear}";
      var loginBirthMonth = "${login.birthMonth}";   
      var loginBirthDay = "${login.birthDay}";
       
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
   
   const myInfo = function() {
      myInfoLoadHandler()
      selectHandler()
   }
   
   


   menuItems[1].onclick = myInfo
   
   
   
   async function specModify() {
    var contentDiv = document.querySelector('.content')
    
    const url = '${cpath}/member/spec?userid=${login.userid}'
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
       tag += '         <input type="radio" name="marriedCount" value="0" ' + (dto.marriedCount === 0 ? 'checked' : '') + '>';;
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
       tag += '            <input id="profileReg" type="file" name="upload" placeholder="프로필 이미지 선택" style="margin-top: 10px;" required>';
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
    	   modal.classList.remove('hidden')
    	   closeBtn.onclick = closeclickHandler
       }
       const url = '${cpath}/member/spec?userid=${login.userid}'
       
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
    
    const inputFile = document.querySelector('input[name="upload"]')
   const preview = document.querySelector('.preview')
   
   function previewHandler(event) {
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
   
   inputFile.onchange = previewHandler
   preview.onchange = previewHandler
    
   
}
   
   menuItems[2].onclick = specModify


</script>


</body>
</html>