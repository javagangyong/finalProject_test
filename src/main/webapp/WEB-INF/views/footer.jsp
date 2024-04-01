<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {
	text-decoration: none;
	color: inherit;
}
 footer { 
/*     position: absolute;  */
    bottom: 0;  
    left: 0;
    width: 100%; 
    background-color: #003458; 
    color: white; 
    height: 480px; 
  	padding: 0;      
 } 
#policyList {
/* 	width: 1395px; */
	display: flex;
	justify-content: space-around;
	padding: 3px;
	font-size: 12px;
	border-bottom: 1px solid lightgrey;
	list-style: none;
	
}

#policyList>li {
	
}

#company_info {
	margin-top: 50px;
	font-size: 13px;
	padding-left: 30px;
}
.footerSection {
	padding-top: 35px;
    width: 100%;
    height: 400px;
}
#askMarriage {
	display: flex;
	justify-content: space-between;
    padding: 30px;
}
#askContact {
	display: flex;
	justify-content: space-between;
	width: 180px;
	align-items: center;
	
}
#askSunday {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 245px;
}
#callIcon {
	display: flex;

}
#callIcon > img{
	max-height: 30px; 
}
#company_info_img > img {
	max-height: 100px; 
}
#company_info_context {
	display: flex;
	justify-content: space-between;
}
.company_info_fake {
	border: 1px solid white;
    width: 130px;
    height: 40px;
    margin: auto auto;
    display: flex;
    align-items: center;
    justify-content: center;
}
#askMarriage {
	display: flex;
	justify-content: space-between;
}
#askAll {
	display: flex;
	justify-content: space-between;
	width: 500px;
}
#socialAll {
	display: flex;
	justify-content: space-around;
	width: 200px;
}
.socialImg > img{
	max-height: 40px; 
}
</style>
</head>
<body>

<footer>
	<div style="width: 1200px; margin: 0 auto;">
	<section class="footerSection">
		<div id="askMarriage">
			<div id="askAll">
				<div id="askContact">
					<div style="font-weight: 500;">상담문의</div>
					<div>070-1234-5678</div>
				</div>
				<div id="askSunday">
					<div id="callIcon"><img src="${cpath }/resources/image/전화.png"></div>
					<div>주말 및 공휴일 상담 예약 가능</div>
				</div>
			</div>
			<div id="socialAll">
				<div class="socialImg"><img src="${cpath }/resources/image/인스타.png"></div>
				<div class="socialImg"><img src="${cpath }/resources/image/페이스북.png"></div>
				<div class="socialImg"><img src="${cpath }/resources/image/카카오톡.png"></div>
			</div>
		</div>
		<ul id="policyList">
		    <li><a href="" target="_blank">회사소개</a></li>
		    <li><a href="" target="_blank">지속가능경영</a></li>
		    <li><a href="" target="_blank">IR</a></li>
		    <li><a href="" target="_blank">채용정보</a></li>
		    <li><a href="" target="_blank">광고/제휴/출점문의</a></li>
		    <li><a href="">이용약관</a></li>
		    <li><a href="">편성기준</a></li>
		    <li><a href=""><strong>개인정보처리방침</strong></a></li>
		    <li><a href="">법적고지</a></li>
		    <li><a href="">이메일주소무단수집거부</a></li>
		    <li><a href="" target="_blank">윤리경영</a></li>
		    <li><a href="" class="empha-red">사이버감사실</a></li>
		</ul>
	    <div id="company_info">
	    	<div id="company_info_context">
		    	<div id="company_info_img"><img src="${cpath }/resources/image/듀세요로고2.png"></div>
				<div style="display: flex; justify-content: space-between; width: 300px; text-align: center;">
					<div class="company_info_fake">듀세요네트워크 ▼</div>
					<div class="company_info_fake" style="padding-left: 5px;">패밀리사이트 ▼</div>
				</div>	    	
	    	</div>
	    	<div>(04377)부산 해운대구 센텀2로 25, 센텀드림월드 11층
		    <br><strong>공동대표 : 옥창혁, 왕제은, 이경용, 정다빈</strong>
		    <br>결혼중개업 사업자등록번호 : 104-81-45690 통신판매업신고번호 : 2017-부산-0662 사업자정보확인
		    <br>책임자 : 원종래 대표이메일 : dyuseyo@gmail.com
			<br>© dyuseyo All Rights Reserved
			</div>
	    </div>
	</section>
	</div>
</footer>

</body>
</html>