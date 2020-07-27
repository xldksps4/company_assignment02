$('.ui.checkbox').checkbox();

$(document).off("change", "[name=code_check]").on("change", "[name=code_check]", function() {
	if ($(this).val() == 2) {
		if ($(this).is(":checked")) {
			$(this).parents().find("[name=acquisition_date]")
					.removeAttr("disabled");
		} else {
			$(this).parents().find("[name=acquisition_date]").attr(
					"disabled", true);
		}
	}
});

function licenseCheck() {
	var checkResult = true;
	var checkCount = 0;

	$("[name=code_check]").each(function(index) {
		if ($(this).is(":checked")) {
			checkCount += 1;
		}
		if (index == 1 && $(this).is(":checked") && $(this).parents().find("[name=acquisition_date]").val().length <= 0) {
			alert("취득기간을 입력하세요");
			$(this).parents().find("[name=acquisition_date]").focus();

			checkResult = false;
		}
	});

	if (checkResult) {
		modyLicense();
	}
}

function modyLicense() {
	var param = new Array();
	$(".licenseForm").each(function() {
		if ($(this).find("[name=code_check]").is(":checked")) {
			var form = $(this).serializeObject();
			param.push(form);
		}
	});

	jQuery.ajaxSettings.traditional = true;

	$.ajax({
		url : "licenseMody.em",
		type : "post",
		dataType : "text",
		data : {
			param : JSON.stringify(param),
			emp_no : $("[name=emp_no]").val()
		}
	}).done(function(data) {
		alert("수정 완료");
		$('#side-tap .ui.tab.segment').eq(4).html(data);
	}).fail(function(data) {
		alert("수정 실패");
	});
}