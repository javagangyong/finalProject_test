<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<style>

   section {
       padding-top: 95px;
       width: 100%;
       height: 920px;
       justify-content: center;
   }
   #purchaseTitle{
         width: 918px;
         margin: 90px auto;
       text-align: center;
       font-size: 2.5rem;
   }
   #purchaseSubTitle {
         color: gray;
         text-align: center;
         font-size: 13px;
   }
   #purchaseGold,
   #purchaseStar,
   #purchasePM,
   #purchaseVIP {
         width: 918px;
         margin: 30px auto;
         display: flex;
         justify-content: center;
   }
   #goldBtn,
   #starBtn,
   #premiumBtn,
   #vipBtn {
         height: 184px;
         width: 100%;
         background-color: #50B8DB;
   }
   #starBtn {
         background-color: #336894;
   }
   #premiumBtn {
            background-color: #444C7B;
   }
   #vipBtn{
         background-color: #362546;
   }
   #goldBtn:hover,
   #starBtn:hover,
   #premiumBtn:hover,
   #vipBtn:hover {
         cursor: pointer;
         transform: scale(1.009);
   }
   .purchaseContent_right {
         height: 184px;
         width: 100%;
         border: 1px solid #e7e7e7;
         margin: auto;
   }
   .purchaseContent_right_all {
         display: flex;
      margin: 18px 100px;   
   }
   .purchasecomment {
         font-size: 13.5px;
   }
   .purchaseContent_left {
         color: white;
         border: 1px solid white;
         width: 130px;
         margin: 35px auto;
         padding: 10px;
         text-align: center;
   }

   .purchaseContent_price {
         color: white;
         font-size: 16.5px;
         text-align: center;
   }
   footer {
    position: absolute !important;
    bottom: -1200px !important;
	}

   

</style>
<script>
	const email = '${login.email}'
	const phoneNumber = '${login.phoneNumber}'
</script>
<script src="${cpath }/resources/js/purchase.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<section>
   <div id="purchaseTitle">멤버십 서비스 결제</div>
   <div id="purchaseSubTitle">* 서비스 이름을 클릭하면 결제창으로 넘어갑니다.</div>
   <div id="purchaseGold">
      <div id="goldBtn">
         <div class="purchaseContent_left">GOLD 서비스</div>
         <p class="purchaseContent_price">가입비 : 
            <strong>1,500,000원</strong> (vat 포함)</p>
      </div>
      <div class="purchaseContent_right">
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment" style="font-weight: bold;">상대방 매칭권 5회 제공</div>
         </div>
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment">정회원 전용 멤버스클럽 이용</div>
         </div>
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment">회원 전용 미팅 파티</div>
         </div>
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment">만남 전 상대 회원 프로필 사진 제공</div>
         </div>
      </div>
   </div>
   <div id="purchaseStar">
      <div id="starBtn">
         <div class="purchaseContent_left">STAR 서비스</div>
         <p class="purchaseContent_price">가입비 : 
            <strong>2,500,000원</strong> (vat 포함)</p>
      </div>
      <div class="purchaseContent_right">
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment" style="font-weight: bold;">상대방 매칭권 10회 제공</div>
         </div>
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment">정회원 전용 멤버스클럽 이용</div>
         </div>
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment">회원 전용 미팅 파티</div>
         </div>
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment">만남 전 상대 회원 프로필 사진 제공</div>
         </div>
      </div>
   </div>
   <div id="purchasePM">
      <div id="premiumBtn">
         <div class="purchaseContent_left">PREMIUM 서비스</div>
         <p class="purchaseContent_price">가입비 : 
            <strong>4,500,000원</strong> (vat 포함)</p>
      </div>
      <div class="purchaseContent_right">
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment" style="font-weight: bold;">상대방 매칭권 20회 제공</div>
         </div>
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment">정회원 전용 멤버스클럽 이용</div>
         </div>
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment">회원 전용 미팅 파티</div>
         </div>
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment">만남 전 상대 회원 프로필 사진 제공</div>
         </div>
      </div>
   </div>
   <div id="purchaseVIP">
      <div id="vipBtn">
         <div class="purchaseContent_left">VIP 서비스</div>
         <p class="purchaseContent_price">가입비 : 
            <strong>6,000,000원</strong> (vat 포함)</p>
      </div>
      <div class="purchaseContent_right">
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment" style="font-weight: bold;">상대방 매칭권 30회 제공</div>
         </div>
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment">정회원 전용 멤버스클럽 이용</div>
         </div>
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment">회원 전용 미팅 파티</div>
         </div>
         <div class="purchaseContent_right_all">
            <div class="checkList"><img src="${cpath }/resources/image/체크리스트.png"></div>
            <div class="purchasecomment">만남 전 상대 회원 프로필 사진 제공</div>
         </div>
      </div>
   </div>
</section>

<script>

var IMP = window.IMP; 
IMP.init("imp54062385");   // 가맹점 식별코드

const goldBtn = document.getElementById('goldBtn')

goldBtn.onclick = goldRequestPay

const starBtn = document.getElementById('starBtn')

starBtn.onclick = starRequestPay

const premiumBtn = document.getElementById('premiumBtn')

premiumBtn.onclick = premiumRequestPay

const vipBtn = document.getElementById('vipBtn')

vipBtn.onclick = vipRequestPay

</script>


<%@ include file="../footer.jsp" %>
</body>
</html>