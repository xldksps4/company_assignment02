//교육사항 관련 js
eduList();

function addEdu() {
	var form = $("#eduFormOriginal").clone();
	form.removeAttr("id").removeAttr("style");
	
	if($("#eduList .eduForm").length <= 0) {
		form.find(".right.floated.column").detach();
	}
	
	$("#eduList").append(form);
	eduList();
};

// 교육명 입력 시 리스트에 추가
$(document).off("blur", "[name=edu_name]").on("blur", "[name=edu_name]", function() {
	eduList();
});

// 교육사항 리스트 추가
function eduList() {
	var ol = $("#eduListArea ol");
	var li = "";

	$("#eduArea [name=edu_name]").each(function() {
		li += '<li><div class="ui visible message"><p>' 
			+ $(this).val()
			+ '</p></div></li>';
	});

	ol.html(li);
};

//교육사항 날짜 범위 체크
$(document).on("blur", "[type=date]", function() {
	var start = $(this).parents(".fields").find("[name=edu_start_date]").val();
	var end = $(this).parents(".fields").find("[name=edu_end_date]").val();
	
	if(start > end) {
		$(this).parents(".fields").find("[name=edu_end_date]").parent().addClass("error");
	}else {
		$(this).parents(".fields").find("[name=edu_end_date]").parent().removeClass("error");
	}
});

// 교육사항 필수입력 체크
function eduCheck() {
	var checkResult = false;
	
	$("#eduArea .eduForm").each(function(index) {

		checkResult = false;

		var edu_name = $(this).find("[name=edu_name]");
		var edu_institute_name = $(this).find("[name=edu_institute_name]");
		var edu_start_date = $(this).find("[name=edu_start_date]");
		var edu_end_date = $(this).find("[name=edu_end_date]");

		if (edu_name.val() == "") {
			alert("교육과정명을 입력해주세요.");
			edu_name.focus();
			return false;
		} else if (edu_institute_name.val().length <= 0) {
			alert("교육기관명을 입력해주세요.");
			edu_institute_name.focus();
			return false;
		} else if (edu_start_date.val().length <= 0) {
			alert("교육시작일을 입력해주세요.");
			edu_start_date.focus();
			return false;
		} else if (edu_end_date.val().length <= 0) {
			alert("교육종료일을 입력해주세요.");
			edu_end_date.focus();
			return false;
		} else if(edu_end_date.parent("div").attr("class").indexOf("error") > 0) {
			alert("교육기간 날짜 범위가 올바르지 않습니다.");
			edu_end_date.focus();
			return false;
		} else {
			checkResult = true;
		}
	});

	if (checkResult) {
		modyEdu();
	}
}

// 교육사항 수정
function modyEdu() {
	var param = new Array();

	$("#eduArea .eduForm").each(function() {
		var form = $(this).serializeObject();
		param.push(form);
	});

	jQuery.ajaxSettings.traditional = true;

	$.ajax({
		url : "eduMody.em",
		type : "post",
		data : {
			param : JSON.stringify(param),
			emp_no : $("[name=emp_no]").val()
		}
	}).done(function(data) {
		alert("수정 완료");
		$('#side-tap .ui.tab.segment').eq(2).html(data);
	}).fail(function(data) {
		alert("수정 실패");
	});
};

// 해당 교육사항 삭제 여부
$(document).off("click", ".deleteEdu").on("click", ".deleteEdu", function() {
	var edu_no = $(this).parents(".item.college").find("[name=edu_no]").val();

	var answer = confirm("해당 정보를 정말 삭제하시겠습니까?\n삭제 시 복구할 수 없습니다.");
	if (answer) {
		// 기존 정보에서 삭제할 시 해당 학력번호 상태 N
		if (edu_no > 0) {
			deleteEdu(edu_no);
		}

		$(this).parents(".eduForm").remove();
		eduList();
	}
	
	if($("#eduList .eduForm").length <= 0) {
		addEdu();
	}
	
});

// 해당 교육사항 삭제
function deleteEdu(edu_no) {
	$.ajax({
		url : "deleteEdu.em",
		data : {
			edu_no : edu_no
		}
	}).fail(function(data) {
		alert("접속에러");
	});
}