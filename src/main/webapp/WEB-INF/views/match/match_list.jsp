<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src="${cpath }/resources/js/matchlist.js"></script>
<style>
   #match_list_section {
       padding-top: 95px;
       width: 100%;
       height: 920px;
       justify-content: center;
   }
   
   #kdnocontent {
       content: "";
       width: 100px;
       height: 5px;
       background-color: #105dae;
       position: absolute;
       left: 50%;
       margin-left: -50px;
   }
   
   .matchListBox {
/*       border: 1px solid black; */
       width: 1200px;
       height: 100%;
       margin: auto;
       padding-top: 20px;
       position: relative;
   }
   
   #matchList {
      display: flex;
      flex-flow: wrap;
      margin: auto;
   }
   
   .matchContent {
      padding: 5px 30px;
      margin-top: 10px;
   }
   
   .matchImg {
      background-size: auto 100%;
      display: block;
      width: 340px;
      height: 440px;
      cursor: pointer;
   }
   
   .matchContent > div {
      text-align: center;
   } 
    
    
    .alreadyMatch {
/*        position: absolute; */
/*        bottom: 10px; */
/*        left: 32%; */
       text-align: center;
       font-size: 15px;
       color: black;
/*        width: 192px; */
/*        height: 60px; */
    }
    
    
    
    
    
    
    
    
    
   	#ch_oponent_profile {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		box-shadow: 1px 1px 15px ${login.gender == '남성' ? 'hotpink' : 'skyblue'};
		border-radius: 15px;
		width: 35%;
		height: 0px;
		z-index: 5;
		transition-duration: 1.2s;
		overflow-y: hidden;
	}
	
	#ch_oponent_profile > div {
		width: 100%;
		height: 50%;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	#ch_oponent_profile > div:nth-child(2) {
		justify-content: flex-start;
		align-items: flex-start;
	}
	
	#ch_profile_overlay {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		border-radius: 15px;
		width: 35%;
		height: 0px;
		background-color: white;
		z-index: 4;
		transition-duration: 1s;
	}
	
	.ch_height_toggle {
		height: 96% !important;
	}
	
	#ch_profile_close {
		all: unset;
		color: white;
		font-size: 15px;
		font-weight: bold;
		position: absolute;
		bottom: 5px;
		right: 10px;
	}
	
	#ch_oponent_img > div {
		width: 350px;
		height: 350px;
		border-radius: 50%;
		box-shadow: 1px 1px 15px grey inset;
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
	
	#ch_oponent_detail {
		width: 100%;
	}
	
	#ch_oponent_detail > p {
		margin: 2px auto;
		width: fit-content;
		font-size: 17px;
		font-weight: bold;
		color: white;
	}
	
	#ch_oponent_detail > pre {
		margin: 5px auto;
		color: white;
		font-size: 15px;
		font-weight: bold;
		width: 300px;
		height: 120px;
		white-space: pre-wrap; 
    	word-wrap: break-word; 
		box-sizing: border-box;
		border-radius: 15px;
		box-shadow: 1px 1px 40px ${login.gender == '남성' ? 'hotpink' : 'skyblue'} inset;
		padding: 10px;
	}
	
	.ch_bg_women {
		background-color: rgba(242, 140, 191, 0.4);
	}
	.ch_bg_men {
		background-color: rgb(135, 206, 235, 0.4);
	}
	
	.tryMatch {
		all: unset;
		display: inline-block;
		width: 60px;
		height: 30px;
		text-align: center;
		border-radius: 5px;
		font-size: 14px;
		font-weight: bold;
		color: black;
	}
	.tryMatch_bg_women {
		background-color: #98CEFA;
	}
	.tryMatch_bg_men {
		background-color: #FF96D0;
	}h
	
	.tryMatch:hover {
		cursor: pointer;
		background-color: rgba(0, 0, 0, 0.7);
	}
	
	#kdoverlay {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		z-index: 2;
	}
	
	
	
	
	
	
	
	.possibleMatch {
		position: absolute;
		right: 65px;
		top: 0px;
	}

</style>

<section id="match_list_section">
   <div>
      <h1 style="text-align: center;">추천 매칭 상대</h1>
      <span id="kdnocontent"></span>
   </div>
   <div class="matchListBox">
   	  <div class="possibleMatch"></div>
      <div id="matchList">
         <c:forEach var="dto" items="${list }">
            <div class="matchContent">
               <div onclick="kdprofileLoadHandler(event)" class="matchImg" value="${dto.userid }" style="background-image: url('${cpath}/upload/${dto.profile}');"></div>
               <div>이름 : ${dto.username }</div>
               <div>${dto.birthYear }년 ${dto.birthMonth }월 ${dto.birthDay }일생</div>
               <div>등급 : ${dto.grade }</div>
            </div>
         </c:forEach>
      </div>
   </div>
</section>

<div class="${login.gender == '남성' ? 'ch_bg_women' : 'ch_bg_men' }" id="ch_oponent_profile">
	
</div>

<div id="ch_profile_overlay">

</div>

<div id="kdoverlay" class="hidden"></div>


</body>
</html>