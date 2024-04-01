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
	#marriage_inner{
	    width: 1200px;
	    height: 100%;
	    margin: auto;
	}
	.marriageImg > a {
		background-size: auto 100%;
		display: block;
		width: 340px;
		height: 440px;
	}
	#marriageList {
		display: flex;
		flex-flow: wrap;
		margin: auto;
	}
	.marriageContent {
		padding: 5px 30px;
	}
/* 	#marriageWrite { */
/* 		width: 0; */
/* 		margin: auto; */
/* 	} */
	#marriageWriteBtn {
		width: 400px;
		height: 30px;
		margin: 35px 400px;
		border: white;
		color: black;
		padding: 5px 10px;
		font-size: 14px;
		font-weight: 300;
	}
	#marriageWriteBtn:hover {
		cursor: pointer;
		font-weight: bolder;
	}
	#marriageListPage {
		width: 500px;
		display: flex;
		justify-content: space-between;
		padding: 8px;
		margin: 30px auto;
	}
/* 	#marrriageSearch { */
/* 		padding-left: 210px; */
/* 	} */
	#marriageListPage > a{
		text-decoration: none;
		color: black;
		width: 30px;
	}
	footer {
         position: absolute !important;
         bottom: -1400px !important;
      }
</style>

<section>
	<div>
		<h1 style="text-align: center;">성혼커플 인터뷰</h1>
		<span id="nocontent"></span>
	</div>
    <div id="marriage_inner">
    	<div id="marriageWrite"><a href="${cpath }/review/write"><button id="marriageWriteBtn">듀세요 고객님의 달달한 결혼후기를 남겨듀세요</button></a></div>
   		<div id="marriageList">
    	<c:forEach var="dto" items="${list }">
	    	<div class="marriageContent">
	        	<div class="marriageImg"><a href="${cpath }/review/view/${dto.idx}" style="background-image: url('${cpath}/upload/${dto.img}');"></a></div>
	       		<div style="text-align: center; font-weight: 600;">${dto.title }</div>
	   			<div style="text-align: center;">${dto.writer }</div>
	    	</div>
    	</c:forEach>
   		</div>
   		<div id="marriageListPage">
   			<c:if test="${paging.prev }">
   				<a href="${cpath }/review/list/${paging.begin - 3}">◀</a>
   			</c:if>
   			<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
   				<a class="${paging.page == i ? 'bold' : '' }"
   					href="${cpath }/review/list/${i}?search=${param.search}">${i}</a>
   			</c:forEach>
			<c:if test="${paging.next }">
				<a href="${cpath }/review/list/${paging.end + 1}?search=${param.search}">▶</a>
			</c:if>
			<form id="marrriageSearch">
   				<input type="text" name="search" value="${param.search }">
   				<button>검색</button>
   			</form>
		</div>
     </div>
</section>

<%@ include file="../footer.jsp" %>