<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="resources/js/myinfo.js"></script>
<style type="text/css">
.myinfoInput:first-child {
	margin: 0 !important;
}

#btn-area {
	margin-top: 5.5em;
}

#btn-area div {
	width: 45%;
}

.profile-image-area img {
	max-width: 183px;
	max-height: 220px;
}

#history-info-area {
	text-align: left;
}

#profile-btn-area {
	width: 208px;
}

#profile-btn-area div {
	width: 100%;
}

#img-btn-area {
	margin: 1em;
}

.modal-image img {
	min-height: 354px;
	max-height: 354px;
}
</style>

<div id="area" class="area ui grid">

	<!-- 프로필 이미지 및 로그인, 수정이력 영역 -->
	<div class="six wide column">
		<!-- 이미지 영역 -->
		<div class="profile-image-area">
			<c:if test="${ emp.profileImg.file_no <= 0 }">
				<img src="resources/images/noImage.png">
				<br>
				<div id="img-btn-area">
					<div class="ui primary button" onclick="profileImg(1)">사진등록</div>
				</div>
			</c:if>
			<c:if test="${ emp.profileImg.file_no > 0 }">
				<img
					src="resources/uploadFiles/profileImage/${ emp.emp_no }/${ emp.profileImg.change_name }">
				<br>
				<div id="img-btn-area">
					<div class="ui primary button" onclick="profileImg(1)">사진수정</div>
					<div class="ui primary button" onclick="profileImg(2)">사진삭제</div>
				</div>
			</c:if>
		</div>
		<!-- 이미지 영역 끝 -->
		<hr style="margin: 1em;">

		<div id="history-info-area">
			<ul>
				<li>최근 수정일 : <fmt:formatDate
						value="${ emp.mody.emp_modify_date }" pattern="yyyy-MM-dd" /></li>
				<li>최근 접속일 : <fmt:formatDate value="${ emp.login.login_date }"
						pattern="yyyy-MM-dd HH:mm" /></li>
				<li>최근 접속 IP : ${ emp.login.login_ip }</li>
			</ul>
		</div>
	</div>
	<!-- 프로필 이미지 및 로그인, 수정이력 영역 끝 -->

	<!-- 기본정보 영역 -->
	<div class="ten wide column">
		<!-- 기본정보 영역 -->
		<div>
			<form method="post" class="ui form" id="empInfoForm">
				<input type="hidden" name="emp_no" value="${ emp.emp_no }">
				<div class="inline fields">
					<div class="three wide field">
						<label>이름</label>
					</div>
					<div class="thirteen wide field">
						<input type="text" value="${ emp.emp_name }"
							placeholder="이름을 입력하세요." id="emp_name" name="emp_name">
					</div>
				</div>

				<div class="inline fields">
					<div class="three wide field">
						<label>부서</label>
					</div>
					<div class="thirteen wide field">
						<select class="ui fluid dropdown" id="dept_code" name="dept_code">
							<c:forEach items="${ deptList }" var="d">
								<option value="${ d.dept_code }" <c:if test="${ emp.dept_code eq d.dept_code }">selected</c:if>>${ d.dept_name }</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="inline fields">
					<div class="three wide field">
						<label>휴대폰번호</label> <input type="hidden" name="phone" id="phone"
							value="">
					</div>
					<div class="thirteen wide field">
						<input type="text" maxlength="3" id="phone1" class="myinfoInput"
							placeholder="000"
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
							value="${fn:split(emp.phone,'-')[0]}"> &nbsp;<span>-</span>&nbsp;
						<input type="text" maxlength="4" id="phone2" class="myinfoInput"
							placeholder="0000"
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
							value="${fn:split(emp.phone,'-')[1]}"> &nbsp;<span>-</span>&nbsp;
						<input type="text" maxlength="4" id="phone3" class="myinfoInput"
							placeholder="0000"
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
							value="${fn:split(emp.phone,'-')[2]}">
					</div>
				</div>

				<div class="inline fields">
					<div class="three wide field">
						<label>이메일</label> <input type="hidden" name="email" id="email"
							value="">
					</div>
					<div class="thirteen wide field">
						<input type="text" id="email1" class="myinfoInput"
							value="${fn:split(emp.email,'@')[0]}"> &nbsp;<span>@</span>&nbsp;
						<input type="text" id="email2" class="myinfoInput"
							value="${fn:split(emp.email,'@')[1]}"> &nbsp;&nbsp; <select
							class="ui fluid dropdown" id="emailSelect">
							<option value="">- 이메일 선택 -</option>
							<option value="naedamcnc.com">naedamcnc.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="직접입력">직접입력</option>
						</select>
					</div>
				</div>

				<div class="inline fields">
					<div class="three wide field">
						<label>주소<span class="required-info">*</span></label>
					</div>
					<div class="thirteen wide field">
						<input type="text" value="${ emp.address }" id="address"
							name="address" readonly="readonly" onclick="addressSearch()">
						&nbsp;
						<div class="ui primary button" onclick="addressSearch()"
							style="width: 20%;">검색</div>
					</div>
				</div>

			</form>
		</div>
		<!-- 기본정보 영역 끝 -->

		<!-- 버튼 영역 -->
		<div id="btn-area">
			<div class="ui primary button" onclick="infoCheck()">수정하기</div>
			<c:if test="${ emp_no eq null }">
				<div class="ui button" onclick="deleteEmp()">탈퇴요청</div>
			</c:if>
		</div>
		<!-- 버튼 영역 끝 -->
	</div>
	<!-- 기본정보 영역 끝 -->
	
	<!-- 이미지 폼 -->
	<div style="display: none;">
		<form id="profileImgForm" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${ emp.profileImg.file_no }" name="file_no">
			<input type="hidden" value="${ emp.profileImg.origin_name }" name="origin_name">
			<input type="hidden" value="${ emp.profileImg.change_name }" name="change_name"> 
			<input type="hidden" value="${ emp.profileImg.file_path }" name="file_path"> 
			<input type="hidden" value="${ emp.emp_no }" name="emp_no"> 
			
			<input class="file-input" type="file" name="newImg" multiple="multiple" id="profileImg" hidden="hidden">
		</form>
	</div>
</div>