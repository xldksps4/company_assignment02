$(document).on(".ui.accordion").accordion();
$('.ui.checkbox').checkbox();

//보유기술 펼치기
$(".skillTable tfoot").on("click", function() {
	$(".skillTable tbody").toggle();
});

checkSkill = [];
checkKeyword = [];

//보유기술 체크 (수정)
$(document).on("click", ".skillTable .checkbox", function() {
	$(this).each(function() {
		
		var check = $(this).find("label").text();
		var td = "<span class='checkName'>" + check + "</span>";
		var id = $(this).find("[type=checkbox]").attr("name");
		id = id.substr(0, 1);
		
		if($(this).find("[type=checkbox]").is(":checked")) {
			
			switch (id) {
			case 's': 
				checkSkill.push(td);
				break;
			case 'k': 
				checkKeyword.push(td);
				break;
			}
		}else {
			switch (id) {
			case 's': 
				var index = checkSkill.indexOf(td);
				checkSkill.splice(index, 1);
				break;
			case 'k': 
				var index = checkKeyword.indexOf(td);
				checkKeyword.splice(index, 1);
				break;
			}
		};
		
	});
	
	$("#skillArea").html(checkSkill);
	$("#keywordArea").html(checkKeyword);
});

$(document).on("keyup", "[name=etc]", function() {
	$("#etcArea").html("<span class='checkName'>" + $(this).val() + "</span>");
});

//n줄씩 보기
$(document).on("change", "#limit", function() {
	searchEmp(1);
});

//검색하기
function searchEmp(currentPage) {
	if (!currentPage) {
		currentPage = 1;
	}

	var limit = $("#limit option:selected").val();
	var gradeList = [];
	$(".grade").each(function() {
		if ($(this).is(":checked")) {
			gradeList.push($(this).val());
		}
	});
	var stateList = [];
	$(".status_name").each(function() {
		if ($(this).is(":checked")) {
			stateList.push($(this).val());
		}
	});
	var dept_codeList = [];
	$(".dept_code").each(function() {
		if ($(this).is(":checked")) {
			dept_codeList.push($(this).val());
		}
	});
	var skill_typeList = [];
	$(".skill_type_code").each(function() {
		if ($(this).is(":checked")) {
			skill_typeList.push($(this).val());
		}
	});
	var licenseList = [];
	$(".license_list_code").each(function() {
		if ($(this).is(":checked")) {
			licenseList.push($(this).val());
		}
	});
	var skill_codeList = [];
	$("[name=skill_code]").each(function() {
		if ($(this).is(":checked")) {
			skill_codeList.push($(this).val());
		}
	});
	var keyword_codeList = [];
	$("[name=keyword_code]").each(function() {
		if ($(this).is(":checked")) {
			keyword_codeList.push($(this).val());
		}
	});
	
	
	var etc_list = [];
	var etc = $("[name=etc]").val();
	
	var str = /[,~!@#$%^&*()|<>?:/{}]/;
	var blank = /\s/;
	if(str.test(etc)) {
		etc_list = etc.replace(/ /g, '').split(str);
	}else if(blank.test(etc)) {
		etc_list = etc.split(" ");
	}else if(etc.length > 0){
		etc_list.push(etc);
	}
	
	var params = $("#searchForm").serializeObject();
	params.gradeList = gradeList;
	params.stateList = stateList;
	params.dept_codeList = dept_codeList;
	params.skill_typeList = skill_typeList;
	params.licenseList = licenseList;
	params.skill_codeList = skill_codeList;
	params.keyword_codeList = keyword_codeList;
	params.etc_list = etc_list;

	params.currentPage = currentPage;
	params.limit = limit;
	
	jQuery.ajaxSettings.traditional = true;
	
	$.ajax({
		url : "adminSearch.em",
		type : 'POST',
		data : {
			params : JSON.stringify(params)
		}
	}).done(function(data) {
		$("#searchListTable > tbody").remove();
		$("#searchListTable > tfoot").remove();
		$("#searchListTable").append(data);
	});
	
};

//클릭 시 해당 사원 상세정보 보기
$(document).on("click", "#searchListTable tbody tr", function() {
	var emp_no = $(this).find(".empNoTd").val();
	location.href = "showDetailEmpForm.em?emp_no=" + emp_no;
});

$('.menu .item').tab();
$(document).on(".ui.accordion").accordion();

//사원정보수정
function modyEmp(emp_no) {
	location.href="empInfoForm.em?emp_no=" + emp_no; 
}

//사원삭제
function deleteEmp(emp_no) {
	var answer = confirm("해당 사원을 삭제하시겠습니까?");
	if(answer) {
		location.href="deleteEmp.em?emp_no=" + emp_no;
	}
}