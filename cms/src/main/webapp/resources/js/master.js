//검색용 변수
emp_name = "";
emp_level_code = 0;

$(document).ready(function() {
	search(1);
});

//검색
function search(page) {
	console.log("[master.js]__page >>"+ page);
	console.log("emp_level_code >> "+emp_level_code);
	$.ajax({
		url : "masterPage.ma",
		data : {
			emp_name : emp_name,
			emp_level_code : emp_level_code,
			page : page
		}
	}).done(function(data) {
		$("#masterTable > tbody").remove();
		$("#masterTable > tfoot").remove();
		$("#masterTable").append(data);
	}).fail(function(data) {
		alert("접속에러");
	});
}

//검색 권한 변경 시 검색 실행
$("select[name=emp_level_code]").on("change", function() {
	emp_level_code = $(this).val();
	search(1);
});

//이름 검색 칸에서 enter 쳤을 때 검색 실행
$("input[name=emp_name]").keydown(function(e) {
	if (e.keyCode == 13) {
		searchCondition();
		return false;
	};
});

//검색 조건 저장 후 검색실행
function searchCondition() {
	emp_name = $("[name=emp_name]").val();
	emp_level_code = $("[name=emp_level_code] :selected").val();

	search(1);
}

//승인여부 버튼 클릭 시 권한 변경
$(document).on("click", ".levelBtn", function() {
	
	var emp_no = $(this).val();
	var change_emp_level_code = 0;
	
	var text = $(this).text();
	var msg = "";
	
	if(text == "승인") {
		change_emp_level_code = $(this).parents("tr").find("select[name=change_emp_level_code]").val();
		if(change_emp_level_code==''){
			alert("해당 사원의 권한을 선택해주세요.");
		}else{
			msg = "해당 사원의 권한을 변경하시겠습니까?";
		}
	}else if(text == "거절") {
		msg = "해당 사원의 권한 승인을 거절하시겠습니까?";
		change_emp_level_code = 5;
	}else{
		msg = "해당 사원의 권한을 수정하시겠습니까?";
		change_emp_level_code = $(this).parents("tr").find("select[name=change_emp_level_code]").val();
	}
	
	levelsTd = $(this).parents('tbody tr').find(".levelTd");
	btnTd = $(this).parents('tbody tr').find(".btnTd");
	
	var answer = false;
	if(msg!=''){
		answer = confirm(msg);
	}
	
	
	if(answer) {
		$.ajax({
			url : "changeLevel.ma",
			data : {
				emp_no : emp_no,
				emp_level_code : change_emp_level_code
			},
			type : "post",
			success : function(data) {
				var msg =  data.msg;
				alert(msg);
				searchCondition();
			},
			error : function(data) {
				alert("접속에러");
			}
		});
	}
});