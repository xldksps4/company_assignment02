<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<jsp:include page="/WEB-INF/views/common/mainNav.jsp" />
	<div class="content-area ui container">
		<div class="contents column" id="contentArea">
			<jsp:include page="/WEB-INF/views/main/mainContent.jsp" />
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/sideRightNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />