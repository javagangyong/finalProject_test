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
.sa {
	display: flex;
	justify-content: space-around;
}
#marriageView_inner {
	width: 1200px;
	height: 100%;
	margin: auto;
}

#reviewHeader {
	width: 900px;
	margin: auto;
	border-bottom: 1px solid grey;
	border-top: 1px solid grey;
}

#reviewTitle {
	padding: 40px;
	text-align: center;
}

#marriageReviewImg {
	background-image: url('${cpath}/upload/${dto.img}');
	background-size: auto 100%;
	margin: auto;
	display: block;
	width: 400px;
	height: 550px;
}

#reviewBtn {
	display: block;
	margin: 50px auto;
	width: 270px;
	height: 52px;
	border: 1px solid #cdcdcd;
	font-size: 18px;
	color: #555555;
	background-color: white;
	text-align: center;
	line-height: 49px;
}

#reviewRecommend {
	margin-top: 200px;
}

#reviewRecommendList {
	display: flex;
	justify-content: center;
	margin: auto;
}

.reviewRecommendContent {
	padding: 10px;
}

.reviewRecommendImg>a {
	background-size: auto 100%;
	display: block;
	width: 200px;
	height: 250px;
}
#reviewReplyWriteForm {
	height: auto;

}
.reviewReply {
	width: 900px;
/* 	border: 1px solid #cdcdcd; */
	margin: auto;
}
#reviewReplyBtn {
	background-color: #105dae;
	color: white;
	padding: 5px;
	border: 0;
}

textarea[name="content"] {
	resize: none;
	width: 880px;
	height: 100px;
	margin: auto;
}
#reviewReplyListForm{
	width: 900px;
	margin: 0 auto;
}
.replycontent {
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid #cdcdcd;
	padding: 15px 15px;
}
#reviewLike{
	display: flex;
	width: 50px;
	justify-content: space-between;
}
#heartCount {
	margin: 5px;
}
#heartIcon > img {
	width: 30px;
}
#reviewsub{
	display: flex;
	justify-content: space-between;
}
#mfAndDel {
	display: flex;
}
#marriageViewContent{
	width: 700px;
	margin: 60px auto;

}
footer {
    position: absolute !important;
    bottom: -1700px !important;
}

</style>


<section>
	<div id="marriageView_inner">
		<div id="reviewHeader">
			<div id="reviewTitle">
				<div>${dto.title }</div>
				<div>${dto.writer } 🩷 ${dto.writer == mate.user1 ? mate.user2 : mate.user1}</div>
			</div>
			<div id="reviewsub">
				<div id="reviewLike">
					<div id="heartIcon"><img src="${cpath }/resources/image/${check}.jpg"></div>
					<div id="heartCount"></div>
				</div>
				<c:if test="${dto.writer == login.userid }">
					<div id="mfAndDel">
						<div><button id="reviewMfBtn">수정</button></div>
						<div><button id="reviewDelBtn">삭제</button></div>
					</div>
				</c:if>
			</div>
		</div>
		<div style="text-align: center;">
			<div id="marriageReviewImg"></div>
			<div id="marriageViewContent">${dto.content }</div>
		</div>
		<button id="reviewBtn">목록보기</button>
		
		<div id="reviewReplyWriteForm">
		<div class="reviewReply">
		    <div class="reviewReplyWrite ${empty login ? 'hidden' : ''}">
		    	<form id="reviewReplyForm">
		    		<div style="display: flex; justify-content: space-between; width: 170px; margin: 5px;">
		    			<div>🧑🏻 ${login.userid }</div>
		    			<div><button id="reviewReplyBtn" type="submit">댓글 작성</button></div>
		    		</div>
		    		<textarea name="content" required></textarea>
		    		<input type="hidden" name="board_idx" value="${dto.idx }">
		    		<input type="hidden" name="writer" value="${login.userid }">
		    		
		    	</form>
		    </div>
		</div>
		<div id="reviewReplyListForm"></div>
		</div>
		
		<div id="reviewRecommend">
			<h2 style="text-align: center;">다른 추천 인터뷰</h2>
			<div id="reviewRecommendList">
				<c:forEach var="dto" items="${list }">
				<div class="reviewRecommendContent">
					<div class="reviewRecommendImg"><a href="${cpath }/review/view/${dto.idx}" style="background-image: url('${cpath}/upload/${dto.img}');">
													</a></div>
					<div style="text-align: center;">${dto.title }</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>

<script>
	const reviewBtn = document.getElementById('reviewBtn')
	reviewBtn.onclick = () => {location.href = '${cpath}/review/list/1'}
	
	const reviewReplyWriteForm = document.getElementById('reviewReplyWriteForm')
	const reviewReplyListForm = document.getElementById('reviewReplyListForm')
	
	const ReplyLoadHandler = function() {

		reviewReplyListForm.innerHTML = ''
		const url = '${cpath}/reviewAjax/view/${idx}'
		fetch(url)
			.then(resp => resp.json())
			.then(json => {
				const arr = json
				let rep = ''
				for(let i = 0; i < arr.length; i++){
					const dto = arr[i]
					
					const longToDateString = function(num){
						const d = new Date(num)
						let yyyy = d.getFullYear()
						let mm = d.getMonth() + 1
						let dd = d.getDate()
						let h = d.getHours()
						let m = d.getMinutes()
						if(mm < 10)		mm = '0' + mm
						if(dd < 10)		dd = '0' + dd
						if(h < 10)		h = '0' + h
						if(m < 10)		m = '0' + m
						return yyyy + '.' + mm + '.'+ dd + ' ' + h + ':' + m
					}
					
					let tag = '<div class="replycontent">';
					tag += '	<div class="replyContent_L">'
					tag += '		<div style="display: flex;">'
					tag += '			<div style="padding-right: 5px;">[' + dto.idx +']</div>'
					tag += '			<div style="font-weight: bold;">' + dto.writer +'</div>'
					tag += '		</div>'
					tag += '		<div>' + dto.content + '</div>'
					tag += '	</div>'
					tag += '	<div class="replyContent_R">'
					tag += '		<div>' + longToDateString(dto.writeDate) + '</div>'
					tag += '	</div>'
					tag += '</div>'
					rep += tag;
				}
				reviewReplyListForm.innerHTML = rep
			}
		)
		
		
		
	}
		
	const form = document.getElementById('reviewReplyForm')
	form.onsubmit = async function(event){
		event.preventDefault()
		const url = '${cpath}/reviewAjax/write'
		const formData = new FormData(event.target)
		const ob = {}
		for(let key of formData.entries()){
			ob[key[0]] = key[1]
		}
		console.log(ob)
		const opt = {
			 method: 'POST',
			 body: JSON.stringify(ob),
			 headers: {
			   'Content-Type' : 'application/json;charset=utf-8'
			 }
		}
		const result = await fetch(url, opt).then(resp => resp.text())
		if(result == 1){
			console.log(result)
			ReplyLoadHandler()
		}
		ReplyLoadHandler()
	}
	
	const count = document.getElementById('heartCount')
	const CountLikeHandler = async function(){
		const url = '${cpath}/reviewAjax/count'
		const ob = {board_idx : ${dto.idx}}
		console.log(ob)
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type' : 'application/json;charset=utf-8'
			}
		}
		const result = await fetch(url, opt).then(resp => resp.text())
		count.innerText = result
		}
	document.addEventListener('DOMContentLoaded', CountLikeHandler)
	
	const like = document.querySelector('#heartIcon > img')
	console.log(like)
	like.onclick = async function(event){
		event.preventDefault()
		const url = '${cpath}/reviewAjax/like'
		const ob = { userid : '${login.userid}', board_idx : ${dto.idx}}
		console.log(ob)
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-Type' : 'application/json;charset=utf-8'
			}
		}
		const result = await fetch(url, opt).then(resp => resp.text())
		console.log(result)
		if(result == '좋아요'){
			console.log(event.target)
			event.target.src = '${cpath }/resources/image/꽉찬하트.jpg'
			
		}
		else {
			event.target.src = '${cpath }/resources/image/빈하트.jpg'
			
		}
		CountLikeHandler();
	}

	const reviewDeleteBtn = document.getElementById('reviewDelBtn')
	if(reviewDeleteBtn != null) {
		reviewDeleteBtn.onclick = function(event){
			event.preventDefault()
			location.href = '${cpath}/review/delete/${idx}'
		}	
	}
	
	const reviewModifyBtn = document.getElementById('reviewMfBtn')
	if(reviewModifyBtn != null) {
		reviewModifyBtn.onclick = function(event){
			event.preventDefault()
			location.href = '${cpath}/review/modify/${idx}'
		}		
	}
	document.addEventListener('DOMContentLoaded', ReplyLoadHandler)

		
</script>
<%@ include file="../footer.jsp" %>
</body>
</html>