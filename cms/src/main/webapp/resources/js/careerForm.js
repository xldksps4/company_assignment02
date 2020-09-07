$(document).on(".ui.accordion").accordion();

$("[name=hire_date]").each(function() {
	if (($(this).val()).length > 0) {
		career_date($(this));
	}
});

totalCareerDate();

//총경력 반영
function totalCareerDate() {
	var totalText = "";
	var totalYear = 0;
	var totalMonth = 0;

	$("#careerArea").find(".career_date").each(function() {
		var text = $(this).text();
		var year = Number(text.split("년 ")[0]);
		var month = Number(text.split("년 ")[1].replace("개월", ""));

		totalYear += year;
		totalMonth += month;
	});
	
	if (totalYear < 10) {
		totalText += "0" + totalYear + "년 ";
	} else {
		totalText += totalYear + "년 ";
	}

	if (totalMonth < 10) {
		totalText += "0" + totalMonth + "개월";
	} else {
		totalText += totalMonth + "개월";
	}
	$("#totalCareer").val(totalText);
};

//프로젝트 리스트 선택
$(document).off("click", ".projectNameMenu").on("click", ".projectNameMenu", function() {

	if ($(this).hasClass("active")) {
		$(this).removeClass("active");

		$(this).parents(".projectArea").find(".projectInputArea")
				.hide();
		$(this).parents(".projectArea").find(".deleteProject")
				.removeClass("negative");
	} else {
		$(this).siblings().removeClass("active");
		$(this).addClass("active");

		$(this).parents(".projectArea").find(".projectInputArea")
				.show();
		$(this).parents(".projectArea").find(".deleteProject")
				.addClass("negative");

		showProject($(this).find(".project_no"));
	}

});

//프로젝트 추가
$(document).off("click", ".addProject").on("click", ".addProject", function() {
	var form = $("#projectFormOriginal").clone();
	form.removeAttr("id").removeAttr("style");
	$(this).parents(".projectArea").find(".projectList").append(form);
	careerList();
});

//프로젝트 목록 클릭 시 프로젝트 폼에 출력
function showProject(item) {

	var menuArr = [];
	
	menuArr.push({
		name : "career_num",
		value : 0 + item.data("career_num")
	});
	menuArr.push({
		name : "project_name",
		value : item.data("project_name")
	});
	menuArr.push({
		name : "start_date",
		value : item.data("start_date")
	});
	menuArr.push({
		name : "end_date",
		value : item.data("end_date")
	});
	menuArr.push({
		name : "client",
		value : item.data("client")
	});
	menuArr.push({
		name : "workplace",
		value : item.data("workplace")
	});
	menuArr.push({
		name : "part",
		value : item.data("part")
	});
	menuArr.push({
		name : "os",
		value : item.data("os")
	});
	menuArr.push({
		name : "language",
		value : item.data("language")
	});
	menuArr.push({
		name : "db",
		value : item.data("db")
	});
	menuArr.push({
		name : "tool",
		value : item.data("tool")
	});
	menuArr.push({
		name : "was",
		value : item.data("was")
	});
	menuArr.push({
		name : "etc",
		value : item.data("etc")
	});

	// for in 과 동일 ( 객체 반복문 )
	$.each(menuArr, function(index, arr) {
		item.parents(".projectArea").find("." + arr.name).val(arr.value);
	});
};

//프로젝트 내용 입력 시 data 등록
$(document).off("change", ".projectInputArea input").on("change", ".projectInputArea input", function() {
	var dataInput = $(this).parents(".projectArea").find(
			".projectNameMenu.active .project_no");
	var name = $(this).attr("class");
	var value = $(this).val() + "";

	dataInput.data(name, "");
	dataInput.data(name, value);
	
	//프로젝트명 입력 시 리스트에 반영
	if (name == "project_name") {
		
		if (value.length <= 0 || value == null) {
			$(this).parents(".projectArea").find(".projectNameMenu.active").children(".project_name").addClass("gray-text").text("(프로젝트명을 입력하세요)");
		} else {
			$(this).parents(".projectArea").find(".projectNameMenu.active").children(".project_name").removeClass("gray-text").text(value);
		}
		
		careerList();
	}
});

//해당 프로젝트 삭제 - 상태'N'
$(document).off("click", ".deleteProject.negative").on("click", ".deleteProject.negative", function() {
	var answer = confirm("해당 정보를 정말 삭제하시겠습니까?\n삭제 시 복구할 수 없습니다.");

	if (answer) {
		var project_no = $(this).parents(".projectArea").find(
				".projectNameMenu.active .project_no").val();

		if (project_no > 0) {
			deleteProject(project_no);
		}

		$(this).parents(".projectArea").find(".projectNameMenu.active")
				.remove();
		$(this).parents(".projectArea").find(".projectInputArea")
				.hide();
		careerList();
	}
});

function deleteProject(project_no) {
	$.ajax({
		url : "deleteProject.em",
		data : {
			project_no : project_no
		},
		type : "post"
	}).fail(function(data) {
		alert("접속에러");
	});
}

//경력사항 폼 추가버튼
function addCareer() {
	
	var form = $("#careerFormOriginal").clone();
	form.removeAttr("id").removeAttr("style");
	
	if($("#careerList").find(".careerForm").length <= 0) {
		form.find(".left.floated.column").attr("class", "column");
		form.find(".right.floated.column").remove();
	}
	
	$("#careerList").append(form);
	careerList();
};

careerList();

//회사명 입력 시 리스트에 추가
$(document).off("blur", "[name=company_name]").on("blur", "[name=company_name]", function() {
	careerList();
});

//경력목록 리스트 출력
function careerList() {
	var ol = $("#careerListArea ol");
	var li = "";

	$("#careerArea").find("[name=company_name]").each(function() {
		
		li += '<li><div class="ui visible message"><p>' + $(this).val();
		/* 프로젝트명 추가 */
		$(this).parents(".careerForm").find(".project_no").each(function() {
			
			if($(this).data("project_name")) {
				li += '<br>- ' + $(this).data("project_name");
			}else {
				li += '<br>- (프로젝트명을 입력하세요)';
			}
			
		});

		li += '</p></div></li>';
	});
	
	ol.html(li);
}

//근무기간 등록 시 경력날짜 계산
$(document).off("blur", "[name=hire_date]").on("blur", "[name=hire_date]", function() {
	var hire_date = $(this);
	if ((hire_date.val()).length > 0) {
		career_date(hire_date);
	} else {
		hire_date.parents(".careerForm").find(".career_date").text(
				"00년 00개월");
	}
});

$(document).off("blur", "[name=resignation_date]").on("blur", "[name=resignation_date]", function() {
	var hire_date = $(this).parents(".careerForm").find("[name=hire_date]");
	
	if ((hire_date.val()).length > 0) {
		career_date(hire_date);
	} else {
		hire_date.parents(".careerForm").find(".career_date").text("00년 00개월");
	}
});

function career_date(item) {
	var hire_date = (item.val()).split("-");
	var resignation_date = item.parents(".careerForm").find("[name=resignation_date]").val();

	var start = new Date(hire_date[0], hire_date[1], hire_date[2]);
	var end;

	if (resignation_date.length <= 0) {
		var today = new Date();
		end = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	} else {
		resignation_date = (item.parents(".careerForm").find("[name=resignation_date]").val()).split("-");
		end = new Date(resignation_date[0], resignation_date[1], resignation_date[2]);
	}
	
	if(start > end) {
		item.parents(".careerForm").find(".career_date").text("-");
		return;
	}
	
	var career_date = end - start;

	career_date = career_date / (24 * 3600 * 1000);
	var career_year = Math.floor(career_date / 365);
	var career_month = Math.floor((career_date - (365 * career_year)) / 30.5);

	var text = "";

	if (career_year < 10) {
		text += "0" + career_year + "년 ";
	} else {
		text += career_year + "년 ";
	}

	if (career_month < 10) {
		text += "0" + career_month + "개월";
	} else {
		text += career_month + "개월";
	}
	
	item.parents(".careerForm").find(".career_date").text(text);
}

//해당 경력사항 삭제
$(document).off("click", ".deleteCareer").on("click", ".deleteCareer", function() {
	var answer = confirm("해당 정보를 정말 삭제하시겠습니까?\n삭제 시 복구할 수 없습니다.");

	if (answer) {
		var career_no = $(this).parents(".careerForm").find("[name=career_no]").val();

		if (career_no > 0) {
			deleteCareer(career_no);
		}

		$(this).parents(".careerForm").remove();
		
		if($("#careerList").find(".careerForm").length <= 0) {
			addCareer();
		}
		totalCareerDate();
	}
});

function deleteCareer(career_no) {
	$.ajax({
		url : "deleteCareer.em",
		data : {
			career_no : career_no
		},
		type : "post"
	}).fail(function(data) {
		alert("접속에러");
	});
}

//기간 범위 체크
$(document).on("blur", ".c_date", function() {
	var c_start = $(this).parents(".fields").find("[name=hire_date]").val();
	var c_end = $(this).parents(".fields").find("[name=resignation_date]").val();
	
	if(c_end.length > 0 && c_start > c_end) {
		$(this).parents(".fields").find("[name=resignation_date]").parent().addClass("error");
	}else {
		$(this).parents(".fields").find("[name=resignation_date]").parent().removeClass("error");
	}
});

//필수입력사항 체크
function careerCheck() {
	var checkResult = false;

	$("#careerArea").find(".careerForm").each(function() {
		checkResult = false;
		
		var company_name = $(this).find("[name=company_name]");
		var position = $(this).find("[name=position]");
		var hire_date = $(this).find("[name=hire_date]");
		var resignation_date = $(this).find("[name=resignation_date]");
		
		if (company_name.val().length <= 0) {
			alert("회사명을 입력해주세요.");
			company_name.focus();
			return false;
		} else if (position.val().length <= 0) {
			alert("직급을 입력해주세요.");
			position.focus();
			return false;
		} else if (hire_date.val().length <= 0) {
			alert("입사일을 입력해주세요.");
			hire_date.focus();
			return false;
		}else if(resignation_date.parent().attr("class").indexOf("error") > 0) {
			alert("경력 날짜의 범위가 올바르지 않습니다.");
			resignation_date.focus();
			return false;
		}else if ($(this).find(".project_no").length > 0) {
			
			$(this).find(".project_no").each(function() {
				checkResult = false;

				var project_name = $(this).data("project_name");
				var start_date = $(this).data("start_date");
				
				if ((project_name + "").length <= 0 || project_name == null) {
					alert("프로젝트명을 입력하세요.");
					return false;
				} else if ((start_date + "").length <= 0 || start_date == null) {
					alert("프로젝트 시작일을 입력하세요.");
					return false;
				} else {
					checkResult = true;
				}
			});
			
			if(!checkResult) {
				return false;
			}
		}else {
			checkResult = true;
		}
	});
	
	if (checkResult) {
		modyCareer();
	}
};

function modyCareer() {
	var param = new Array();
	$("#careerArea").find(".careerForm").each(function() {
		var form = $(this).serializeObject();

		//프로젝트 목록 json에 추가
		if ($(this).find(".projectListArea .project_no").length > 0) {

			var projects = new Array();

			$(this).find(".projectListArea .project_no").each(function() {
				var item = $(this);
				var menuArr = {};
				menuArr["project_no"] = item.val();
				menuArr["career_num"] = item.data("career_num");
				menuArr["project_name"] = item.data("project_name");
				menuArr["start_date"] = item.data("start_date");
				menuArr["end_date"] = item.data("end_date");
				menuArr["client"] = item.data("client");
				menuArr["workplace"] = item.data("workplace");
				menuArr["part"] = item.data("part");
				menuArr["os"] = item.data("os");
				menuArr["language"] = item.data("language");
				menuArr["db"] = item.data("db");
				menuArr["tool"] = item.data("tool");
				menuArr["was"] = item.data("was");
				menuArr["etc"] = item.data("etc");

				projects.push(menuArr);
			});
		}
		form.projectList = projects;
		param.push(form);
	});

	jQuery.ajaxSettings.traditional = true;
	
	$.ajax({
		url : "careerMody.em",
		type : "post",
		data : {
			param : JSON.stringify(param),
			emp_no : $("[name=emp_no").val()
		}
	}).done(function(data) {
		alert("수정 완료");
		totalCareerDate();
		$('#side-tap .ui.tab.segment').eq(3).html(data);
	}).fail(function(data) {
		alert("수정 실패");
	});
}