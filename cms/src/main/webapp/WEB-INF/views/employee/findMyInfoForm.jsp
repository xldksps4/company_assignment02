<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
#main-tap-area, #info-main-tap {
	text-align: center;
}

#info-main-tap a {
	width: 50%;
	display: flex;
	justify-content: center;
}

#area {
	padding: 2em;
	padding-bottom: 0px;
}
</style>

<jsp:include page="/WEB-INF/views/common/mainNav.jsp" />

<div class="content-area ui container">
	<div class="contents column" id="main-tap-area">
		<input hidden="hidden" value="${ info_code }" name="info_code">
		<input hidden="hidden" value="${ 0 + emp_no }" name="emp_no">
		<!-- 메인탭 영역 -->
		<div class="ui top attached tabular menu" id="info-main-tap">
			<a class="item active" data-tab="1">아이디 찾기</a>
			<a class="item" data-tab="2">비밀번호 찾기</a>
		</div>

		<div class="ui bottom attached tab segment active" data-tab="1" align="center">
			<jsp:include page="/WEB-INF/views/employee/findMyInfo/findIdForm.jsp" />
		</div>
		<div class="ui bottom attached tab segment" data-tab="2" align="center">
			<jsp:include page="/WEB-INF/views/employee/findMyInfo/findPwdForm.jsp" />
		</div>
		<!-- 메인탭 영역 끝 -->

	</div>
</div>

<jsp:include page="/WEB-INF/views/common/sideRightNav.jsp" />
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript" src="resources/js/empInfo.js"></script>
<script type="text/javascript" src="resources/js/findInfo.js"></script>