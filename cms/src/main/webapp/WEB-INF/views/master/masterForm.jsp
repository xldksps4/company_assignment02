<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script defer="defer" type="text/javascript" src="resources/js/master.js"></script>
<jsp:include page="/WEB-INF/views/common/mainNav.jsp" />
<div class="content-area ui container">
	<div class="contents column" id="table-area">
		<!-- 테이블 영역 -->
		<table class="ui celled padded table" id="masterTable"
			style="text-align: center;">
			<thead>
				<tr>
					<th colspan="6">
						<h3 class="ui center aligned header">회원가입 승인여부 리스트</h3>
					</th>
				</tr>
				<tr>
					<th colspan="6" style="background: white;">
						<form id="searchForm" method="get">
							<div align="center">
								<div class="ui action input">
									<input type="text" placeholder="이름 검색" name="emp_name" value="">
									<button class="ui button" id="searchBtn" type="button" onclick="searchCondition()">
										<i class="fas fa-search"></i>
									</button>
								</div>

								<div style="display: inline-block; float: right;">
									<div class="ui form">
										<div class="field">
											<select name="emp_level_code">
												<option value="0">- 승인 여부 -</option>
												<option value="3">승인</option>
												<option value="4">대기</option>
												<option value="5">거절</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</form>
					</th>
				</tr>
				<tr>
					<th style="width: 5%;">No</th>
					<th style="width: 15%;">부서</th>
					<th style="width: 15%;">ID</th>
					<th style="width: 15%;">이름</th>
					<th style="width: 30%;">권한</th>
					<th style="width: 20%;">승인여부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="6">
						<div class="ui active inline loader"></div>
					</td>
				</tr>
			</tbody>
			<tfoot align="center">
				<tr>
					<th colspan="6"> </th>
				</tr>
			</tfoot>
		</table>
		<!-- 테이블 영역 끝 -->
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/sideRightNav.jsp" />
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<!-- <script type="text/javascript" src="resources/js/master.js"></script> -->