<%@ page buffer="8kb" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script defer type="text/javascript" src="resources/js/user/infoupdate/careerformselect.js"></script>
<style type="text/css">
#side-tap {
	width: 100%;
}

#side-tap a {
	width: 15.5%;
	justify-content: center;
}

.ui.secondary.menu .active.item {
	background: #49a6eb;
	font-weight: bold;
	color: white;
}

.ui.segment:last-child {
	margin-bottom: 1rem !important;
}

#eduArea>div {
	height: 500px;
	overflow: auto;
}

#eduListArea {
	padding: 2em;
}

#eduArea input {
	width: 100%;
}

.ui.form .inline.fields .field>.selection.dropdown {
	min-width: auto !important;
	width: 100%;
}
</style>
<div id="area" class="ui grid">

	<div id="side-tap">
		<div class="ui secondary menu">
		버퍼크기 : <%=out.getBufferSize() %><br>
		남은크기 : <%=out.getRemaining() %><br>
		autoflush :<%=out.isAutoFlush() %><br>
			<a class="item active" data-tab="sub-1" onclick="return dataTabReturn();">학력사항</a> 
			<a class="item" data-tab="sub-2" onclick="return dataTabReturn();">병역사항</a> 
			<a class="item" data-tab="sub-3" onclick="return dataTabReturn();">교육사항</a>
			<a class="item" data-tab="sub-4" onclick="return dataTabReturn();">경력사항</a> 
			<a class="item" data-tab="sub-5" onclick="return dataTabReturn();">자격증사항</a> 
			<a class="item" data-tab="sub-6" onclick="return dataTabReturn();">보유기술</a>
		</div>
		<div class="ui active tab segment" data-tab="sub-1">
			<jsp:include
				page="/WEB-INF/views/employee/empInfo/careerForm/schoolForm.jsp"/>
		</div>
		<div class="ui tab segment" data-tab="sub-2" >
			<jsp:include
				page="/WEB-INF/views/employee/empInfo/careerForm/militaryForm.jsp"/>
		</div>
		<div class="ui tab segment" data-tab="sub-3">
			<jsp:include
				page="/WEB-INF/views/employee/empInfo/careerForm/eduForm.jsp"/>
		</div>
		<div class="ui tab segment" data-tab="sub-4">
			<jsp:include
				page="/WEB-INF/views/employee/empInfo/careerForm/careerForm.jsp"/>
		</div>
		<div class="ui tab segment" data-tab="sub-5">
			<jsp:include
				page="/WEB-INF/views/employee/empInfo/careerForm/licenseForm.jsp" />
		</div>
		<div class="ui tab segment" data-tab="sub-6">
			<jsp:include
				page="/WEB-INF/views/employee/empInfo/careerForm/skillForm.jsp" />
		</div>
	</div>
</div>