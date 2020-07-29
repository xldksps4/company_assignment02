<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내담C&C 경력관리 시스템</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/semantic.min.css">
<script type="text/javascript" src="resources/js/semantic.min.js"></script> <!-- ui 라이브러리 -->
<script type="text/javascript" src="resources/js/serializeObject.js"></script>  <!-- form.data >> object.data -->
<script type="text/javascript" src="resources/js/getUrlParams.js"></script>	<!-- QueryString >> JSON -->
<script defer
	src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script> <!-- 무료 아이콘 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- Daum 우편번호 -->
<style type="text/css">
#main-nav-top {
	padding: 1em;
	border: none;
	margin: 0px;
}

#main-nav-top a {
	position: inherit;
}

#main-nav-top img {
	width: 100% !important; /* 우선순위 강제, 유지보수 고려하면 사용 안하는 것이 나을지도. */
}

#main-nav-bottom {
	margin-top: 0px;
}

.content-area {
	width: 75% !important;
	height: 100% auto;
}

.contents {
	padding-top: 1.5em;
	padding-bottom: 1.5em;
	min-height: 470px;
}

.required-info {
	color: red;
	font-weight: bold;
}
</style>

</head>
<body>
	<!-- 최상단 네비 -->
	<div class="ui menu" id="main-nav-top">
		<a class="item" href="c.jsp"> <img
			src="resources/images/logo_color.png">
		</a>
		<div class="right menu">
			<c:if test="${ sessionScope.loginEmp eq null }">
				<a class="item" href="signinForm.em">로그인</a>
				<a class="item" href="signupForm.em">회원가입</a>
			</c:if>

			<c:if test="${ sessionScope.loginEmp ne null }">
				<c:choose>
					<c:when test="${ sessionScope.loginEmp.emp_level_code eq 1 }">
						<a class="item" href="masterForm.ma">가입승인</a>
						<a class="item" href="adminSearchForm.em">경력관리 조회</a>
						<a class="item" href="newEmpAdd.ma">사원신규등록</a>
					</c:when>
					<c:when test="${ sessionScope.loginEmp.emp_level_code eq 2 }">
						<a class="item" href="adminSearchForm.em">ADMIN</a>
						<a class="item" href="empInfoForm.em">내정보</a>
					</c:when>
					<c:otherwise>
						<a class="item" href="empInfoForm.em">내정보</a>
					</c:otherwise>
				</c:choose>
				<a class="item" href="logout.em">로그아웃</a>
			</c:if>
		</div>
	</div>

	<div class="ui blue four item inverted menu" id="main-nav-bottom">
		<c:if test="${ sessionScope.loginEmp.emp_level_code < 3 }"><a class="item menu" href="adminSearchForm.em">경력관리 조회</a></c:if>
<%-- 		<c:if test="${ sessionScope.loginEmp.emp_level_code >= 3 }">href="error?type=2"</c:if> --%>
<%-- 		<c:if test="${ sessionScope.loginEmp eq null }">href="signinForm.em"</c:if> >경력관리 조회</a>  --%>
		<a class="item menu">이용안내</a> 
		<a class="item menu" href="notice.bo">공지·알림</a> <a class="item menu">문의</a>
	</div>
</body>
</html>