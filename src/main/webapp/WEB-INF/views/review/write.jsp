<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
	section {
	    padding-top: 95px;
	    width: 100%;
	    height: 920px;
	    justify-content: center;
	   
	}
	#nocontent {
	    content: "";
	    width: 100px;
	    height: 5px;
	    background-color: #105dae;
	    position: absolute;
	    left: 50%;
	    margin-left: -50px;
	}
	#marriageReview_inner{
	    width: 750px;
	    height: 750px;
/* 	    border: 1px solid grey; */
	    margin: 50px auto;
	}
	textarea[name="content"]{
		width: 700px;
		height: 400px;
		resize: none;
	}
	footer {
        position: absolute !important;
        bottom: -1000px !important;
    }

</style>
<section>
	<div>
		<h1 style="text-align: center;">성혼커플 인터뷰 작성</h1>
		<span id="nocontent"></span>
	</div>
	<div id="marriageReview_inner">
		<form method="POST" enctype="multipart/form-data">
			<p><input type="text" name="title" placeholder="제목" required autofocus></p>
			<p><input type="text" name="writer" value="${login.userid }" readonly></p>
			<div><textarea name="content" placeholder="글을 작성하세요"></textarea></div>
			<p><input type="file" name="upload" required></p>
			<p><input type="submit" value="작성"></p>
		</form>
    </div>

</section>

<%@ include file="../footer.jsp" %>
</body>
</html>