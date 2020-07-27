<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.searchHeader {
	width: 20% !important;
}

.searchList {
	width: 80% !important;
	text-align: left;
}

.skillTable th {
	text-align: center !important;
}

.skillTable th {
	padding: 0.5em;
	font-size: small;
}

.checkName {
	padding-left: 0.5em;
	padding-right: 0.5em;
	display: inline-block;
}

.div.left {
	float: left;
}

.div.right {
	float: right;
}

#searchListTable {
	text-align: center;
}

#searchListTable tbody tr {
	cursor: pointer;
}

#searchListTable tbody tr:hover {
	background: #2185d0;
	color: white;
}

.item.disabledPaging {
	color: lightgray !important;
	cursor: default !important;
}

.item.selectPaging {
	font-weight: bold !important;
}

#skillArea, #keywordArea, #etcArea {
	text-align: left;
}
</style>
<jsp:include page="/WEB-INF/views/common/mainNav.jsp" />
<div class="content-area ui container">
	<div class="ui container column" align="center" id="formArea">

		<form class="ui form segment" id="searchForm">
			<p>SEARCH</p>
			<div class="two fields">
				<div class="field">
					<label>이름</label> <input placeholder="검색할 이름을 입력하세요."
						name="emp_name" type="text">
				</div>
				<div class="field">
					<label>성별</label> <select class="ui dropdown" name="gender">
						<option value="">무관</option>
						<option value="M">남자</option>
						<option value="F">여자</option>
					</select>
				</div>
			</div>
			<div class="two fields">
				<div class="field">
					<label>등급</label>
					<div class="four fields">
						<div class="field">
							<div class="ui checkbox">
								<input type="checkbox" class="grade" value="초급"> <label>초급</label>
							</div>
						</div>
						<div class="field">
							<div class="ui checkbox">
								<input type="checkbox" class="grade" value="중급"> <label>중급</label>
							</div>
						</div>
						<div class="field">
							<div class="ui checkbox">
								<input type="checkbox" class="grade" value="고급"> <label>고급</label>
							</div>
						</div>
						<div class="field">
							<div class="ui checkbox">
								<input type="checkbox" class="grade" value="특급"> <label>특급</label>
							</div>
						</div>
					</div>
				</div>

				<div class="field">
					<div class="field">
						<label>현 상태</label>
						<div class="three fields">
							<div class="field">
								<div class="ui checkbox">
									<input type="checkbox" class="status_name" value="대기중">
									<label>대기중</label>
								</div>
							</div>
							<div class="field">
								<div class="ui checkbox">
									<input type="checkbox" class="status_name" value="진행중">
									<label>진행중</label>
								</div>
							</div>
							<div class="field">
								<div class="ui checkbox">
									<input type="checkbox" class="status_name" value="종료임박">
									<label>종료임박</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ui horizontal divider">▼</div>
			<!-- 상세검색 -->
			<div class="ui styled fluid accordion">
				<div class="title">상세검색</div>

				<div class="content">
					<div class="ui divider"></div>
					<!-- 검색항목 -->
					<div class="two fields">
						<div class="field searchHeader">
							<label>부서</label>
						</div>

						<div class="field searchList">
							<div class="five fields">
								<c:forEach items="${ deptList }" var="d">
									<div class="field">
										<div class="ui checkbox">
											<input type="checkbox" class="dept_code" value='<c:out value="${ d.dept_code }" />'> 
											<label><c:out value="${ d.dept_name }" /></label>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- 검색항목 끝 -->

					<!-- 검색항목 -->
					<div class="two fields">
						<div class="field searchHeader">
							<label>구분</label>
						</div>

						<div class="field searchList">
							<div class="five fields">
								<c:forEach items="${ skillTypeList }" var="st">
									<div class="field">
										<div class="ui checkbox">
											<input type="checkbox" class="skill_type_code" value='<c:out value="${ st.skill_type_code }" />'>
											<label><c:out value="${ st.skill_type_name }" /></label>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- 검색항목 끝 -->

					<!-- 검색항목 -->
					<div class="two fields">
						<div class="field searchHeader">
							<label>자격증</label>
						</div>

						<div class="field searchList">
							<div class="five fields">
								<c:forEach items="${ liList }" var="l">
									<div class="field">
										<div class="ui checkbox">
											<input type="checkbox" class="license_list_code" value='<c:out value="${ l.license_list_code }" />'>
											<label><c:out value="${ l.license_list_name }" /></label>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- 검색항목 끝 -->

					<!-- 검색항목 -->
					<!-- 스킬테이블 -->
					<div class="skill field">
						<!-- 스킬 영역 -->
						<br>
						<div class="skill field">
							<table class="ui table skillTable">
								<thead>
									<tr>
										<td rowspan="3" width="100px;">검색 키워드</td>
										<td colspan="1" style="width: 110px;">SKILL</td>
										<td colspan="5" id="skillArea"></td>
									</tr>
									<tr>
										<td colspan="1" style="width: 110px;">KEYWORD</td>
										<td colspan="5" id="keywordArea"></td>
									</tr>
									<tr>
										<td colspan="1" style="width: 110px;">기타</td>
										<td colspan="5" id="etcArea"></td>
									</tr>
								</thead>
								<tbody style="display: none;">

									<!-- row 계산 -->
									<c:forEach items="${ skills }" var="skill">
										<c:if test="${ skill.skill_type_code eq 1 }">
											<c:set var="skill_count_type1"
												value="${ skill_count_type1 + 1 }" />
										</c:if>
										<c:if test="${ skill.skill_type_code eq 2 }">
											<c:set var="skill_count_type2"
												value="${ skill_count_type2 + 1 }" />
										</c:if>
										<c:if test="${ skill.skill_type_code eq 3 }">
											<c:set var="skill_count_type3"
												value="${ skill_count_type3 + 1 }" />
										</c:if>
									</c:forEach>

									<!-- 개발 rowspan 계산 -->
									<c:set var="total_skill_row" value="${ fn:length(skills) / 4 }" />
									<c:set var="total_skill_count"
										value="${ total_skill_row + (1 - (total_skill_row % 1)) % 1 }" />

									<!-- 기술 - 개발 rowspan 계산 -->
									<c:set var="type1_skill_row" value="${ skill_count_type1 / 4 }" />
									<c:set var="type1_skill_count"
										value="${ type1_skill_row + (1 - (type1_skill_row % 1)) % 1 }" />

									<c:set var="type2_skill_row" value="${ skill_count_type2 / 4 }" />
									<c:set var="type2_skill_count"
										value="${ type2_skill_row + (1 - (type2_skill_row % 1)) % 1 }" />

									<c:set var="type3_skill_row" value="${ skill_count_type3 / 4 }" />
									<c:set var="type3_skill_count"
										value="${ type3_skill_row + (1 - (type3_skill_row % 1)) % 1 }" />

									<!-- 키워드 rowspan 계산 -->
									<c:set var="total_keyword_row"
										value="${ fn:length(keywords) / 4 }" />
									<c:set var="total_keyword_count"
										value="${ total_keyword_row + (1 - (total_keyword_row % 1)) % 1 }" />

									<!-- 기타 rowspan 계산 -->
									<c:set var="total_etc_row" value="${ fn:length(etcs) / 4 }" />
									<c:set var="total_etc_count"
										value="${ total_etc_row + (1 - (total_etc_row % 1)) % 1 }" />

									<!-- 스킬 -->
									<c:forEach items="${ skills }" var="sk">

										<c:if test="${ sk.skill_type_code eq 1 }">
											<!-- 스킬 - 개발 -->
											<c:set var="type1_count" value="${ type1_count + 1 }" />

											<!-- 첫번째 th포함 -->
											<c:if test="${ type1_count <= 4 }">

												<c:if test="${ type1_count eq 1 }">
													<!-- 첫째줄 th 포함 -->
													<tr>
														<th rowspan="${ total_skill_count }"
															class="skillTable main th" style="background: #2185d0;">기술분야<br>(직무)
															<span class="required-info">*</span>
														</th>
														<th rowspan="${ type1_skill_count }"
															class="skillTable sub th" style="background: #2185d08c;">개발</th>
												</c:if>

												<td>
													<div class="ui checkbox">
														<input type="checkbox" tabindex="0" class="hidden"
															name="skill_code"
															value='<c:out value="${ sk.skill_code }" />'> <label><c:out
																value="${ sk.skill_name }" /></label>
													</div>
												</td>

											</c:if>

											<c:if test="${ type1_count > 4 }">
												<c:if test="${ type1_count % 4 eq 1 }">
													<!-- tr 포함 -->
													<tr>
												</c:if>

												<td>
													<div class="ui checkbox">
														<input type="checkbox" tabindex="0" class="hidden"
															name="skill_code"
															value='<c:out value="${ sk.skill_code }" />'> <label><c:out
																value="${ sk.skill_name }" /></label>
													</div>
												</td>
											</c:if>
										</c:if>

										<c:if test="${ sk.skill_type_code eq 2 }">
											<!-- 스킬 - 디자이너 퍼블리셔 -->
											<c:set var="type2_count" value="${ type2_count + 1 }" />

											<!-- 첫번째 th포함 -->
											<c:if test="${ type2_count <= 4 }">

												<c:if test="${ type2_count eq 1 }">
													<!-- 첫째줄 th 포함 -->
													<tr>
														<th rowspan="${ type2_skill_count }"
															class="skillTable sub th" style="background: #215fd08c;">디자이너<br>퍼블리셔





														
												</c:if>

												<td>
													<div class="ui checkbox">
														<input type="checkbox" tabindex="0" class="hidden"
															name="skill_code"
															value='<c:out value="${ sk.skill_code }" />'> <label><c:out
																value="${ sk.skill_name }" /></label>
													</div>
												</td>

											</c:if>

											<c:if test="${ type2_count > 4 }">
												<c:if test="${ type2_count % 4 eq 1 }">
													<!-- tr 포함 -->
													<tr>
												</c:if>

												<td>
													<div class="ui checkbox">
														<input type="checkbox" tabindex="0" class="hidden"
															name="skill_code"
															value='<c:out value="${ sk.skill_code }" />'> <label><c:out
																value="${ sk.skill_name }" /></label>
													</div>
												</td>
											</c:if>
										</c:if>

										<c:if test="${ sk.skill_type_code eq 3 }">
											<!-- 스킬 - 기획 PM -->
											<c:set var="type3_count" value="${ type3_count + 1 }" />

											<!-- 첫번째 th포함 -->
											<c:if test="${ type3_count <= 4 }">

												<c:if test="${ type3_count eq 1 }">
													<!-- 첫째줄 th 포함 -->
													<tr>
														<th rowspan="${ type3_skill_count }"
															class="skillTable sub th" style="background: #2137d08c;">기획<br>PM

														
												</c:if>

												<td>
													<div class="ui checkbox">
														<input type="checkbox" tabindex="0" class="hidden"
															name="skill_code"
															value='<c:out value="${ sk.skill_code }" />'> <label><c:out
																value="${ sk.skill_name }" /></label>
													</div>
												</td>
											</c:if>

											<c:if test="${ type3_count > 4 }">
												<c:if test="${ type3_count % 4 eq 1 }">
													<!-- tr 포함 -->
													<tr>
												</c:if>

												<td>
													<div class="ui checkbox">
														<input type="checkbox" tabindex="0" class="hidden"
															name="skill_code"
															value='<c:out value="${ sk.skill_code }" />'> <label><c:out
																value="${ sk.skill_name }" /></label>
													</div>
												</td>
											</c:if>
										</c:if>

									</c:forEach>

									<!-- 키워드 -->
									<c:forEach items="${ keywords }" var="ke" varStatus="vs">

										<!-- 첫번째 th 포함 -->
										<c:if test="${ vs.index <= 3 }">
											<c:if test="${ vs.index eq 0 }">
												<tr>
													<th rowspan="${ total_keyword_count }" colspan="2"
														class="skillTable main th" style="background: #00b5ad;">
														키워드<span class="required-info">*</span>
													</th>
											</c:if>

											<td>
												<div class="ui checkbox">
													<input type="checkbox" tabindex="0" class="hidden"
														name="keyword_code"
														value='<c:out value="${ ke.keyword_code }" />'> <label><c:out
															value="${ ke.keyword_name }" /></label>
												</div>
											</td>
										</c:if>

										<c:if test="${ vs.index > 3 }">
											<c:if test="${ vs.index % 4 eq 0 }">
												<tr>
											</c:if>
											<c:out value="${ td_count }"></c:out>
											<td>
												<div class="ui checkbox">
													<input type="checkbox" tabindex="0" class="hidden"
														name="keyword_code"
														value='<c:out value="${ ke.keyword_code }" />'> <label><c:out
															value="${ ke.keyword_name }" /></label>
												</div>
											</td>
										</c:if>

									</c:forEach>

									<!-- 기타 -->
									<tr>
										<th colspan="2" class="skillTable main th"
											style="background: #21ba45;">기타</th>
										<td colspan="4"><input type="text" name="etc"
											placeholder="기타 입력사항을 입력하세요."></td>
									</tr>

								</tbody>
								<tfoot>
									<tr>
										<th colspan="6" data-tooltip="클릭하시면 펼쳐집니다."><label>보유스킬 ▲</label></th>
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- 프로젝트 영역 끝 -->
					</div>
					<!-- 스킬테이블 끝 -->
					<!-- 검색항목 끝 -->
				</div>
			</div>
			<br>
			<!-- 상세검색 끝 -->
			<div class="ui primary submit button" onclick="searchEmp()">검색</div>
		</form>
	</div>

	<br>

	<!-- 리스트 출력 영역 -->
	<div class="ui container">
		<div class="column">

			<!-- 테이블 시작 -->
			<table class="ui celled padded table" id="searchListTable">
				<thead>
					<tr>
						<th colspan="7">
							<div class="div left">LIST</div>
							<div class="div right">
								<div class="field">
									<select class="ui dropdown" id="limit">
										<option value="5">5줄씩 보기</option>
										<option value="10">10줄씩 보기</option>
										<option value="15">15줄씩 보기</option>
									</select>
								</div>
							</div>
						</th>
					</tr>
					<tr>
						<th style="width: 5%;">No</th>
						<th style="width: 10%;">이름</th>
						<th style="width: 20%;">직무</th>
						<th style="width: 10%;">등급</th>
						<th style="width: 25%;">기술</th>
						<th style="width: 10%;">거주지역</th>
						<th style="width: 10%;">근무상태</th>
					</tr>
				</thead>
				<tbody>
					<!-- 리스트 출력 영역 -->
				</tbody>
				<tfoot>
					<tr>
						<th colspan="7" class="pagingArea"></th>
					</tr>
				</tfoot>
			</table>
			<!-- 테이블 완료 -->
		</div>
	</div>
	<!-- 리스트 출력 영역 끝 -->
	<br>
</div>

<jsp:include page="/WEB-INF/views/common/sideRightNav.jsp" />
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript" src="resources/js/admin.js"></script>