<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
#find-id-area {
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
<div class="column" id="find-id-area">
	
	<form class="ui form" id="findIdForm" method="post">
		<div class="field">
			<label>이름</label>
			<input type="text" placeholder="이름을 입력하세요." name="emp_name" onKeyDown="onKeyDown()" maxlength="15">
		</div>
		<div class="field">
			<label>이메일주소</label>
			<input type="text" placeholder="회원가입 시 등록한 이메일주소 전체를 입력하세요." name="email" onKeyDown="onKeyDown()">
		</div>
		<div class="field" id="find-area">
			<p id="find-id-msg" style="color: red;">
				<c:if test="${ code eq 1 }">
					해당 정보와 일치하는 아이디가 없습니다.
				</c:if>
			</p>
		</div>
		<div class="field">
			<button class="fluid ui blue button" onclick="findIDCheck()" type="button">아이디 찾기</button>
		</div>
	</form>

</div>