$('.ui.checkbox').checkbox();

function skillCheck() {

	var skill_codes = [];
	$(".skillForm").find("[name=skill_code]").each(function() {
		if ($(this).is(":checked")) {
			skill_codes.push($(this).val());
		}
	});

	var keyword_codes = [];
	$(".skillForm").find("[name=keyword_code]").each(function() {
		if ($(this).is(":checked")) {
			keyword_codes.push($(this).val());
		}
	});

	var etc = $(".skillForm").find("input[name=etc]").val();
	
	if (skill_codes.length > 0 && keyword_codes.length > 0) {
		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			url : "skillMody.em",
			type : "post",
			data : {
				skill_codes : skill_codes,
				keyword_codes : keyword_codes,
				etc : etc,
				emp_no : $("[name=emp_no]").val()
			}
		}).done(function(data) {
			alert("수정 완료");
			$('#side-tap .ui.tab.segment').eq(5).html(data);
		}).fail(function(data) {
			alert("수정 실패");
		});
	} else {
		alert("보유스킬 및 키워드를 체크해주세요.");
	}
}