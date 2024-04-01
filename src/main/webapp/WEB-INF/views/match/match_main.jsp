<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
   .matchBtn {
/*       border: 1px solid black;  */
	  position: absolute;
	  bottom: 62px;
	  left: 50%;
      transform: translate(-50%);
   }
   
   #matchStart {
   	  border-color: inherit;
	  width: 355px;
      height: 67px; 
      background: #02C4A2;
      color: #fff;
      font-size: 31px;
      font-weight: 600;
      border-radius: 12px;
      box-shadow: 0px 9px 10px rgba(0,0,0, .16);
      cursor: pointer;
      font-family: 'Roboto';
   }
   
   #matchStart:hover {
   	  background: rgba(2, 162, 169);
   }
   
   
   
   #match_main_section {
   		width: 100%;
   		height: 669px;
   		margin-top: 93px;
   		background-image: url('${cpath}/resources/image/duoScreen2.png');
   		background-size: 1700px auto;
   		background-repeat: no-repeat;
   		background-position: center;
   		position: relative;
   }
/*    .font { */
/*    	  	font-family: '새굴림'; */
/*    	  	font-weight: 700; */
/*    	  	font-size: 40px; */
/*    	  	color: white; */
/*    	  	position: absolute; */
/*    	  	left: 770px; */
/*    	  	bottom: 50px; */
/*    } */

footer {
	position: relative !important;
}

@font-face {
    font-family: 'TTLaundryGothicB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/2403-2@1.0/TTLaundryGothicB.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

.mainFont, .mainFont2 {
	font-family: 'TTLaundryGothicB', sans-serif;
	color: white;
	
}
.mainFont {
	  position: absolute;
	  bottom: 423px;
	  left: 49%;
	  transform: translate(-48%);	
	  font-size: 53px;
	  text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.3);
}
.mainFont2 {
	  position: absolute;
	  bottom: 372px;
	  left: 51%;
	  transform: translate(-53%);	
	  font-size: 40px;
	  text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.3);
}

.mainFont3 {
	  position: absolute;
	  bottom: 297px;
	  left: 51%;
	  transform: translate(-55%);	
	  font-size: 24px;
	  color: white;
}

</style>



<section id="match_main_section">
	<div class="mainFont">이거 누르면</div>
	<div class="mainFont2">우리 사귀는거다?</div>
	<div class="mainFont3">매칭 프로필 확인하기</div>
	<div class="matchBtn">
	   <form method="POST">
	      <input type="hidden" name="userid" value="${dto.userid }">
	      <input type="hidden" name="gender" value="${dto.gender }">
	      <input type="hidden" name="grade" value="${dto.grade }">
	      <input type="submit" id="matchStart" value="start ›">
	   </form>
	</div>
<!-- 	<div class="font"> -->
<!-- 		이거 누르면 -->
<!-- 	</div> -->
</section>

<script>
</script>

<%@ include file="../footer.jsp" %>