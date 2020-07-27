<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
#noticeTable tbody tr {
	cursor: pointer;
}
#noticeTable tbody tr:hover {
	background: #2185d0;
	color: white;
}
</style>
<jsp:include page="/WEB-INF/views/common/mainNav.jsp" />

<div class="content-area ui container">
	<div class="contents column">

		<form action="boardInsert.bo" id="noticeForm" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="board_no" value="${ 0 + board.board_no }">
			<input type="hidden" name="board_type_code" value="1">
			<div class="ui form">
				<div class="field">
					<h3 class="ui header">공지사항</h3>
				</div>
				<div class="field">
					<div class="inline fields">
						<div class="one wide field">
							<label>제목<span class="required-info">*</span></label>
						</div>
						<div class="fifteen wide field">
							<input type="text" name="board_title" placeholder="제목을 입력하세요."
								value="${ board.board_title }">
						</div>
					</div>
				</div>
				<div class="inline fields">
					<div class="one wide field">
						<label>내용<span class="required-info">*</span></label>
					</div>
					<div class="fifteen wide field">
						<textarea name="board_content" style="resize: none;">${ board.board_content }</textarea>
					</div>
				</div>
				<div class="inline fields">
					<div class="one wide field">
						<label>첨부파일</label>
					</div>
					<div class="fifteen wide field">
						<input class="file-input" type="file" name="newFile"
							multiple="multiple">
					</div>
				</div>
				<div class="inline fields">
					<div class="one wide field">
						<label>기존파일</label>
					</div>
					<div class="fifteen wide field">
						<c:forEach items="${ board.files }" var="f" varStatus="vs">
							<c:if test="${ f.file_no > 0 }">
								<a class="ui label deleteFile">${ f.origin_name }&nbsp;&nbsp;
									<i class="fas fa-times"></i> <input type="hidden"
									value="${ f.file_no }" name="file_no">
								</a>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="field" style="text-align: center;">
					<button class="ui blue button" type="button"
						onclick="noticeCheck()">등록</button>
					<c:if test="${ board.board_no > 0 }">
						<button class="ui toggle button" type="button"
							onclick="location.href='detailNotice.bo?board_no=${ board.board_no }'">취소</button>
					</c:if>
					<c:if test="${ board.board_no eq null }">
						<button class="ui toggle button" type="button"
							onclick="location.href='notice.bo'">취소</button>
					</c:if>
					
				</div>
			</div>
		</form>

	</div>
</div>

<jsp:include page="/WEB-INF/views/common/sideRightNav.jsp" />
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript" src="resources/js/notice.js"></script>