<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script defer type="text/javascript" src="resources/js/signin.js"></script>

<style type="text/css">
#signin-area {
	width: 70% !important;
	padding-left: 15em;
	padding-right: 15em;
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
</style>
<jsp:include page="/WEB-INF/views/common/mainNav.jsp" />

<div class="content-area ui container" align="center">
	<div class="contents column">
	
		<div class="column" id="signin-area">
			<!-- 로그인 폼 -->

			<form class="ui form" id="signinForm" method="post" action="signin.em">
				<div class="field">
					<label>아이디</label>
					<input type="text" placeholder="아이디를 입력하세요." name="emp_id" onKeyDown="onKeyDown()" value="${ emp_id }">
				</div>
				<div class="field">
					<label>비밀번호</label>
					<input type="password" placeholder="비밀번호를 입력하세요." name="emp_pwd" onKeyDown="onKeyDown()">
				</div>
				<div class="field" id="find-area">
					<span id="signin-msg" style="display:none"></span>
				
						<c:if test="${ code eq 1 }">
							아이디나 비밀번호가 일치하지 않습니다.
						</c:if>
						<c:if test="${ code eq 2 }">
							회원가입 승인 여부 중 입니다.
						</c:if>
						<c:if test="${ code eq 3 }">
							회원가입 승인이 거절 되었습니다. 관리자에게 별도 문의 하세요.
						</c:if>
						<c:if test="${ code eq 4 }">
							로그인에 실패했습니다. 다시 시도해주세요.
						</c:if>
					</p>
				</div>
				<div class="field" id="find-area">
					<a href="findInfoForm.em">아이디 | 비밀번호 찾기</a>
				</div>
				<div class="field">
					<button class="fluid ui blue button" onclick="check()" type="button">로그인</button>
					<br>
					<button class="fluid ui grey button" type="button" onclick="signup()">회원가입</button>
				</div>
			</form>

			<!-- 로그인 폼 끝 -->
		</div>
			
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/sideRightNav.jsp" />
<jsp:include page="/WEB-INF/views/common/footer.jsp" />