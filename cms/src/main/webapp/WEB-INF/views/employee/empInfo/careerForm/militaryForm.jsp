<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<div id="area" class="ui grid">
		<div class="row">
			<div class="column">
				<button class="right floated ui primary button"
					onclick="militaryCheck()">저장</button>
			</div>
		</div>

		<div class="row" align="left">
			<!-- 병역 등록 영역 -->
			<div class="column">
				<div class="ui list">
					<form method="post" class="ui form" id="militaryForm">
						<div class="item">
							<input type="hidden" name="military_no"
								value='<c:out value="${0 + military.military_no }" />'>

							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>병역사항<span class="required-info">*</span></label>
									</div>
									
									<c:forEach items="${ miliServiceList }" var="s">
										<div class="four wide field">
											<div class="ui radio checkbox">
												<input type="radio" tabindex="0" name="military_service_code"
													class="hidden" value="${ s.military_service_code }"
													<c:if test="${ military.military_service_code eq s.military_service_code || military eq null and s.military_service_code eq 3 }">checked</c:if>>
												<label><c:out value="${ s.military_service_name }" /></label>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>근무기간</label>
									</div>
									<div class="three wide field">
										<input type="date" name="enroll_date" max="9999-12-31"
											value='<c:out value="${ military.enroll_date }" />'>
									</div>
									<div class="one wide field">~</div>
									<div class="three wide field">
										<input type="date" name="discharge_date" max="9999-12-31"
											value='<c:out value="${ military.discharge_date }" />'>
									</div>
									<div class="three wide field">
										<select class="dropdown" name="military_group_code">
											<c:forEach items="${ miliGroupList }" var="g">
												<option value='<c:out value="${ g.military_group_code }" />' <c:if test="${ military.military_group_code eq g.military_group_code }">selected</c:if>><c:out value="${ g.military_group_name }" /></option>
											</c:forEach>
										</select>
									</div>
									<div class="three wide field">
										<select class="dropdown" name="military_rank_code">
											<c:forEach items="${ miliRankList }" var="r">
												<option value='<c:out value="${ r.military_rank_code }" />'
												<c:if test="${ (military eq null || military.military_service_code ne 1) && r.military_rank_name eq '병장' }">selected</c:if>
												<c:if test="${ military.military_rank_code eq r.military_rank_code }">selected</c:if>><c:out value="${ r.military_rank_name }" /></option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="ui form">
								<div class="inline fields">
									<div class="three wide field">
										<label>전역종류</label>
									</div>
									<div class="thirteen wide field">
										<select class="dropdown" name="discharge_code">
											<c:forEach items="${ dischargeList }" var="d">
												<option value='<c:out value="${ d.discharge_code }" />'
													<c:if test="${ military.discharge_code eq d.discharge_code }">selected</c:if>><c:out value="${ d.discharge_name }" /></option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
					</form>

				</div>
			</div>
			<!-- 병역 등록 영역 끝 -->
		</div>
	</div>
<script type="text/javascript" src="resources/js/militaryForm.js"></script>