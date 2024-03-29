function profileToggle() {
    const profile = document.getElementById('ch_oponent_profile')
    const overlay = document.getElementById('ch_profile_overlay')
    const reqUseroverlay = document.getElementById('reqUseroverlay')
    profile.classList.toggle('ch_height_toggle')
    overlay.classList.toggle('ch_height_toggle')
    reqUseroverlay.classList.toggle('hidden')
}

async function onReceive(chat) {
   const content = JSON.parse(chat.body);
   const text = content.text;
   const userid = content.from;
   const respUser = content.to;
           
   if (text.includes('수락')) {
      swal.fire({
         title: '매칭성사',
         text: userid + '님이 매칭을 수락하셨습니다! 채팅창을 확인해보세요~',
         icon: 'success',
         confirmButtonText: '확인'
      }).then((result) => {
          if (result.isConfirmed) {
              location.reload();
          }
      });
      return;
   } else if (text.includes('거부')) {
      swal.fire({
         title: '매칭거부됨',
         text: userid + '님이 매칭을 거부하셨습니다 ㅠ-ㅠ',
         icon: 'error',
         confirmButtonText: '닫기'
      });
      return;
   }
           
   const reqUseroverlay = document.querySelector('.reqUseroverlay');
   const profile = document.getElementById('ch_oponent_profile');


   const url = cpath + '/matchAjax/userInfo/' + userid;
   const info = await fetch(url).then(resp => resp.json());
      
   let year = new Date();
   profile.innerHTML = '';
   let profileURL = cpath + '/upload/' + info.profile;
   let tag = '';
   tag += '<div id="ch_oponent_img">';
   tag +=    '<div style="margin-top: 15px; background-image: url(\'' + profileURL +'\')">';
   tag +=    '</div>';
   tag += '</div>';
   tag += '<div id="ch_oponent_detail">';
   tag +=    '<p>' + info.username + ' (' + (year.getFullYear() - info.birthYear + 1) + ' 세)' + '</p>';
   tag +=    '<p>' + info.birthYear + '년 ' + info.birthMonth + '월 ' + info.birthDay + '일생' + '</p>';
   tag +=    '<p>결혼여부 : ' + (info.marriedCount == 0 ? '없음' : (info.marreidCount == 1 ? '1회 있음' : '2회 이상') ) + '</p>';
   tag +=    '<p>거주지역 : ' + info.residence + '</p>';
   tag +=    '<p>직업 : ' + info.job + '</p>';
   
   const salarys = {
            "2999" : "3000만원 이하",
            "3000" : "3천만원대",
            "4000" : "4천만원대",
            "5000" : "5천이상 ~ 1억원 이하",
            "10000" : "1억원 이상"
   };
   
   tag +=    '<p>연봉 : ' + salarys[info.salary] + '</p>';
   tag +=    '<p>종교 : ' + info.religion + '</p>';
   tag +=    '<p style="font-size: 20px; margin-top: 10px;">자기소개</p>';
   tag +=    '<pre>' + info.introduce + '</pre>';
   tag += '   <div class="tryMatchSb">';
   tag += '       <div class="consent">수락</div>';
   tag += '       <div class="refuse">거절</div>';
   tag += '       <div class="defer">보류</div>';
   tag += '   </div>';
   tag += '</div>';
      
   
   profile.innerHTML = tag;
   
   profileToggle();
   
   const consent = document.querySelector('.consent');
   const refuse = document.querySelector('.refuse');
   const defer = document.querySelector('.defer');
   
   consent.onclick = async function(event) {
         const consentUrl = cpath + '/matchAjax/consent?reqUser=' + userid + '&respUser=' + respUser;
         console.log(consentUrl);
         
         const consentRow = await fetch(consentUrl).then(resp => resp.text());
         
         if(consentRow === '1') {
            profileToggle();
            stomp.send('/broker/' + userid, {}, JSON.stringify({
               from: username,
               text: '매칭수락'
            }));
            swal.fire({
               title: '매칭성사',
               text: '매칭이 성사되어 채팅방이 열렸습니다! 확인해보세요~',
               icon: 'success',
               confirmButtonText: '확인'
            }).then((result) => {
               if (result.isConfirmed) {
                  location.reload();
               }
            }); 
         }
   };
   
   
   refuse.onclick = async function(event) {
         stomp.send('/app/refuseMessage/' + userid, {}, JSON.stringify({
            from: username,
            text: '매칭거부'
         }));
   
         const refuseUrl = cpath + '/matchAjax/refuse?reqUser=' + userid + '&respUser=' + respUser;
         console.log(refuseUrl);
   
         const row = await fetch(refuseUrl).then(resp => resp.text());
   
         if(row === '1') {
            profileToggle();
         } else {
            alert('거절 실패 !');
         }
   };
   
   
   
   defer.onclick = function(event) {
         profileToggle();
         alert('매칭을 보류했어요 ! 마이 매칭을 확인하세요 :)');
   };

}
