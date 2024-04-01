<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${login.isManager == 1}">
        <%@ include file="managerheader.jsp"%>
    </c:when>
    <c:otherwise>
        <%@ include file="header.jsp" %>
    </c:otherwise>
</c:choose>
<style>
   #ch_main {
      position: absolute;
      top: -200px;
      left: 0;
      z-index : 0;
      width: 100%;
      height: 1200px;
   }
   
   video {
      width: 100%;
      height: 100%;
   }
   
   #ch_member_slide {
   	  position: absolute;
   	  top: 1000px;
   	  width: 130%;
   	  height: 800px;
   	  background-color: white;
   	  opacity: 0.6;
   }
   
   .profiles {
   	  width: 200%;
   	  display: flex;
   }
   
   #ch_member_women {
	  position: absolute;
      top: 0;
      left: 0px;
   }
   
   #ch_member_men {
   	  position: absolute;
   	  top: 55%;
   	  left: -2446px;
   }
   
   .ch_profile_img {
   	  width: 400px;
   	  height: 400px;
   	  background-size: cover;
      background-position: center;
      display: flex;
      justify-content: center;
      align-items: center;
   	  box-sizing: border-box;
   	  padding: 5px;
   	  box-shadow: 1px 1px 10px grey;
   	  margin-right: 15px;
   }
   
   #ch_member_text {
   		position: absolute;
   		top: 155%;
   		left: 50%;
   		transform: translate(-50%, -50%);
   		z-index: 3;
   }
   
   #ch_member_text > h1 {
   		font-size: 60px;
   		font-weight: bold;
   		text-align: center;
   }
   
   footer {
       position: absolute;
      bottom: -50%;
       
   }
</style>
<script src="${cpath }/resources/js/home.js"></script>
<section id="ch_main">
   <video src="${cpath }/upload/duseo_main.mp4" autoplay loop muted></video>
</section>

<section id="ch_member_slide">
	<div class="profiles" id="ch_member_women">
		<c:forEach var="img" items="${wProfiles }">
			<div class="ch_profile_img" style="background-image: url('${cpath}/upload/${img}');"></div>
		</c:forEach>
	</div>
	<div class="profiles" id="ch_member_men">
		<c:forEach var="img" items="${mProfiles }">
			<div class="ch_profile_img" style="background-image: url('${cpath}/upload/${img}');"></div>
		</c:forEach>
	</div>
</section>

<div id="ch_member_text">
	<h1>듀세요는 현재 21,372명의</h1>
	<h1>회원과 함께하고 있습니다!</h1>
</div>

<script>
	let waitCount = '${wait_count}'
		
	if(waitCount != '') {
		setTimeout(showConfirm, 500)
	}

	document.addEventListener('DOMContentLoaded', function() {
	    setInterval(profileSlideHandlerW, 10);
	});
	
	document.addEventListener('DOMContentLoaded', function() {
	    setInterval(profileSlideHandlerM, 10);
	});
</script>
<%@ include file="footer.jsp" %>
</body>
</html>