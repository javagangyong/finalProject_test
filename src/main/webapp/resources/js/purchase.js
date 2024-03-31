function goldRequestPay() {
IMP.request_pay({
    pg : 'html5_inicis.INIpayTest', 
    pay_method : 'card',
    merchant_uid: 'duo_' + new Date().getTime() , //상점에서 생성한 고유 주문번호
    name : 'GOLD',
    amount : 100,
    buyer_email : email,
    buyer_name : username,
    buyer_tel : phoneNumber,      
}, function(rsp) { // callback 로직
   console.log(rsp);
   if(rsp.success){
      var msg = '결제가 완료되었습니다.';
      var result = {
         "userid": user,   // 아이디
         "type": rsp.name,         // 멤버십타입
         "payNum": rsp.merchant_uid,   // 결제번호
         "payMethod": rsp.pay_method,   // 결제방법
         "price": rsp.paid_amount,         // 결제금액
         "matchCount": '5',      // 횟수
      }
      console.log(result);
      console.log(1, rsp);
      $.ajax({
             url:'insertMPayGold',
             type:'POST',
             contentType: 'application/json',
             data:JSON.stringify(result),
             success: function (res) {
               console.log(res);
               location.href=res;
             },
             error: function (err) {
               console.log(err);
             }
           }); //ajax
         } else {
             var msg = '결제 실패';
             msg += '\n에러내용 : ' + rsp.error_msg;
           }
         alert(msg);
      });
   }

function starRequestPay() {
IMP.request_pay({
    pg : 'html5_inicis.INIpayTest', 
    pay_method : 'card',
    merchant_uid: 'duo_' + new Date().getTime() , //상점에서 생성한 고유 주문번호
    name : 'STAR',
    amount : 100,
    buyer_email : email,
    buyer_name : username,
    buyer_tel : phoneNumber,       
}, function(rsp) { // callback 로직
   console.log(rsp);
   if(rsp.success){
      var msg = '결제가 완료되었습니다.';
      var result = {
         "userid": user,   // 아이디
         "type": rsp.name,         // 멤버십타입
         "payNum": rsp.merchant_uid,   // 결제번호
         "payMethod": rsp.pay_method,   // 결제방법
         "price": rsp.paid_amount,         // 결제금액
         "matchCount": '10'      // 횟수
      }
      console.log(result);
      $.ajax({
             url:'insertMPayStar',
             type:'POST',
             contentType: 'application/json',
             data:JSON.stringify(result),
             success: function (res) {
               console.log(res);
               location.href=res;
             },
             error: function (err) {
               console.log(err);
             }
           }); //ajax
         } else {
             var msg = '결제 실패';
             msg += '\n에러내용 : ' + rsp.error_msg;
           }
         alert(msg);
      });
   }


function premiumRequestPay() {
IMP.request_pay({
    pg : 'html5_inicis.INIpayTest', 
    pay_method : 'card',
    merchant_uid: 'duo_' + new Date().getTime() , //상점에서 생성한 고유 주문번호
    name : 'PREMIUM',
    amount : 100,
    buyer_email : email,
    buyer_name : username,
    buyer_tel : phoneNumber,
}, function(rsp) { // callback 로직
   console.log(rsp);
   if(rsp.success){
      var msg = '결제가 완료되었습니다.';
      var result = {
         "userid": user,   // 아이디
         "type": rsp.name,         // 멤버십타입
         "payNum": rsp.merchant_uid,   // 결제번호
         "payMethod": rsp.pay_method,   // 결제방법
         "price": rsp.paid_amount,         // 결제금액
         "matchCount": '20'      // 횟수
      }
      console.log(result);
      $.ajax({
             url:'insertMPayPm',
             type:'POST',
             contentType: 'application/json',
             data:JSON.stringify(result),
             success: function (res) {
               console.log(res);
               location.href=res;
             },
             error: function (err) {
               console.log(err);
             }
           }); //ajax
         } else {
             var msg = '결제 실패';
             msg += '\n에러내용 : ' + rsp.error_msg;
           }
         alert(msg);
      });
   }

function vipRequestPay() {
IMP.request_pay({
    pg : 'html5_inicis.INIpayTest', 
    pay_method : 'card',
    merchant_uid: 'duo_' + new Date().getTime() , //상점에서 생성한 고유 주문번호
    name : 'VIP',
    amount : 100,
    buyer_email : email,
    buyer_name : username,
    buyer_tel : phoneNumber,      
}, function(rsp) { // callback 로직
   console.log(rsp);
   if(rsp.success){
      var msg = '결제가 완료되었습니다.';
      var result = {
         "userid": user,   // 아이디
         "type": rsp.name,         // 멤버십타입
         "payNum": rsp.merchant_uid,   // 결제번호
         "payMethod": rsp.pay_method,   // 결제방법
         "price": rsp.paid_amount,         // 결제금액
         "matchCount": '30'      // 횟수
      }
      console.log(result);
      $.ajax({
             url:'insertMPayVip',
             type:'POST',
             contentType: 'application/json',
             data:JSON.stringify(result),
             success: function (res) {
               console.log(res);
               location.href=res;
             },
             error: function (err) {
               console.log(err);
             }
           }); //ajax
         } else {
             var msg = '결제 실패';
             msg += '\n에러내용 : ' + rsp.error_msg;
           }
         alert(msg);
      });
   }


