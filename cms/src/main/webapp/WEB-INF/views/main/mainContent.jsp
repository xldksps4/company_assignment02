<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
#main-info {
	background: rgba(52, 152, 219, 0.28);
}

.main-menus {
	padding: 2em;
	margin: 1em;
}

.main-menus:hover {
	background: rgb(52, 152, 219);
	color: white;
	cursor: pointer;
}

.main-menus:hover .icon {
	background: rgb(52, 152, 219);
	color: white;
	cursor: pointer;
}

#notice-area>div {
	padding: 1em;
}

.icon {
	font-size: xx-large;
	color: rgb(52, 152, 219);
}

#notice-content>div {
	background: rgba(52, 152, 219, 0.28);
	padding: 0.5em;
	margin: 0.3em;
}
.noticeLine:hover {
	background: #4183c4 !important;
	color: white;
	cursor: pointer;
}
</style>
<!-- 이곳은 include된  mainContent.jsp 영역입니다.  -->
<div class="ui equal width center aligned padded grid"
	id="main-content-area">
	<div class="row" id="main-info">
		<div class="column">
			<h3>ND SW개발자 경력관리시스템</h3>
			<p>ND개발자의 경력을 체계적으로 관리,</p>
			<p>개발인력을 효율적으로 배치하는 시스템 입니다.</p>
		</div>
	</div>
	<div class="row" id="main-menu">
		<div class="four wide column main-menus">
			<div>
				<h2>
					<i class="fas fa-info-circle icon"></i> &nbsp; 이용안내
				</h2>
			</div>
		</div>
		<div class="four wide column main-menus" onclick="empInfo()">
			<h2>
				<i class="fas fa-id-card icon"></i> &nbsp; 경력등록
			</h2>
		</div>
	</div>
	<div class="row" id="notice-area">
		<div class="five wide column" id="notice-header">
			<div style="padding: 1em;">
				<h3>
					<i class="fas fa-sticky-note icon"></i>&nbsp; 공지사항
				</h3>
			</div>
		</div>
		<div class="eleven wide column">
			<div class="row">
				<div class="column" align="right">
					<a class="item menu" href="notice.bo">+ 더보기</a>
				</div>
				<div class="column" align="left" id="notice-content">
					<c:forEach items="${ boardList }" var="notice">
						<div class="column noticeLine" onclick="notice(${ notice.board_no })"><span style="padding-right: 1em;">${ notice.board_enroll_date }</span>
							<span>${ notice.board_title }</span>
						</div>
					</c:forEach>
					<c:if test="${ fn:length(boardList) <= 0 }">
						<span>등록된 공지사항이 없습니다.</span>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
