<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
#find-pwd-area {
	width: 50% !important;
	min-height: 300px;
	padding-top: 3em;
}

#find-area {
	float: right;
}

#find-area a {
	color: black;
}

label {
	text-align: left;
}

.info-text {
	color: #1678c2;
	font-weight: bold;
}
</style>
<div class="column" id="find-pwd-area">

	<form class="ui form" id="findPwdForm" method="post">
		<div class="field">
			<label>아이디</label> <input type="text" placeholder="아이디를 입력하세요."
				name="emp_id" onKeyDown="onKeyDown()"
				onKeyup="this.value=this.value.replace(/[^a-z|^0-9]/gi,'');">
		</div>
		<div class="field">
			<label>이름</label> <input type="text" placeholder="이름을 입력하세요."
				name="emp_name" onKeyDown="onKeyDown()" maxlength="15">
		</div>
		<div class="field">
			<label>이메일주소</label> <input type="text"
				placeholder="회원가입 시 등록한 이메일주소 전체를 입력하세요." name="email"
				onKeyDown="onKeyDown()">
		</div>
		<div class="field" id="find-area">
			<p id="find-pwd-msg" style="color: red;">
				<c:if test="${ code eq 1 }">
					해당 정보와 일치하는 아이디가 없습니다.
				</c:if>
			</p>
		</div>
		<div class="field">
			<button class="fluid ui blue button" onclick="findPwdCheck()"
				type="button">등록한 이메일 주소로 임시 비밀번호 전송</button>
		</div>
	</form>

</div>