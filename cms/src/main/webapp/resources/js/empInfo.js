$(document).ready(function() {
	//경력등록 클릭으로 들어왔을 시 경력등록 창 활성화
	if($("[name=info_code]").val() == 1) {
		$("#info-main-tap a").eq(2).trigger("click");
	}
});

$('.menu .item').tab();
$('.ui.radio.checkbox').checkbox();

function showDetail(emp_no) {
	window.open("showDetailEmpForm.em?emp_no=" + emp_no);  
}