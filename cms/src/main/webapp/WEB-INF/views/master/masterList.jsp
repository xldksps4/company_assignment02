<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<tbody>
	<c:choose>
		<c:when test="${ fn:length(empList) > 0 }">
			<c:forEach items="${ empList }" var="emp" varStatus="vs">
				<tr>
					<td>${ vs.count + (pi.limit * (pi.currentPage - 1)) }</td>
					<td>${ emp.dept_name }</td>
					<td>${ emp.emp_id }</td>
					<td>${ emp.emp_name }</td>
					<td class="levelTd">
						<div class="ui form">
							<div class="field">
								<c:choose>
									<c:when test="${ emp.emp_level_code == 4 }">
										<select name="change_emp_level_code">
											<option hidden></option>
											<option value="2" <c:if test="${ emp.emp_level_code == 2}">selected</c:if>>ADMIN</option>
											<option value="3" <c:if test="${ emp.emp_level_code == 3}">selected</c:if>>MEMBER</option>
										</select>
									</c:when>
									<c:otherwise>
										<select name="change_emp_level_code">
											<option hidden></option>
											<option value="2" <c:if test="${ emp.emp_level_code == 2}">selected</c:if>>ADMIN</option>
											<option value="3" <c:if test="${ emp.emp_level_code == 3}">selected</c:if>>MEMBER</option>
											<option value="5" <c:if test="${ emp.emp_level_code == 5}">selected</c:if>>거절</option>
										</select>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</td>
					<td class="btnTd">
						<c:if test="${ emp.emp_level_code < 4 }">
							<button class="ui green button" disabled="disabled">승인</button>
							<button class="ui blue button levelBtn" value="${ emp.emp_no }">수정</button>
						</c:if>
						<c:if test="${ emp.emp_level_code eq 4 }">
							<button class="ui green button levelBtn" value="${ emp.emp_no }">승인</button>
							<button class="ui red button levelBtn" value="${ emp.emp_no }">거절</button>
						</c:if>
						<c:if test="${ emp.emp_level_code eq 5 }">
							<button class="ui red button" disabled="disabled">거절</button>
							<button class="ui blue button levelBtn" value="${ emp.emp_no }">수정</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="6">검색 결과가 없습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
</tbody>
<tfoot>
	<tr>
		<th colspan="6">
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
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
							varStatus="page">
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