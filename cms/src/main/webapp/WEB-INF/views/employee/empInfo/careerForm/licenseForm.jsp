<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div id="area" class="ui grid">
		<div class="row">
			<div class="column">
				<button class="right floated ui primary button"
					onclick="licenseCheck()">저장</button>
			</div>
		</div>

		<div class="row" align="left">
			<!-- 자격증 등록 영역 -->
			<div class="column">
				<div class="ui list">
					<div class="item">

						<form method="post" class="ui form licenseForm">
							<div class="ui form">
								<div class="inline field">
									<div class="ui checkbox">
											<input type="hidden" name="license_list_code"
											value="1">
											<input
											type="checkbox" tabindex="0" class="hidden"
											name="code_check" value="1"> <label>KOSA</label>
									</div>
								</div>
							</div>
						</form>

						<form method="post" class="ui form licenseForm">
							<div class="ui form">
								<div class="inline fields">
									<div class="four wide field">
										<div class="ui checkbox">
												<input type="hidden" name="license_list_code"
											value="2">
												<input
												type="checkbox" tabindex="0" class="hidden"
												name="code_check" value="2"> <label>정보처리기사</label>
										</div>
									</div>
									<div class="two wide field">
										<label>취득기간<span class="required-info">*</span></label>
									</div>
									<div class="ten wide field">
										<input type="date" name="acquisition_date" disabled="disabled" max="9999-12-31">
									</div>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
			<!-- 자격증 등록 영역 끝 -->
		</div>
	</div>
	<script type="text/javascript" src="resources/js/licenseForm.js"></script>
	<script type="text/javascript">
		<c:forEach items="${ licenseList }" var="l">
			<c:if test="${ l.license_list_code eq 1 }">
				$(".licenseForm").eq(0).find("[name=code_check]").attr("checked", true);
			</c:if>
			<c:if test="${ l.license_list_code eq 2 }">
				$(".licenseForm").eq(1).find("[name=code_check]").attr("checked", true);
				$(".licenseForm").eq(1).find("[name=acquisition_date]").val("${ l.acquisition_date }").removeAttr("disabled");
			</c:if>
		</c:forEach>
	</script>