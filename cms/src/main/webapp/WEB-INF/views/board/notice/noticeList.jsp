<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
#noticeTable tbody .boardTr {
	cursor: pointer;
}
#noticeTable tbody .boardTr:hover {
	background: #2185d0;
	color: white;
}
</style>

	<jsp:include page="/WEB-INF/views/common/mainNav.jsp" />

	<div class="content-area ui container">
		<div class="contents column">
			<div class="field">
				<h3 class="ui header">공지사항</h3>
			</div>

			<table class="ui blue table" id="noticeTable">
				<thead>
					<tr>
						<th colspan="4">
							<div>
								<div style="display: inline-block; float: right;">
									<c:if test="${ loginEmp.emp_level_code eq 1 }">
										<button class="mini ui primary basic button"
											onclick="location.href='noticeWrite.bo'">글쓰기</button>
									</c:if>
								</div>
							</div>

						</th>
					</tr>
					<tr>
						<th width="30px">No</th>
						<th>제목</th>
						<th width="100px">작성자</th>
						<th width="200px">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ boardList }" var="b" varStatus="vs">
						<tr class="boardTr">
							<td>${ vs.count + (pi.limit * (pi.currentPage - 1)) }<input
								type="hidden" name="board_no" value="${ b.board_no }"></td>
							<td>${ b.board_title }</td>
							<td>${ b.emp_name }</td>
							<td>${ b.board_enroll_date }</td>
						</tr>
					</c:forEach>
					<c:if test="${ fn:length(boardList) <= 0 }">
						<tr align="center">
							<td colspan="4">등록된 공지사항이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
				<tfoot align="center">
					<tr>
						<th colspan="4">

							<div class="ui pagination menu">

								<!-- 버튼 갯수 페이징 -->
								<c:choose>
									<c:when test="${ pi.limit < pi.startPage }">
										<a class="item" style="font-weight: bold;"
											onclick="self.search(${ pi.startPage - 1 })">◁◁</a>
									</c:when>
									<c:otherwise>
										<a class="icon item disabled">◁◁</a>
									</c:otherwise>
								</c:choose>

								<!-- 이전 버튼 페이징 -->
								<c:choose>
									<c:when test="${ pi.prev }">
										<a class="item" style="font-weight: bold;"
											onclick="self.search(${ pi.currentPage - 1 })"> ◁ </a>
									</c:when>
									<c:otherwise>
										<a class="icon item disabled"> ◁ </a>
									</c:otherwise>
								</c:choose>

								<!-- 숫자 페이징 -->
								<c:choose>
									<c:when test="${ pi.listCount > 0 }">
										<c:forEach begin="${ pi.startPage > 0 ? pi.startPage : 1}" end="${ pi.endPage }" varStatus="page">
											<c:choose>
												<c:when test="${ page.index == pi.currentPage }">
													<a class="item active">${ page.index }</a>
												</c:when>
												<c:otherwise>
													<a class="item" onclick="self.search(${ page.index })">${ page.index }</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<a class="icon item disabled">1</a>
									</c:otherwise>
								</c:choose>

								<!-- 다음 버튼 페이징 -->
								<c:choose>
									<c:when test="${ pi.next }">
										<a class="item" style="font-weight: bold;"
											onclick="self.search(${ pi.currentPage + 1 })"> ▷ </a>
									</c:when>
									<c:otherwise>
										<a class="icon item disabled"> ▷ </a>
									</c:otherwise>
								</c:choose>

								<!-- 버튼 갯수 페이징 -->
								<c:choose>
									<c:when test="${ pi.endPage < pi.maxPage }">
										<a class="item" style="font-weight: bold;"
											onclick="self.search(${ pi.endPage + 1 })">▷▷</a>
									</c:when>
									<c:otherwise>
										<a class="icon item disabled">▷▷</a>
									</c:otherwise>
								</c:choose>

							</div>

						</th>
					</tr>
				</tfoot>
			</table>

		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/sideRightNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script type="text/javascript" src="resources/js/notice.js"></script>