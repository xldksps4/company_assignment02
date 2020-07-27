<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
#boardContentTable img {
	max-width: 450px;
}
</style>

<jsp:include page="/WEB-INF/views/common/mainNav.jsp" />

<div class="content-area ui container">
	<div class="contents column">
		<div class="field">
			<h3 class="ui header">공지사항</h3>
		</div>

		<table class="ui blue table" id="boardContentTable">
			<thead>
				<tr>
					<th colspan="3">${ board.board_title }</th>
				</tr>
				<tr>
					<td width="80px;">${ board.board_type_name }</td>
					<td>${ board.emp_name }</td>
					<td style="text-align: right;">${ board.board_enroll_date }</td>
				</tr>
				<tr>
					<td colspan="3" style="padding:0px"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3" style="padding-bottom: 2em;">
						<div style="text-align: right;">
							<c:forEach items="${ board.files }" var="f" varStatus="status">
								<c:if test="${status.index == 0 && f.file_no!='' }">
									<span style="margin-right:8px;">첨부파일</span>
								</c:if>
								<a href="#this" name="file" style="text-decoration: underline;">${f.origin_name }</a>
								<form action="downloadFile.bo" method="post" style="margin:0">
									<input type="hidden" name="changeName" value="${f.change_name }">
									<input type="hidden" name="originName" value="${f.origin_name }">
								</form>
							</c:forEach>
						</div>
						<p id="imgBox"></p>
						<br>
						${ board.board_content }
						<br><br>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="3" style="text-align: center;"><c:if
							test="${ loginEmp.emp_level_code eq 1 }">
							<button class="ui blue button" type="button"
								onclick="location.href='noticeWrite.bo?board_no=${ board.board_no }'">수정</button>
							<button class="ui red button" type="button"
								onclick="deleteBoard(${ board.board_no })">삭제</button>
						</c:if>
						<button class="ui toggle button" type="button"
							onclick="location.href='notice.bo'">목록</button></th>
				</tr>
			</tfoot>
		</table>

	</div>
</div>

<jsp:include page="/WEB-INF/views/common/sideRightNav.jsp" />
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript" src="resources/js/notice.js"></script>