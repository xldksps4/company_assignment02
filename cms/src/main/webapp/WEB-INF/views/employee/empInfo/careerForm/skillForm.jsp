<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.skillTable th {
	text-align: center !important;
}

.skillTable th {
	padding: 0.5em;
	font-size: small;
}
</style>
<div id="area" class="ui grid">

	<div class="row">
		<div class="column">
			<button class="right floated ui primary button" onclick="skillCheck()">저장</button>
		</div>
	</div>

	<div class="row" align="left">
		<!-- 자격증 등록 영역 -->
		<div class="column">

			<form class="ui form skillForm" method="POST">
				<div class="skill field">
					<!-- 스킬 영역 -->
					<br>
					<div class="skill field">
						<table class="ui table skillTable">
							<thead>
								<tr>
									<th colspan="6"></th>
								</tr>
							</thead>
							<tbody>

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
														name="skill_code" value='<c:out value="${ sk.skill_code }" />'> 
														<label><c:out value="${ sk.skill_name }" /></label>
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
														name="skill_code" value='<c:out value="${ sk.skill_code }" />'> 
														<label><c:out value="${ sk.skill_name }" /></label>
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
														name="skill_code" value='<c:out value="${ sk.skill_code }" />'> 
														<label><c:out value="${ sk.skill_name }" /></label>
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
														name="skill_code" value='<c:out value="${ sk.skill_code }" />'> 
														<label><c:out value="${ sk.skill_name }" /></label>
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
														name="skill_code" value='<c:out value="${ sk.skill_code }" />'> 
														<label><c:out value="${ sk.skill_name }" /></label>
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
														name="skill_code" value='<c:out value="${ sk.skill_code }" />'> 
														<label><c:out value="${ sk.skill_name }" /></label>
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
													name="keyword_code" value='<c:out value="${ ke.keyword_code }" />'> 
													<label><c:out value="${ ke.keyword_name }" /></label>
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
													name="keyword_code" value='<c:out value="${ ke.keyword_code }" />'> 
													<label><c:out value="${ ke.keyword_name }" /></label>
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
						</table>
					</div>
					<!-- 프로젝트 영역 끝 -->
				</div>
			</form>

		</div>
		<!-- 자격증 등록 영역 끝 -->
	</div>
</div>
<script type="text/javascript">
	<c:forEach items="${ skillList }" var="s">
		<c:forEach varStatus="status" begin="1" end="${ fn:length(skills) }">
			<c:if test="${ s.skill_code == status.index }">
				$("[name=skill_code][value=${ status.index }]").attr("checked", true);
			</c:if>
		</c:forEach>
		
		<c:forEach varStatus="status" begin="1" end="${ fn:length(keywords) }">
			<c:if test="${ s.keyword_code == status.index }">
				$("[name=keyword_code][value=${ status.index }]").attr("checked", true);
			</c:if>
		</c:forEach>
		
		<c:if test="${ s.etc ne '' && s.etc ne null }">
			$("[name=etc]").val('${ s.etc }');
		</c:if>
	</c:forEach>
</script>
<script type="text/javascript" src="resources/js/skillForm.js"></script>