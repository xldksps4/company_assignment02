$(document).ready(function() {
		qualification();
	});
	$(document).off("change", ".qualification").on("change", ".qualification", function() {
		qualification();
	});
	
	function qualification() {
		if($(".qualification").is(":checked")) {
			$("#highSchool").find("input").not(".qualification").not("input[type=hidden]").attr("disabled", true);
		}else {
			$("#highSchool").find("input").removeAttr("disabled");
		}
	};
	
	schoolList();
	
	//학교명 입력 시 리스트에 추가
	$(document).off("blur", "[name=school_name]").on("blur", "[name=school_name]", function() {
		schoolList();
	});
	
	function schoolList() {
		var ol = $("#schoolListArea ol");
		var li = "";
		
		$("#schoolArea [name=school_name]").each(function() {
			li += '<li><div class="ui visible message"><p>' + $(this).val() + '</p></div></li>';
		});
		
		ol.html(li);
	}
	
	//대학, 대학원 폼 추가버튼
	function addSchool() {
		var form = $("#schoolFormOriginal").clone();
		form.removeAttr("id").removeAttr("style");
		
		$("#schoolList").append(form);
		schoolList();
	};
	
	//해당 학력사항 삭제
	$(document).off("click", ".deleteSchool").on("click", ".deleteSchool", function(){
		var school_no = $(this).parents("form").find("[name=school_no]").val();
		var answer = confirm("해당 정보를 정말 삭제하시겠습니까?\n삭제 시 복구할 수 없습니다.");
		if(answer) {
			//기존 정보에서 삭제할 시 해당 학력번호 상태 N
			if(school_no > 0) {
				deleteSchool(school_no);
			}
			
			$(this).parents(".schoolForm").remove();
			schoolList();
		}
	});
	
	function deleteSchool(school_no) {
		$.ajax({
			url : "deleteSchool.em",
			data : {
				school_no : school_no
			}
		}).fail(function(data) {
			alert("접속에러");
		});
	}
	
	//입학일 졸업일 체크
	$(document).on("blur", ".dateInput", function() {
		var date = $(this).val();
		var year = date.substr(0, 4);
		var month;
		
		var index = date.indexOf(".");
		
		//. 포함 x
		if(index > 0) {
			month = date.substr(5, 2);
		}else {
			month = date.substr(4, 2);
		}
		
		if(month.length == 1 && month < 10) {
			month = "0" + month;
		}
		
		if(year < 1000 || isNaN ( year ) || month < 1 || month > 12) {
			$(this).parent("div").addClass("error");
			$(this).focus();
		}else {
			$(this).parent("div").removeClass("error");
			date = year + "." + month;
			$(this).val(date);
		}
		
		//입학일 - 졸업일 기간 범위 체크
		var start = $(this).parents(".fields").find("[name=admission_date]").val();
		start = Number(start.replace(".", ""));
		var end = $(this).parents(".fields").find("[name=graduate_date]").val();
		end = Number(end.replace(".", ""));
		
		if(start > end) {
			$(this).parents(".fields").find("[name=graduate_date]").parent("div").addClass("error");
		}else {
			$(this).parents(".fields").find("[name=graduate_date]").parent("div").removeClass("error");
		}
		
	});
	
	//필수입력사항 체크
	function schoolCheck() {
		var checkResult = false;
		
		$("#schoolArea .schoolForm").each(function(index) {
			
			checkResult = false;
			
			var school_name = $(this).find("[name=school_name]");
			var admission_date = $(this).find("[name=admission_date]");
			var graduate_date = $(this).find("[name=graduate_date]");
			var major = $(this).find("[name=major]");
			
			if(index == 0 && $(this).find(".qualification").is(":checked")) {
				checkResult = true;
			}else {
				if(school_name.val() == "") {
					alert("학교명을 입력해주세요.");
					school_name.focus();
					return false;
				}else if(admission_date.val().length <= 0) {
					alert("입학일을 입력해주세요.");
					admission_date.focus();
					return false;
				}else if(graduate_date.val().length <= 0 || graduate_date.parent("div").hasClass("error")) {
					alert("졸업일을 올바르게 입력해주세요.");
					graduate_date.focus();
					return false;
				}else if(index > 0 && major.val() == "") {
					alert("전공을 입력해주세요.");
					major.focus();
					return false;
				}else {
					checkResult = true;
				}
			}
		});
		
		if(checkResult) {
			modySchool();
		}
	};
	
	function modySchool() {
		
		var param = new Array();
		
		$("#schoolArea .schoolForm").each(function() {
			var form = $(this).serializeObject();
			param.push(form);
		});
		
		jQuery.ajaxSettings.traditional = true;
		
		$.ajax({
			url : "schoolMody.em",
			type : "post",
			data : {
				param : JSON.stringify(param),
				emp_no : $("[name=emp_no]").val()
			}
		}).done(function(data) {
			alert("수정 완료");
			$('#side-tap .ui.tab.segment').eq(0).html(data);
		}).fail(function(data) {
			alert("수정 실패");
		});
	};