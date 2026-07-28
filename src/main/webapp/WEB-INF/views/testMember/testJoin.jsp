<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	section {
		height: 1000px;
		padding-top: 95px;
	}
	div.innerBlock {
		margin: 200px 0 0 300px;
	}
</style>

<section>
	<div class="innerBlock">
		<form onSubmit="testEmailHandler(event)">
			<input type="email" name="email" placeholder="이메일">
			<button>보내기</button>
		</form>
		
	</div>
</section>


<script>
	async function testEmailHandler(event) {
		event.preventDefault();
		
		const url = cpath + '/testMemberAjax/testEmailSend';
		const ob = {address: event.target.email.value}
		const opt = {
				method: 'POST',
				body: JSON.stringify(ob),
				headers: {
					'Content-Type': 'application/json;charset=utf-8'
				}
		}
		
		const result = await fetch(url, opt).then(resp => resp.text());
		if(result == 1) {
			alert('메일 전송 완료')
		} else {
			alert('메일 전송 실패')
		}
	}



</script>