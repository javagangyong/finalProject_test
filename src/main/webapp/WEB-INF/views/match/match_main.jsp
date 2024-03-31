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
   		background-image: url('${cpath}/resources/image/duoScreen.png');
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
</style>



<section id="match_main_section">
	<div class="matchBtn">
	   <form method="POST">
	      <input type="hidden" name="userid" value="${dto.userid }">
	      <input type="hidden" name="username" value="${dto.username }">
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