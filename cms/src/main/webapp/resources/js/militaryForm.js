$('.ui.checkbox').checkbox();
//병역사항 관련 js
miritaryService();

$(document).off("change", "[name=military_service_code]").on("change", "[name=military_service_code]", function() {
	miritaryService();
});

function miritaryService() {
	var code = $("[name=military_service_code]:checked").val();
	
	if (code != 1) {
		$("#militaryForm").find("input").not(
				"[name=military_service_code]").not(
				"[name=military_no]").attr('disabled', true);
		$("#militaryForm").find("select").attr('disabled', true);
	} else {
		$("#militaryForm").find("input").removeAttr("disabled");
		$("#militaryForm").find("select").removeAttr("disabled");
	}
}

//군필 시 근무기간 범위 설정
$(document).on("blur", "[type=date]", function() {
	$("[name=discharge_date]").attr("min", $("[name=enroll_date]").val());
	
	var start = $("[name=enroll_date]").val();
	var end = $("[name=discharge_date]").val();
	
	if(start > end) {
		$("[name=discharge_date]").parent("div").addClass("error");
		$("[name=discharge_date]").focus();
	}else {
		$("[name=discharge_date]").parent("div").removeClass("error");
	}
});

function militaryCheck() {
	var code = $("[name=military_service_code]:checked").val();

	if (code == 1) {
		//필수입력사항 체크
		var enroll_date = $("[name=enroll_date]");
		var discharge_date = $("[name=discharge_date]");

		if (enroll_date.val().length <= 0) {
			alert("입대일을 입력해주세요.");
			enroll_date.focus();
			return false;
		} else if (discharge_date.val().length <= 0) {
			alert("제대일을 입력해주세요.");
			discharge_date.focus();
			return false;
		}else if(discharge_date.parent("div").attr("class").indexOf("error") > 0) {
			alert("날짜가 올바르지 않습니다.");
			discharge_date.focus();
			return false;
		}
	}
	modyMilitary();
}

function modyMilitary() {
	var form = $("#militaryForm").serialize();
	
	form += "&emp_no=" + $("[name=emp_no]").val();
	
	$.ajax({
		url : "militaryMody.em",
		type : "post",
		data : form
	}).done(function(data) {
		alert("수정 완료");
		$('#side-tap .ui.tab.segment').eq(1).html(data);
	}).fail(function(data) {
		alert("수정 실패");
	});
}