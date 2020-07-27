<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
#area {
	justify-content: center;
}

#pwdArea {
	width: 80% !important;
}
</style>
<!-- 비밀번호 변경 폼 -->
<form class="ui form" method="post" id="changePwdFormOriginal" style="display: none;">
	<div class="inline fields">
		<div class="three wide field">
			<label>변경할 비밀번호</label>
		</div>
		<div class="thirteen wide field">
			<input type="password" placeholder="변경할 비밀번호를 입력하세요." id="emp_pwd1">
		</div>
	</div>
	<div class="inline fields">
		<div class="three wide field">
			<label>변경할 비밀번호 확인</label>
		</div>
		<div class="thirteen wide field">
			<input type="password" placeholder="변경할 비밀번호를 한번 더 입력하세요."
				id="emp_pwd2">
		</div>
	</div>
	<div class="inline fields" style="float: right;">
		<p id="passwordResult" style="color: red;"></p>
	</div>
	<br><br>
	<div class="inline fields">
		<button class="fluid ui blue button" type="button" style="width: 100%;"
			onclick="updatePwd()">비밀번호 변경</button>
	</div>
</form>



<div id="area" class="ui grid">

	<div class="column" id="pwdArea">
		<form class="ui form" method="post">
			<div class="inline fields">
				<div class="three wide field">
					<label>현재 비밀번호</label>
				</div>
				<div class="ten wide field">
					<input type="password" placeholder="현재 비밀번호를 입력하세요." id="emp_pwd"
						onKeyDown="onKeyDown()">
				</div>
				<div class="three wide field">
					<button class="fluid ui blue button" onclick="check()"
						type="button">비밀번호 확인</button>
				</div>
			</div>
			<div class="field" style="float: right; padding: 1.2em;">
				<p id="password-msg" style="color: red;"></p>
			</div>

		</form>
	</div>
</div>

<script type="text/javascript" src="resources/js/passwordUpdate.js"></script>