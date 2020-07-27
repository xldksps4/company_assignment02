<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
#signiup-area {
	width: 80% !important;
}

#signiup-area {
	padding-left: 15em;
	padding-right: 15em;
}
label, h4 {
	text-align: left;
}
</style>
	<jsp:include page="/WEB-INF/views/common/mainNav.jsp" />

	<div class="content-area ui container" align="center">
		<div class="contents column">

			<div class="column" id="signiup-area">

				<div class="ui info message">
					<div class="header">회원가입 시 아이디 양식 안내</div>
					<ul class="list">
						<li> 정직원 : 회사 이메일 아이디 사용  ex) <span style="color:red; font-weight: bold; text-decoration:underline">sgkim</span>@nadamcnc.com</li>
<!-- 						<li> </li> -->
					</ul>
				</div>

				<!-- 회원가입 폼 -->
				<h4 class="ui dividing header">회원가입</h4>

				<form action="signup.em" class="ui form" id="signupForm"
					style="text-align: left" method="POST">

					<div class="field">
						<label>아이디<span class="required-info">*</span></label>
						<div class="fields">
							<div class="twelve wide field">
								<input type="text" placeholder="영문, 숫자 조합의 아이디를 입력하세요."
									id="emp_id" name="emp_id" maxlength="32"
									onKeyup="this.value=this.value.replace(/[^a-z|^0-9]/gi,'');">
							</div>
							<div class="four wide field">
								<div class="ui button" style="width: 100%;" id="idCheckBtn">중복체크</div>
							</div>
						</div>
					</div>
					<div class="field">
						<p id="idResult"></p>
					</div>

					<div class="field">
						<label>비밀번호<span class="required-info">*</span></label>
						<div class="field">
							<input type="password" class="password" placeholder="비밀번호를 입력하세요." id="emp_pwd1"
								name="emp_pwd" maxlength="30">
						</div>
						<div class="field">
							<input type="password" class="password" placeholder="비밀번호를 한 번 더 입력하세요."
								id="emp_pwd2" maxlength="30">
						</div>
					</div>
					<div class="field">
						<p id="passwordResult"></p>
					</div>

					<div class="field">
						<label>부서<span class="required-info">*</span></label>
						<select class="ui fluid dropdown" id="dept_code" name="dept_code">
							<c:forEach items="${ deptList }" var="d">
								<option value="${ d.dept_code }" <c:if test="${ d.dept_name eq 'SI사업부' }">selected</c:if>>${ d.dept_name }</option>
							</c:forEach>
						</select>
					</div>

					<div class="field">
						<label>이름<span class="required-info">*</span></label> <input type="text" placeholder="이름을 입력하세요."
							id="emp_name" name="emp_name" maxlength="15">
					</div>

					<div class="three fields">
						<div class="field">
							<label>성별<span class="required-info">*</span></label>
						</div>
						<div class="field">
							<div class="ui radio checkbox">
								<input type="radio" name="gender" checked="checked" tabindex="0"
									class="hidden" id="male" value="M"> <label for="male">남자</label>
							</div>
						</div>
						<div class="field">
							<div class="ui radio checkbox">
								<input type="radio" name="gender" tabindex="0" class="hidden"
									id="female" value="F"> <label for="female">여자</label>
							</div>
						</div>
					</div>

					<div class="field">
						<label>생년월일<span class="required-info">*</span></label> <input type="date" name="birth" id="birth" max="9999-12-31">
					</div>

					<div class="field">
						<label>휴대폰번호<span class="required-info">*</span></label> <input type="text" id="phone" name="phone"
							hidden="hidden">
						<div class="three fields">
							<div class="field">
								<input type="text" class="phone" maxlength="3" id="phone1" placeholder="000"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							</div>
							<div class="field">
								<input type="text" class="phone" maxlength="4" id="phone2" placeholder="0000"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							</div>
							<div class="field">
								<input type="text" class="phone" maxlength="4" id="phone3" placeholder="0000"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							</div>
						</div>
					</div>

					<div class="field">
						<label>이메일<span class="required-info">*</span></label> <input type="text" id="email" name="email"
							hidden="hidden">
						<div class="fields">
							<div class="twelve wide field">
								<input type="text" id="email1">
							</div>
							<div class="one wide field" style="margin: auto;">@</div>
							<div class="twelve wide field">
								<input type="text" id="email2">
							</div>
							<div class="twelve wide field">
								<select class="ui fluid dropdown" id="emailSelect">
									<option value="">- 이메일 선택 -</option>
									<option value="naedamcnc.com">naedamcnc.com</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="직접입력">직접입력</option>
								</select>
							</div>
						</div>
					</div>
					
					<c:if test="${ master eq 'Y' }">
						<div class="field">
							<label>권한<span class="required-info">*</span></label>
							<select name="emp_level_code">
								<option value="2">ADMIN</option>
								<option value="3">MEMBER</option>
							</select>
						</div>
					</c:if>
					
					<c:choose>
						<c:when test="${ master eq 'Y' }">
							<div class="field">
								<div class="ui primary button" style="width: 100%;"
									onclick="check();">신규등록</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="field">
								<div class="ui primary button" style="width: 100%;"
									onclick="check();">가입하기</div>
							</div>
							<div class="field">
								<div class="ui button" style="width: 100%;"
									onclick='location.href="index.jsp"'>메인으로</div>
							</div>
						</c:otherwise>
					</c:choose>
				</form>
				<!-- 회원가입 폼 끝 -->
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/sideRightNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script type="text/javascript" src="resources/js/signup.js"></script>