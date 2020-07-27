<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<tbody>
	<c:forEach items="${ empList }" var="e" varStatus="status">
		<tr>
			<td><input type='text' class='empNoTd' value='<c:out value="${ e.emp_no }" />'
				hidden='hidden'><c:out value="${ status.count + (pi.limit * (pi.currentPage - 1)) }" /></td>
			<td><c:out value="${ e.emp_name }" /></td>
			<td><c:out value="${ e.skill_type_name }" /></td>
			<td><c:out value="${ e.grade }" /></td>
			<td><c:out value="${ e.skill }" /></td>
			<td><c:out value="${ e.address }" /></td>
			<td><c:out value="${ e.status }" /></td>
		</tr>
	</c:forEach>
	
	<c:if test="${ fn:length(empList) <= 0 }">
		<tr>
			<td colspan='7'>검색 결과가 없음</td>
		</tr>
	</c:if>
</tbody>
<tfoot>
	<tr>
		<th colspan="7" class="pagingArea">
			<div class="ui pagination menu">
				<!-- 버튼 갯수 페이징 -->
				<c:choose>
					<c:when test="${ pi.limit < pi.startPage }">
						<a class="item" style="font-weight: bold;"
							onclick="searchEmp(<c:out value="${ pi.startPage - 1 }" />)">◁◁</a>
					</c:when>
					<c:otherwise>
						<a class="icon item disabled">◁◁</a>
					</c:otherwise>
				</c:choose>
				<!-- 이전 버튼 페이징 -->
				<c:choose>
					<c:when test="${ pi.prev }">
						<a class="item" style="font-weight: bold;"
							onclick="searchEmp(<c:out value="${ pi.currentPage - 1 }" />)"> ◁ </a>
					</c:when>
					<c:otherwise>
						<a class="icon item disabled"> ◁ </a>
					</c:otherwise>
				</c:choose>
				<!-- 숫자 페이징 -->
				<c:choose>
					<c:when test="${ pi.listCount > 0 }">
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
							varStatus="page">
							<c:choose>
								<c:when test="${ page.index == pi.currentPage }">
									<a class="item active"><c:out value="${ page.index }" /></a>
								</c:when>
								<c:otherwise>
									<a class="item" onclick="searchEmp(<c:out value="${ page.index }" />)"><c:out value="${ page.index }" /></a>
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
							onclick="searchEmp(<c:out value="${ pi.currentPage + 1 }" />)"> ▷ </a>
					</c:when>
					<c:otherwise>
						<a class="icon item disabled"> ▷ </a>
					</c:otherwise>
				</c:choose>

				<!-- 버튼 갯수 페이징 -->
				<c:choose>
					<c:when test="${ pi.endPage < pi.maxPage }">
						<a class="item" style="font-weight: bold;"
							onclick="searchEmp(<c:out value="${ pi.endPage + 1 }" />)">▷▷</a>
					</c:when>
					<c:otherwise>
						<a class="icon item disabled">▷▷</a>
					</c:otherwise>
				</c:choose>
			</div>
		</th>
	</tr>
</tfoot>