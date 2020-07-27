<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
body {
	height: 100%;
}

.content {
	text-align: left;
}

.mainContents {
	padding: 1em;
	display: inline-block;
	vertical-align: middle;
}

.mainContents.left {
	width: 30%;
	min-width: 400px;
}

.mainContents.right {
	width: 60%;
	min-width: 500px;
}

.profile-image-area img {
	max-width: 183px;
	max-height: 220px;
}

.header {
	padding: 2em;
	height: 90px;
	background: #e0e1e2;
	border-radius: 20px 20px 0px 0px;
}

.headers {
	display: inline-block;
}

.headers.left {
	float: left;
}

.headers.right {
	float: right;
}

.headers.left>h4 {
	margin: 0.7em;
}

.mainContent {
	border: 1px solid #e0e1e2;
}

.mainContent>.table.field {
	width: 90%;
}

.btnArea {
	display: inline-block;
}

.schools.field, .edus.field, .careers.field {
	background: #d2e7f6;
	padding: 0.8em 0.8em;
}

.red-text {
	color: red;
	font-weight: bold;
}

.project.field {
	text-align: left;
}

.projects.field {
	font-weight: bold;
	text-align: left;
}

.projectTable {
	text-align: center !important;
}

.projectTable th {
	font-size: x-small;
}

.projectTable td {
	font-size: x-small;
}

.projectList {
	display: none;
}

.projectList.show {
	display: block;
}

.skillTable {
	text-align: center !important;
}

.skillTable th {
	padding: 0.5em;
	font-size: small;
}

.skillTable.main.th {
	background: gray;
}

.skillTable.sub.th {
	background: lightgray;
}

#detailShowTap a {
	width: 20%;
	justify-content: center;
}
</style>
<jsp:include page="/WEB-INF/views/common/mainNav.jsp" />
<div class="content-area ui container">
	<div class="contents column">

		<div class="column" id="signin-area">
			<div class="ui container ui form" align="center" id="formArea">
				<!-- 시작 -->
				<input type="text" value='<c:out value="${ showEmp.emp_no }" />' name="empNo" hidden="hidden">

				<div class="mainContent">
					<div class="mainContents left">
						<div class="profile-image-area">

							<input class="file-input" type="file" name="profileImg"
								multiple="multiple" id="profileImg" hidden="hidden">
							<c:if test="${ showEmp.profileImg.file_no eq 0 }">
								<img src="resources/images/noImage.png">
							</c:if>
							<c:if test="${ showEmp.profileImg.file_no ne 0 }">
								<img
									src="resources/uploadFiles/profileImage/<c:out value="${ showEmp.emp_no }" />/<c:out value="${ showEmp.profileImg.change_name }" />">
							</c:if>
						</div>
					</div>

					<div class="mainContents right" style="text-align: left">
						<c:if test="${ loginEmp.emp_level_code eq 1 }">
							<div class="field" style="float: right;">
								<button class="positive ui button"
									onclick="modyEmp(<c:out value="${ showEmp.emp_no }" />)">사원 수정</button>
								<button class="negative ui button"
									onclick="deleteEmp(<c:out value="${ showEmp.emp_no }" />)">사원 삭제</button>
							</div>
						</c:if>

						<div class="field">
							<label>이름</label> <input type="text"
								value='<c:out value="${ showEmp.emp_name }" />' readonly="readonly">
						</div>

						<div class="field">
							<label>휴대폰번호</label> <input type="text"
								value='<c:out value="${ showEmp.phone }" />' readonly="readonly">
						</div>

						<div class="field">
							<label>이메일</label> <input type="text" value='<c:out value="${ showEmp.email }" />'
								readonly="readonly">
						</div>

						<div class="field">
							<label>주소 </label> <input type="text"
								value='<c:out value="${ showEmp.address }" />' readonly="readonly">
						</div>
					</div>

					<!-- 기타정보 영역 -->
					<div class="table field">
						<table class="ui celled table projectTable">
							<thead>
								<tr>
									<th>부서</th>
									<th>학력</th>
									<th>전공</th>
									<th>등급</th>
									<th>경력연차</th>
									<th>현재상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><c:out value="${ showEmp.dept_name }" /></td>
									<td><c:out value="${ showEmp.school_name }" /></td>
									<td><c:out value="${ showEmp.major }" /></td>
									<td><c:out value="${ showEmp.grade }" /></td>
									<td><c:out value="${ showEmp.total_career }" /></td>
									<td><c:out value="${ showEmp.status }" /></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 기타정보 영역 끝 -->

					<!-- 보유기술 영역 -->
					<div class="table field">
						<table class="ui celled table projectTable">
							<thead>
								<tr>
									<th colspan="3">보유스킬</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th rowspan="4" width="20%;" class="skillTable main th">보유기술</th>
								</tr>
								<tr>
									<th width="20%;" class="skillTable sub th">개발분야</th>
									<td width="60%;"><c:out value="${ showEmp.skill_name }" /></td>
								</tr>
								<tr>
									<th width="20%;" class="skillTable sub th">키워드</th>
									<td width="60%;"><c:out value="${ showEmp.keyword_name }" /></td>
								</tr>
								<tr>
									<th width="20%;" class="skillTable sub th">기타</th>
									<td width="60%;"><c:out value="${ showEmp.etc }" /></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 보유기술 영역 끝 -->
					<br>
					<!-- 프로젝트 아코디언 영역 -->
					<div class="ui styled fluid accordion">
						<div class="title active">
							<h4>수행프로젝트 ▼</h4>
						</div>
						<div class="content active">
							<table class="ui celled table projectTable">
								<thead>
									<tr>
										<th rowspan="2" style="border-right: rgba(34,36,38,.1);">프로젝트명</th>
										<th colspan="2">참여기간</th>
										<th rowspan="2">고객사</th>
										<th rowspan="2">근무회사</th>
										<th rowspan="2">역할</th>
										<th colspan="6">개발환경</th>
									</tr>
									<tr>
										<th>시작일</th>
										<th>종료일</th>
										<th>O.S</th>
										<th>언어</th>
										<th>DB</th>
										<th>Tool</th>
										<th>WAS</th>
										<th>기타</th>
									</tr>
								</thead>
								<tbody>
									<c:set value="0" var="projectResult" />
									<c:forEach items="${ careerList }" var="c">
										<c:if test="${ c.projectList ne null }">
											<c:forEach items="${ c.projectList }" var="p">
												<tr>
													<td><c:out value="${ p.project_name }" /></td>
													<td><c:out value="${ p.start_date }" /></td>
													<td><c:out value="${ p.end_date }" /></td>
													<td><c:out value="${ p.client }" /></td>
													<td><c:out value="${ p.workplace }" /></td>
													<td><c:out value="${ p.part }" /></td>
													<td><c:out value="${ p.os }" /></td>
													<td><c:out value="${ p.language }" /></td>
													<td><c:out value="${ p.db }" /></td>
													<td><c:out value="${ p.tool }" /></td>
													<td><c:out value="${ p.was }" /></td>
													<td><c:out value="${ p.etc }" /></td>
												</tr>
												<c:set value="${ projectResult + 1 }" var="projectResult" />
											</c:forEach>
										</c:if>
									</c:forEach>
									<c:if test="${ projectResult eq 0 }">
										<tr>
											<td colspan="12">수행프로젝트가 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<br>
					<!-- 프로젝트 영역 끝 -->
				</div>
				<!-- 끝 -->

				<!-- 상세탭 영역 -->
				<div class="ui top attached tabular menu" id="detailShowTap">
					<a class="item" data-tab="1">학력사항</a> <a class="item" data-tab="2">병역사항</a>
					<a class="item" data-tab="3">교육사항</a> <a class="item" data-tab="4">경력사항</a>
					<a class="item" data-tab="5">자격증사항</a>
				</div>
				<div class="ui bottom attached tab segment" data-tab="1">
					<!-- 학력사항 -->
					<c:set value="${ (fn:length(schoolList) - 1) }" var="lastSchool" />
					<table class="ui celled table projectTable">
						<thead>
							<tr>
								<th colspan="3" class="skillTable main th" style="color: white;">최종학력
									<c:out value="${ schoolList[lastSchool].school_name }" />(<c:out value="${ schoolList[lastSchool].degree_name }" />)
									<c:out value="${ schoolList[lastSchool].graduate_status_name }" /></th>
							</tr>
							<tr>
								<th>학교명</th>
								<th>전공</th>
								<th>재학기간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ schoolList }" var="s">
								<tr>
									<td><c:out value="${ s.school_name }" /></td>
									<td><c:out value="${ s.major }" /></td>
									<td><c:out value="${ s.admission_date }" />~<c:out value="${ s.graduate_date }" /><c:out value="${ s.graduate_status_name }" /></td>
								</tr>
							</c:forEach>
							<c:if test="${ fn:length(schoolList) <= 0 }">
								<td colspan="3">없음</td>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="ui bottom attached tab segment" data-tab="2">
					<!-- 병역사항 -->
					<table class="ui celled table projectTable">
						<tbody>
							<tr>
								<c:if
									test="${ military eq null || military.military_service_code eq 3 }">
									<td colspan="5">해당사항없음</td>
								</c:if>
								<c:if test="${ !empty military && military.military_service_code ne 3 }">
									<c:if test="${ military.military_service_code eq 2 }">
										<td colspan="5"><c:out value="${ military.military_service_name }" /></td>
									</c:if>
									<c:if test="${ military.military_service_code eq 1 }">
										<td><c:out value="${ military.military_service_name }" /></td>
										<td><c:out value="${ military.enroll_date }" />-<c:out value="${ military.discharge_date }" /></td>
										<td><c:out value="${ military.discharge_name }" /></td>
										<td><c:out value="${ military.military_rank_name }" /></td>
										<td><c:out value="${ military.military_group_name }" /></td>
									</c:if>
								</c:if>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="ui bottom attached tab segment" data-tab="3">
					<!-- 교육사항 -->
					<table class="ui celled table projectTable">
						<thead>
							<tr>
								<th>교육과정</th>
								<th>교육기관명</th>
								<th>교육기간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ eduList }" var="e">
								<tr>
									<td><c:out value="${ e.edu_name }" /></td>
									<td><c:out value="${ e.edu_institute_name }" /></td>
									<td><c:out value="${ e.edu_start_date }" />-<c:out value="${ e.edu_end_date }" /> <c:out value="${ e.edu_status_name }" /></td>
								</tr>
							</c:forEach>
							<c:if test="${ fn:length(eduList) <= 0 }">
								<td colspan="3">없음</td>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="ui bottom attached tab segment" data-tab="4">
					<!-- 경력사항 -->
					<table class="ui celled table projectTable">
						<thead>
							<tr>
								<th colspan="3" class="skillTable main th" style="color: white;">총경력
									<c:out value="${ show.total_career }" /></th>
							</tr>
							<tr>
								<th>회사명</th>
								<th>직급</th>
								<th>재직기간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ careerList }" var="c">
								<tr>
									<td><c:out value="${ c.company_name }" /></td>
									<td><c:out value="${ c.position }" /></td>
									<td><c:out value="${ c.hire_date }" />~<c:out value="${ c.resignation_date }" /></td>
								</tr>
							</c:forEach>
							<c:if test="${ fn:length(careerList) <= 0 }">
								<td colspan="3">없음</td>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="ui bottom attached tab segment" data-tab="5">
					<!-- 자격증 사항 -->
					<table class="ui celled table projectTable">
						<thead>
							<tr>
								<th>자격증/KOSA</th>
								<th>취득일/등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ licenseList }" var="l">
								<tr>
									<td><c:out value="${ l.license_list_name }" /></td>
									<td><c:out value="${ l.acquisition_date }" /></td>
								</tr>
							</c:forEach>
							<c:if test="${ fn:length(licenseList) <= 0 }">
								<td colspan="2">없음</td>
							</c:if>
						</tbody>
					</table>
				</div>
				<!-- 상세탭 영역 끝 -->
				<br>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/sideRightNav.jsp" />
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script type="text/javascript" src="resources/js/admin.js"></script>