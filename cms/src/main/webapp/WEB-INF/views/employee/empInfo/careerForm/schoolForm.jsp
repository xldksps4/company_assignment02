<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
#schoolArea>div {
	height: 500px;
	overflow: auto;
}

#schoolListArea {
	padding: 2em;
}

#schoolArea input {
	width: 100%;
}

.ui.form .inline.fields .field>.selection.dropdown {
	min-width: auto !important;
	width: 100%;
}
</style>

<!-- 대학, 대학원 추가 폼 -->
<form method="post" class="ui form schoolForm" id="schoolFormOriginal"
	style="display: none;">
	<div class="item college">
		<input type="hidden" value="0" name="school_no"> <br>
		<div class="ui grid">
			<div class="four column row">
				<div class="left floated column">
					<h5 class="ui header">대학·대학원 정보 입력</h5>
				</div>
				<div class="right floated column" align="right"
					style="margin-right: 1em;">
					<button class="mini negative ui button deleteSchool" type="button">삭제</button>
				</div>
			</div>
		</div>
		<hr>
		<div class="ui form">
			<div class="inline fields">
				<div class="three wide field">
					<label>학교명<span class="required-info">*</span></label>
				</div>
				<div class="eight wide field">
					<input type="text" placeholder="학교명을 입력하세요." name="school_name">
				</div>
				<div class="five wide field">
					<select class="dropdown" name="degree_code">
						<c:forEach items="${ degreeList }" var="d" begin="1">
							<option value='<c:out value="${ d.degree_code }" />' <c:if test="${ d.degree_name eq '학사' }">selected</c:if>><c:out
									value="${ d.degree_name }" /></option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<div class="ui form">
			<div class="inline fields">
				<div class="three wide field">
					<label>재학기간<span class="required-info">*</span></label>
				</div>
				<div class="four wide field">
					<input type="text" name="admission_date" class="dateInput"
						placeholder="0000.00">
				</div>
				<div class="one wide field">~</div>
				<div class="four wide field">
					<input type="text" name="graduate_date" class="dateInput"
						placeholder="0000.00">
				</div>
				<div class="four wide field">
					<select class="dropdown" name="graduate_status_code">
						<c:forEach items="${ graduateList }" var="g">
							<option value="${ g.graduate_status_code }"><c:out
									value="${ g.graduate_status_name }" /></option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<div class="ui form">
			<div class="inline fields">
				<div class="three wide field">
					<label>전공<span class="required-info">*</span></label>
				</div>
				<div class="thirteen wide field">
					<input type="text" name="major">
				</div>
			</div>
		</div>
	</div>
</form>
<!-- 대학, 대학원 추가 폼 끝 -->

<div id="area" class="ui grid">
	<!-- 최종학력란 -->
	<div class="row">
		<div class="ui form column" style="padding: 0px;">
			<div class="inline fields">
				<div class="two wide field">
					<h4 class="ui header">
						최종학력<span class="required-info">*</span>
					</h4>
				</div>
				<div class="twelve wide field">
					<c:set value="${ fn:length(schoolList) - 1 }" var="last" />
					<input type="text" placeholder="최종학력" readonly="readonly"
						id="lastSchool"
						<c:if test="${ fn:length(schoolList) > 0 && schoolList[last].school_name eq null }">
										value="${ schoolList[last].degree_name }, 검정고시, ${ schoolList[last].graduate_status_name }"
							</c:if>
						<c:if test="${ fn:length(schoolList) > 0 && schoolList[last].school_name ne null }">
										value="${ schoolList[last].degree_name }, ${ schoolList[last].school_name }, ${ schoolList[last].graduate_status_name }"
							</c:if>>
				</div>
				<div class="two wide field" style="padding-right: 0px;">
					<button class="ui primary button" style="width: 100%;"
						onclick="schoolCheck()">저장</button>
				</div>
			</div>
		</div>
	</div>

	<div class="row" align="left" id="schoolArea">

		<!-- 학력 등록 영역 -->
		<div class="eleven wide column">
			<div class="ui list" id="schoolList">

				<c:if test="${ fn:length(schoolList) <= 0 }">
					<!-- 고등학교 폼으로 출력 -->
					<form method="post" class="ui form schoolForm">
						<div class="item" id="highSchool">

							<input type="hidden" value="0" name="school_no">
							<input type="hidden" value="1"
								name="graduate_status_code"> <input type="hidden"
								value="1" name="degree_code">
							<h5 class="ui header">고등학교 정보 입력</h5>

							<hr>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>학교명<span class="required-info">*</span></label>
									</div>
									<div class="ten wide field">
										<input type="text" placeholder="학교명을 입력하세요."
											name="school_name">
									</div>
									<div class="three wide field">
										<div class="ui checkbox">
											<input type="checkbox" class="qualification">
											<label>검정고시</label>
										</div>
									</div>
								</div>
							</div>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>졸업년도<span class="required-info">*</span></label>
									</div>
									<div class="six wide field">
										<input type="text" name="admission_date" class="dateInput"
											placeholder="0000.00">
									</div>
									<div class="one wide field">~</div>
									<div class="six wide field">
										<input type="text" name="graduate_date" class="dateInput"
											placeholder="0000.00">
									</div>
								</div>
							</div>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>전공</label>
									</div>
									<div class="thirteen wide field">
										<input type="text" name="major">
									</div>
								</div>
							</div>
						</div>
					</form>
				</c:if>

				<c:forEach items="${ schoolList }" var="s">

					<c:if test="${ s.degree_code eq 1 }">
						<!-- 고등학교 폼으로 출력 -->
						<form method="post" class="ui form schoolForm">
							<div class="item" id="highSchool">

								<input type="hidden" value="${ s.school_no }" name="school_no">
								<input type="hidden" value="${ s.graduate_status_code }"
									name="graduate_status_code"> <input type="hidden"
									value="${ s.degree_code }" name="degree_code">
								<h5 class="ui header">고등학교 정보 입력</h5>

								<hr>
								<div class="ui form">
									<div class="inline fields">
										<div class="three wide field">
											<label>학교명<span class="required-info">*</span></label>
										</div>
										<div class="ten wide field">
											<input type="text" placeholder="학교명을 입력하세요."
												name="school_name" value="${ s.school_name }">
										</div>
										<div class="three wide field">
											<div class="ui checkbox">
												<input type="checkbox" class="qualification"
													<c:if test="${ s.school_name eq null }">checked</c:if>>
												<label>검정고시</label>
											</div>
										</div>
									</div>
								</div>
								<div class="ui form">
									<div class="inline fields">
										<div class="three wide field">
											<label>졸업년도<span class="required-info">*</span></label>
										</div>
										<div class="six wide field">
											<input type="text" name="admission_date" class="dateInput"
												placeholder="0000.00" value="${ s.admission_date }">
										</div>
										<div class="one wide field">~</div>
										<div class="six wide field">
											<input type="text" name="graduate_date" class="dateInput"
												placeholder="0000.00" value="${ s.graduate_date }">
										</div>
									</div>
								</div>
								<div class="ui form">
									<div class="inline fields">
										<div class="three wide field">
											<label>전공</label>
										</div>
										<div class="thirteen wide field">
											<input type="text" name="major" value="${ s.major }">
										</div>
									</div>
								</div>
							</div>
						</form>
					</c:if>

					<c:if test="${ s.degree_code ne 1 }">
						<!-- 대학교 폼으로 출력 -->
						<form method="post" class="ui form schoolForm">
							<div class="item college">
								<input type="hidden" value="${ s.school_no }" name="school_no">
								<br>
								<div class="ui grid">
									<div class="four column row">
										<div class="left floated column">
											<h5 class="ui header">대학·대학원 정보 입력</h5>
										</div>
										<div class="right floated column" align="right"
											style="margin-right: 1em;">
											<button class="mini negative ui button deleteSchool"
												type="button">삭제</button>
										</div>
									</div>
								</div>
								<hr>
								<div class="ui form">
									<div class="inline fields">
										<div class="three wide field">
											<label>학교명<span class="required-info">*</span></label>
										</div>
										<div class="eight wide field">
											<input type="text" placeholder="학교명을 입력하세요."
												name="school_name" value="${ s.school_name }">
										</div>
										<div class="five wide field">
											<select class="dropdown" name="degree_code">
												<c:forEach items="${ degreeList }" var="d" begin="1">
													<option value='<c:out value="${ d.degree_code }" />'
														<c:if test="${ s.degree_code eq d.degree_code }">selected</c:if>><c:out
															value="${ d.degree_name }" /></option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<div class="ui form">
									<div class="inline fields">
										<div class="three wide field">
											<label>재학기간<span class="required-info">*</span></label>
										</div>
										<div class="four wide field">
											<input type="text" name="admission_date" class="dateInput"
												placeholder="0000.00" value="${ s.admission_date }">
										</div>
										<div class="one wide field">~</div>
										<div class="four wide field">
											<input type="text" name="graduate_date" class="dateInput"
												placeholder="0000.00" value="${ s.graduate_date }">
										</div>
										<div class="four wide field">
											<select class="dropdown" name="graduate_status_code">
												<c:forEach items="${ graduateList }" var="g">
													<option value="${ g.graduate_status_code }"
														<c:if test="${ s.graduate_status_code eq g.graduate_status_code }">selected</c:if>><c:out
															value="${ g.graduate_status_name }" /></option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<div class="ui form">
									<div class="inline fields">
										<div class="three wide field">
											<label>전공<span class="required-info">*</span></label>
										</div>
										<div class="thirteen wide field">
											<input type="text" name="major" value="${ s.major }">
										</div>
									</div>
								</div>
							</div>
						</form>
					</c:if>

				</c:forEach>
			</div>
			<div>
				<button class="ui primary button" onclick="addSchool()"
					style="float: right; margin-right: 1em; margin-bottom: 1em;"
					type="button">대학·대학원 추가</button>
			</div>
		</div>
		<!-- 학력 등록 영역 끝 -->

		<!-- 학력 목록 영역 -->
		<div class="five wide column" id="schoolListArea">
			<div class="left floated column">
				<h5 class="ui header">학력 목록</h5>
			</div>
			<hr>
			<ol class="ui list">
				<c:forEach items="${ schoolList }" var="s" varStatus="status">
					<li>
						<div class="ui visible message">
							<p>
								<c:out value="${ s.school_name }" />
							</p>
						</div>
					</li>
				</c:forEach>
			</ol>
		</div>
		<!-- 학력 목록 영역 끝 -->
	</div>
</div>
<script type="text/javascript" src="resources/js/schoolForm.js"></script>