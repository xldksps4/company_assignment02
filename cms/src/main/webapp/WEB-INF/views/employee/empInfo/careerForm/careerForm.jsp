<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
#careerArea>div {
	height: 500px;
	overflow: auto;
}

.projectArea a {
	width: 100% !important;
}

#careerListArea {
	padding: 2em;
}

#careerArea input {
	width: 100%;
}

.ui.form .inline.fields .field>.selection.dropdown {
	min-width: auto !important;
	width: 100%;
}

.projectBtn {
	width: 100%;
}

.projectListArea {
	min-height: 230px;
}

.projectNameMenu:hover {
	background: rgba(0, 0, 0, .05) !important;
}

.gray-text {
	color: gray;
}
</style>

<!-- 경력사항 추가 폼 -->
<form method="post" class="ui form careerForm" id="careerFormOriginal"
	style="display: none;">
	<div class="item">
		<input type="hidden" value="0" name="career_no"> <br>
		<div class="ui grid">
			<div class="four column row">
				<div class="left floated column">
					<h5 class="ui header">경력사항 입력</h5>
				</div>
				<div class="right floated column" align="right"
					style="margin-right: 1em;">
					<button class="mini negative ui button deleteCareer" type="button">삭제</button>
				</div>
			</div>
		</div>
		<hr>
		<div class="ui form">
			<div class="inline fields">
				<div class="three wide field">
					<label>회사명<span class="required-info">*</span></label>
				</div>
				<div class="thirteen wide field">
					<input type="text" placeholder="회사명을 입력하세요." name="company_name">
				</div>
			</div>
		</div>
		<div class="ui form">
			<div class="inline fields">
				<div class="three wide field">
					<label>직급<span class="required-info">*</span></label>
				</div>
				<div class="thirteen wide field">
					<input type="text" name="position">
				</div>
			</div>
		</div>
		<div class="ui form">
			<div class="inline fields">
				<div class="three wide field">
					<label>근무기간<span class="required-info">*</span></label>
				</div>
				<div class="four wide field">
					<input class="c_date" type="date" name="hire_date" max="9999-12-31">
				</div>
				<div class="one wide field">~</div>
				<div class="four wide field">
					<input class="c_date" type="date" name="resignation_date" max="9999-12-31">
				</div>
				<div class="four wide field">
					<label class="career_date">00년 00개월</label>
				</div>
			</div>
		</div>
		<div class="ui accordion field">
			<div class="title active" data-tooltip="클릭하면 접거나 펼칠 수 있습니다." data-position="top left">
				<i class="icon dropdown"></i>수행 프로젝트
			</div>
			<div class="content field active">
				<div class="ui grid projectArea">
					<div class="five wide column">
						<div class="row projectListArea">
							<div class="ui fluid vertical menu projectList"></div>
						</div>
						<div class="row">
							<button class="positive ui button addProject projectBtn"
								type="button">프로젝트 추가</button>
						</div>
						<div class="row">
							<button class="ui button deleteProject projectBtn" type="button">프로젝트
								삭제</button>
						</div>
					</div>
					<div class="eleven wide column">
						<div class="ui list projectInputArea" style="display: none;">
							<div class="item">
								<div class="ui form">
									<div class="inline fields">
										<div class="four wide field">
											<label>프로젝트명<span class="required-info">*</span></label>
										</div>
										<div class="twelve wide field">
											<input type="text" class="project_name">
										</div>
									</div>
								</div>
								<div class="ui form">
									<div class="inline fields">
										<div class="four wide field">
											<label>참여기간</label>
										</div>
										<div class="five wide field">
											<input type="date" class="start_date" max="9999-12-31">
										</div>
										<div class="two wide field" style="justify-content: center;">~</div>
										<div class="five wide field">
											<input type="date" class="end_date" max="9999-12-31">
										</div>
									</div>
								</div>
								<div class="ui form">
									<div class="inline fields">
										<div class="four wide field">
											<label>고객사</label>
										</div>
										<div class="twelve wide field">
											<input type="text" class="client">
										</div>
									</div>
								</div>
								<div class="ui form">
									<div class="inline fields">
										<div class="four wide field">
											<label>근무회사</label>
										</div>
										<div class="twelve wide field">
											<input type="text" class="workplace">
										</div>
									</div>
								</div>
								<div class="ui form">
									<div class="inline fields">
										<div class="four wide field">
											<label>역할</label>
										</div>
										<div class="twelve wide field">
											<input type="text" class="part">
										</div>
									</div>
								</div>
								<div class="ui form field">
									<div class="ui accordion field">
										<div class="title active" data-tooltip="클릭하면 접거나 펼칠 수 있습니다." data-position="top left">
											<i class="icon dropdown"></i> 개발환경
										</div>
										<div class="content field active">
											<table class="ui table">
												<tbody>
													<tr>
														<td>OS</td>
														<td><input type="text" class="os"></td>
													</tr>
													<tr>
														<td>언어</td>
														<td><input type="text" class="language"></td>
													</tr>
													<tr>
														<td>DB</td>
														<td><input type="text" class="db"></td>
													</tr>
													<tr>
														<td>Tool</td>
														<td><input type="text" class="tool"></td>
													</tr>
													<tr>
														<td>WAS</td>
														<td><input type="text" class="was"></td>
													</tr>
													<tr>
														<td>기타</td>
														<td><input type="text" class="etc"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
</form>

<!-- 프로젝트 추가 폼 -->
<div class="item projectNameMenu" id="projectFormOriginal" style="display: none;">
	<span class="project_name gray-text">(프로젝트명을 입력하세요)</span> <input
		type="hidden" value="0" class="project_no" data-career_num="0">
</div>



<div id="area" class="ui grid">

	<!-- 총 경력 란 -->
	<div class="row">
		<div class="ui form column" style="padding: 0px;">
			<div class="inline fields">
				<div class="two wide field">
					<h4 class="ui header">총 경력</h4>
				</div>
				<div class="twelve wide field">
					<input type="text" placeholder="총 경력" readonly="readonly"
						id="totalCareer">
				</div>
				<div class="two wide field" style="padding-right: 0px;">
					<button class="ui primary button" style="width: 100%;"
						onclick="careerCheck()">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 총 경력 란 끝 -->

	<div class="row" align="left" id="careerArea">
		<div class="eleven wide column">
			<div class="ui list" id="careerList">
				<c:if test="${ fn:length(careerList) <= 0 }">
					<!-- 경력 등록 영역 -->
					<form method="post" class="ui form careerForm">
						<div class="item">
							<input type="hidden" value="0" name="career_no"> <br>
							<div class="ui grid">
								<div class="four column row">
									<div class="column">
										<h5 class="ui header">경력사항 입력</h5>
									</div>
								</div>
							</div>
							<hr>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>회사명<span class="required-info">*</span></label>
									</div>
									<div class="thirteen wide field">
										<input type="text" placeholder="회사명을 입력하세요."
											name="company_name">
									</div>
								</div>
							</div>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>직급<span class="required-info">*</span></label>
									</div>
									<div class="thirteen wide field">
										<input type="text" name="position">
									</div>
								</div>
							</div>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>근무기간<span class="required-info">*</span></label>
									</div>
									<div class="four wide field">
										<input type="date" class="c_date" name="hire_date" max="9999-12-31">
									</div>
									<div class="one wide field">~</div>
									<div class="four wide field">
										<input type="date" class="c_date" name="resignation_date" max="9999-12-31">
									</div>
									<div class="four wide field">
										<label class="career_date">00년 00개월</label>
									</div>
								</div>
							</div>
							<div class="ui accordion field">
								<div class="title active" data-tooltip="클릭하면 접거나 펼칠 수 있습니다." data-position="top left">
									<i class="icon dropdown"></i>수행 프로젝트
								</div>
								<div class="content field active">
									<div class="ui grid projectArea">
										<div class="five wide column">
											<div class="row projectListArea">
												<div class="ui fluid vertical menu projectList"></div>
											</div>
											<div class="row">
												<button class="positive ui button addProject projectBtn"
													type="button">프로젝트 추가</button>
											</div>
											<div class="row">
												<button class="ui button deleteProject projectBtn"
													type="button">프로젝트 삭제</button>
											</div>
										</div>
										<div class="eleven wide column">
											<div class="ui list projectInputArea" style="display: none;">
												<div class="item">
													<div class="ui form">
														<div class="inline fields">
															<div class="four wide field">
																<label>프로젝트명<span class="required-info">*</span></label>
															</div>
															<div class="twelve wide field">
																<input type="text" class="project_name">
															</div>
														</div>
													</div>
													<div class="ui form">
														<div class="inline fields">
															<div class="four wide field">
																<label>참여기간</label>
															</div>
															<div class="five wide field">
																<input type="date" class="start_date" max="9999-12-31">
															</div>
															<div class="two wide field"
																style="justify-content: center;">~</div>
															<div class="five wide field">
																<input type="date" class="end_date" max="9999-12-31">
															</div>
														</div>
													</div>
													<div class="ui form">
														<div class="inline fields">
															<div class="four wide field">
																<label>고객사</label>
															</div>
															<div class="twelve wide field">
																<input type="text" class="client">
															</div>
														</div>
													</div>
													<div class="ui form">
														<div class="inline fields">
															<div class="four wide field">
																<label>근무회사</label>
															</div>
															<div class="twelve wide field">
																<input type="text" class="workplace">
															</div>
														</div>
													</div>
													<div class="ui form">
														<div class="inline fields">
															<div class="four wide field">
																<label>역할</label>
															</div>
															<div class="twelve wide field">
																<input type="text" class="part">
															</div>
														</div>
													</div>
													<div class="ui form field">
														<div class="ui accordion field">
															<div class="title active" data-tooltip="클릭하면 접거나 펼칠 수 있습니다." data-position="top left">
																<i class="icon dropdown"></i> 개발환경
															</div>
															<div class="content field active">
																<table class="ui table">
																	<tbody>
																		<tr>
																			<td>OS</td>
																			<td><input type="text" class="os"></td>
																		</tr>
																		<tr>
																			<td>언어</td>
																			<td><input type="text" class="language"></td>
																		</tr>
																		<tr>
																			<td>DB</td>
																			<td><input type="text" class="db"></td>
																		</tr>
																		<tr>
																			<td>Tool</td>
																			<td><input type="text" class="tool"></td>
																		</tr>
																		<tr>
																			<td>WAS</td>
																			<td><input type="text" class="was"></td>
																		</tr>
																		<tr>
																			<td>기타</td>
																			<td><input type="text" class="etc"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr>
					</form>
					<!-- 경력사항 입력란 끝 -->
				</c:if>

				<c:forEach items="${ careerList }" var="c" varStatus="status">

					<!-- 경력사항 입력란 -->
					<form method="post" class="ui form careerForm">
						<div class="item">
							<input type="hidden"
								value="${ careerList[status.index].career_no }" name="career_no">
							<br>
							<div class="ui grid">
								<div class="four column row">
									<div class="left floated column">
										<h5 class="ui header">경력사항 입력</h5>
									</div>
									<div class="right floated column" align="right"
										style="margin-right: 1em;">
										<button class="mini negative ui button deleteCareer"
											type="button">삭제</button>
									</div>
								</div>
							</div>

							<hr>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>회사명<span class="required-info">*</span></label>
									</div>
									<div class="thirteen wide field">
										<input type="text" placeholder="회사명을 입력하세요."
											name="company_name"
											value="${ careerList[status.index].company_name }">
									</div>
								</div>
							</div>

							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>직급<span class="required-info">*</span></label>
									</div>
									<div class="thirteen wide field">
										<input type="text" name="position"
											value="${ careerList[status.index].position }">
									</div>
								</div>
							</div>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>근무기간<span class="required-info">*</span></label>
									</div>
									<div class="four wide field">
										<input type="date" class="c_date" name="hire_date" max="9999-12-31"
											value="${ careerList[status.index].hire_date }">
									</div>
									<div class="one wide field">~</div>
									<div class="four wide field">
										<input type="date" class="c_date" name="resignation_date" max="9999-12-31"
											value="${ careerList[status.index].resignation_date }">
									</div>
									<div class="four wide field">
										<label class="career_date">00년 00개월</label>
									</div>
								</div>
							</div>

							<!-- 프로젝트 영역 -->

							<div class="ui accordion field">
								<div class="title active" data-tooltip="클릭하면 접거나 펼칠 수 있습니다." data-position="top left">
									<i class="icon dropdown"></i>수행 프로젝트
								</div>
								<div class="content field active">
									<div class="ui grid projectArea">
										<div class="five wide column">
											<div class="row projectListArea">

												<div class="ui fluid vertical menu projectList">
													<c:forEach
														items="${ careerList[status.index].projectList }" var="p">
														<div class="item projectNameMenu">
															<span class="project_name">${ p.project_name }</span>
															<input type="hidden"
															value="${ p.project_no }" class="project_no"
															data-career_num="${ p.career_num }"
															data-project_name="${ p.project_name }"
															data-start_date="${ p.start_date }"
															data-end_date="${ p.end_date }"
															data-client="${ p.client }"
															data-workplace="${ p.workplace }"
															data-part="${ p.part }" data-os="${ p.os }"
															data-language="${ p.language }" data-db="${ p.db }"
															data-tool="${ p.tool }" data-was="${ p.was }"
															data-etc="${ p.etc }">
														</div>
													</c:forEach>
												</div>

											</div>
											<div class="row">
												<button class="positive ui button addProject projectBtn"
													type="button">프로젝트 추가</button>
											</div>
											<div class="row">
												<button class="ui button deleteProject projectBtn"
													type="button">프로젝트 삭제</button>
											</div>
										</div>

										<div class="eleven wide column">

											<div class="ui list projectInputArea" style="display: none;">
												<div class="item">
													<div class="ui form">
														<div class="inline fields">
															<div class="four wide field">
																<label>프로젝트명<span class="required-info">*</span></label>
															</div>
															<div class="twelve wide field">
																<input type="text" class="project_name">
															</div>
														</div>
													</div>

													<div class="ui form">
														<div class="inline fields">
															<div class="four wide field">
																<label>참여기간<span class="required-info">*</span></label>
															</div>
															<div class="five wide field">
																<input type="date" class="start_date" max="9999-12-31">
															</div>
															<div class="two wide field"
																style="justify-content: center;">~</div>
															<div class="five wide field">
																<input type="date" class="end_date" max="9999-12-31">
															</div>
														</div>
													</div>

													<div class="ui form">
														<div class="inline fields">
															<div class="four wide field">
																<label>고객사</label>
															</div>
															<div class="twelve wide field">
																<input type="text" class="client">
															</div>
														</div>
													</div>

													<div class="ui form">
														<div class="inline fields">
															<div class="four wide field">
																<label>근무회사</label>
															</div>
															<div class="twelve wide field">
																<input type="text" class="workplace">
															</div>
														</div>
													</div>

													<div class="ui form">
														<div class="inline fields">
															<div class="four wide field">
																<label>역할</label>
															</div>
															<div class="twelve wide field">
																<input type="text" class="part">
															</div>
														</div>
													</div>


													<div class="ui form field">

														<div class="ui accordion field">
															<div class="title active" data-tooltip="클릭하면 접거나 펼칠 수 있습니다." data-position="top left">
																<i class="icon dropdown"></i> 개발환경
															</div>
															<div class="content field active">

																<table class="ui table">
																	<tbody>
																		<tr>
																			<td>OS</td>
																			<td><input type="text" class="os"></td>
																		</tr>
																		<tr>
																			<td>언어</td>
																			<td><input type="text" class="language"></td>
																		</tr>
																		<tr>
																			<td>DB</td>
																			<td><input type="text" class="db"></td>
																		</tr>
																		<tr>
																			<td>Tool</td>
																			<td><input type="text" class="tool"></td>
																		</tr>
																		<tr>
																			<td>WAS</td>
																			<td><input type="text" class="was"></td>
																		</tr>
																		<tr>
																			<td>기타</td>
																			<td><input type="text" class="etc"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 프로젝트 영역 끝 -->
						</div>
						<hr>
					</form>
					<!-- 경력사항 입력란 끝 -->
				</c:forEach>
			</div>
			<div>
				<button class="ui primary button" onclick="addCareer()"
					style="float: right; margin-right: 1em; margin-bottom: 1em;"
					type="button">경력사항 추가</button>
			</div>
		</div>
		<!-- 경력 등록 영역 끝 -->

		<!-- 경력 목록 영역 -->
		<div class="five wide column" id="careerListArea">
			<div class="left floated column">
				<h5 class="ui header">경력 목록</h5>
			</div>
			<hr>

			<ol class="ui list">
				<c:forEach items="${ careerList }" var="c" varStatus="status">
					<li>
						<div class="ui visible message">
							<p>${ c.company_name }
								<c:forEach items="${ c.projectList }" var="p" varStatus="st">
									<br>- ${ p.project_name }
									</c:forEach>
							</p>
						</div>
					</li>
				</c:forEach>
			</ol>
		</div>
		<!-- 학력 목록 영역 끝 -->
	</div>
</div>

<script type="text/javascript" src="resources/js/careerForm.js"></script>