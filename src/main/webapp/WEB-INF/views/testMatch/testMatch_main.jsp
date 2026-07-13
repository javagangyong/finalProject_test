<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	#backSection {
		width: 100%;
		height: 963px;
		margin: 95px auto 0 auto;
		background-image: url('${cpath}/resources/image/duoScreen3.png');
		background-size: 1700px auto;
		background-position: center;
		background-repeat: no-repeat;
		position: relative;
	}
	#letsWedding {
		position: absolute;
		left: 43%;
		bottom: 150px;
	}
	#matchFont {
		border-color: inherit;
		width: 200px;
		height: 65px;
		font-size: 20px;
		border-radius: 27px;
		font-weight: 600;
		background: #F5F5DC;
		box-shadow: 0px 9px 10px rgba(0,0,0, 0.16);
	}
	#matchFont:hover {
		cursor: pointer;
		background: #D8D9C4;
	}

</style>



<section id="backSection">
	
	<form id="letsWedding" method="post">
		<input type="submit" id="matchFont" value="결혼시도하러가기">
		<input type="hidden" value="${dto.gender }" name="gender">
		<input type="hidden" value="${dto.userid }" name="userid">
		<input type="hidden" value="${dto.grade }" name="grade">
		<input type="color">
	</form>

</section>










<%@ include file="../footer.jsp" %>