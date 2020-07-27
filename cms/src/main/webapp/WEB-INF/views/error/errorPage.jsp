<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/common/mainNav.jsp" />
<div class="content-area ui container">
	<div class="contents column">
		<div class="column" id="error-area" align="center">
			<!-- 에러페이지 --> 
			<div class="ui card">
				<div class="image" id="error-img" style="background: #db2828; height: 110px;">
					<p style="font-size: 80px; color: white;"><i class="fas fa-exclamation-circle"></i></p>
				</div>
				<div class="content">
					<span class="header">ERROR PAGE</span>
					<div class="description" id="msg">
						<c:choose>
							<c:when test="${ msg ne null }">
								${ msg }
							</c:when>
							<c:otherwise>
								에러 발생
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="extra content">
					<button class="ui red button" onclick="errorForward('${ url }')" id="btn" type="button">
						<c:choose>
							<c:when test="${ btn ne null }">
								${ btn }
							</c:when>
							<c:otherwise>
								메인 페이지로 이동
							</c:otherwise>
						</c:choose>
					</button>
				</div>
			</div>
			<!-- 에러페이지 끝-->
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/sideRightNav.jsp" />
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript" src="resources/js/error.js"></script>