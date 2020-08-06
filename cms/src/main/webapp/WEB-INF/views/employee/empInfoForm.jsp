<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script defer type="text/javascript" src="resources/js/empInfo.js"></script>
<style type="text/css">
#main-tap-area, #info-main-tap {
	text-align: center;
}

#info-main-tap a {
	width: 33.33%;
	display: flex;
	justify-content: center;
}

#info-main-tap a:last-child {
	width: 33.5%;
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
			<c:if test="${ emp_no > 0 }">
				<div class="ui message" id="message">
					<div class="header">관리자 권한으로 사원 수정</div>
				</div>
			</c:if>
			<!-- 메인탭 영역 -->
			<div class="ui top attached tabular menu" id="info-main-tap">
				<a class="item active" data-tab="1">내정보</a>
				<a class="item"
					<c:if test="${ emp_no ne null }">data-tab="-1" data-tooltip="관리자모드로는 비밀번호를 수정할 수 없습니다." style="color : lightgray;"</c:if><c:if test="${ emp_no eq null || emp_no eq 0 }">data-tab="2"</c:if>>비밀번호 수정</a>
					<a class="item" data-tab="3">경력등록&nbsp;&nbsp;
					<button class="ui teal button" data-tooltip="저장된 경력사항을 새창으로 보기"
						onclick="showDetail(${ emp_no }<c:if test="${ emp_no eq null }">${ loginEmp.emp_no }</c:if>)">
						<i class="far fa-file-alt"></i>
					</button>
				</a>
			</div>
			
			
			
			<div class="ui bottom attached tab segment active" data-tab="1">
				<jsp:include page="/WEB-INF/views/employee/empInfo/myInfoForm.jsp" />
			</div>
			<div class="ui bottom attached tab segment" data-tab="2">
				<jsp:include
					page="/WEB-INF/views/employee/empInfo/passwordUpdateForm.jsp" />
			</div>
			<div class="ui bottom attached tab segment" data-tab="3">
				<jsp:include
					page="/WEB-INF/views/employee/empInfo/careerUpdateForm.jsp" />
			</div>
			<!-- 메인탭 영역 끝 -->

		</div>
	</div>

	<jsp:include page="/WEB-INF/views/employee/empInfo/myInfoFormModal.jsp" />
	<jsp:include page="/WEB-INF/views/common/sideRightNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- 	<script type="text/javascript" src="resources/js/empInfo.js"></script> -->