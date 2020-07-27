<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 교육사항 추가 폼 -->
<form method="post" class="ui form eduForm" id="eduFormOriginal"
	style="display: none;">
	<div class="item college">
		<input type="hidden" value="0" name="edu_no"> <br>
		<div class="ui grid">
			<div class="four column row">
				<div class="left floated column">
					<h5 class="ui header">교육사항 입력</h5>
				</div>
				<div class="right floated column" align="right"
					style="margin-right: 1em;">
					<button class="mini negative ui button deleteEdu" type="button">삭제</button>
				</div>
			</div>
		</div>
		<hr>
		<div class="ui form">
			<div class="inline fields">
				<div class="three wide field">
					<label>교육과정명<span class="required-info">*</span></label>
				</div>
				<div class="thirteen wide field">
					<input type="text" name="edu_name">
				</div>
			</div>
		</div>
		<div class="ui form">
			<div class="inline fields">
				<div class="three wide field">
					<label>교육기관명<span class="required-info">*</span></label>
				</div>
				<div class="thirteen wide field">
					<input type="text" name="edu_institute_name">
				</div>
			</div>
		</div>
		<div class="ui form">
			<div class="inline fields">
				<div class="three wide field">
					<label>교육기간<span class="required-info">*</span></label>
				</div>
				<div class="four wide field">
					<input type="date" name="edu_start_date" max="9999-12-31">
				</div>
				<div class="one wide field">~</div>
				<div class="four wide field">
					<input type="date" name="edu_end_date" max="9999-12-31">
				</div>
				<div class="four wide field">
					<select class="dropdown" name="edu_status_code">
						<c:forEach items="${ eduStatusList }" var="e">
							<option value='<c:out value="${ e.edu_status_code }" />'>
								<c:out value="${ e.edu_status_name }" />
							</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- 교육사항 추가 폼 끝-->

<div id="area" class="ui grid">
	<div class="row">
		<div class="column">
			<button class="right floated ui primary button" onclick="eduCheck()">저장</button>
		</div>
	</div>

	<div class="row" align="left" id="eduArea">
		<!-- 교육 등록 영역 -->
		<div class="eleven wide column">
			<div class="ui list" id="eduList">

				<c:if test="${ fn:length(eduList) <= 0 }">
					<form method="post" class="ui form eduForm">
						<div class="item college">
							<input type="hidden" value="0" name="edu_no">
							<br>
							<div class="ui grid">
								<div class="four column row">
									<div class="left floated column">
										<h5 class="ui header">교육사항 입력</h5>
									</div>
								</div>
							</div>

							<hr>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>교육과정명<span class="required-info">*</span></label>
									</div>
									<div class="thirteen wide field">
										<input type="text" name="edu_name">
									</div>
								</div>
							</div>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>교육기관명<span class="required-info">*</span></label>
									</div>
									<div class="thirteen wide field">
										<input type="text" name="edu_institute_name">
									</div>
								</div>
							</div>

							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>교육기간<span class="required-info">*</span></label>
									</div>
									<div class="four wide field">
										<input type="date" name="edu_start_date"  max="9999-12-31">
									</div>
									<div class="one wide field">~</div>
									<div class="four wide field">
										<input type="date" name="edu_end_date" max="9999-12-31">
									</div>
									<div class="four wide field">
										<select class="dropdown" name="edu_status_code">
											<c:forEach items="${ eduStatusList }" var="e">
												<option value='<c:out value="${ e.edu_status_code }" />'>
													<c:out value="${ e.edu_status_name }" />
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
					</form>
				</c:if>

				<!-- 교육사항 입력란 -->
				<c:forEach items="${ eduList }" var="edu">
					<form method="post" class="ui form eduForm">
						<div class="item college">
							<input type="hidden" value="${ edu.edu_no }" name="edu_no"> <br>
							<div class="ui grid">
								<div class="four column row">
									<div class="left floated column">
										<h5 class="ui header">교육사항 입력</h5>
									</div>
									<div class="right floated column" align="right"
										style="margin-right: 1em;">
										<button class="mini negative ui button deleteEdu"
											type="button">삭제</button>
									</div>
								</div>
							</div>

							<hr>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>교육과정명<span class="required-info">*</span></label>
									</div>
									<div class="thirteen wide field">
										<input type="text" name="edu_name"
											value="${ edu.edu_name }">
									</div>
								</div>
							</div>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>교육기관명<span class="required-info">*</span></label>
									</div>
									<div class="thirteen wide field">
										<input type="text" name="edu_institute_name"
											value="${ edu.edu_institute_name }">
									</div>
								</div>
							</div>

							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>교육기간<span class="required-info">*</span></label>
									</div>
									<div class="four wide field">
										<input type="date" name="edu_start_date"
											value="${ edu.edu_start_date }"
											max="9999-12-31">
									</div>
									<div class="one wide field">~</div>
									<div class="four wide field">
										<input type="date" name="edu_end_date"
											value="${ edu.edu_end_date }"
											max="9999-12-31">
									</div>
									<div class="four wide field">
										<select class="dropdown" name="edu_status_code">
											<c:forEach items="${ eduStatusList }" var="e">
												<option value='<c:out value="${ e.edu_status_code }" />'
													<c:if test="${ edu.edu_status_code eq e.edu_status_code }">selected</c:if>><c:out
														value="${ e.edu_status_name }" /></option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
					</form>
				</c:forEach>
				<!-- 교육사항 입력란 끝 -->
			</div>
			<div>
				<button class="ui primary button" onclick="addEdu()"
					style="float: right; margin-right: 1em; margin-bottom: 1em;"
					type="button">교육사항 추가</button>
			</div>
		</div>
		<!-- 교육 등록 영역 끝 -->

		<!-- 교육 목록 영역 -->
		<div class="five wide column" id="eduListArea">
			<div class="left floated column">
				<h5 class="ui header">교육 목록</h5>
			</div>
			<hr>

			<ol class="ui list">
				<c:forEach items="${ eduList }" var="edu" varStatus="status">
					<li>
						<div class="ui visible message">
							<p>${ edu.edu_name }</p>
						</div>
					</li>
				</c:forEach>
			</ol>
		</div>
		<!-- 교육 목록 영역 끝 -->
	</div>
</div>
<script type="text/javascript" src="resources/js/eduForm.js"></script>