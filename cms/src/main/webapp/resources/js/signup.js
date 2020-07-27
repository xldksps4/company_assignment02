//휴대폰 번호 입력 시 자동 탭
$(".phone").on("keyup", function() {
	if(this.value.length >= $(this).attr("maxlength")) {
		var index = $(".phone").index(this) + 1;
		$(".phone").eq(index).focus();
	}
});

idCheck = false;
passCheck = false;

/* 아이디 중복 확인 */
$("#emp_id").on("change paste keyup", function() {
	idCheck = false;
	$("#idResult").text("");
	$("#idCheckBtn").text("중복체크");
	$("#idCheckBtn").removeClass();

	if ($("#emp_id").val() == "") {
		$("#idCheckBtn").addClass("ui button");
		$("#idCheckBtn").removeAttr("onclick");

	} else {
		$("#idCheckBtn").addClass("ui primary button");
		$("#idCheckBtn").attr("onclick", "checkId()");
	}
});

function checkId() {
	var emp_id = $("#emp_id").val();

	$.ajax({
		url : "idCheck.em",
		data : {
			emp_id : emp_id
		},
		type : "post"
	}).done(function(data) {
		$("#idCheckBtn").removeClass();

		var msg = "";

		if (data.check) {
			idCheck = true;

			$("#idCheckBtn").addClass("ui positive button");
			$("#idCheckBtn").text("확인완료");
			$("#idCheckBtn").removeAttr("onclick");
			$("#idResult").css("color", "#1e70bf");
			msg = "사용 가능한 아이디 입니다.";
		} else {
			idCheck = false;

			$("#idCheckBtn").addClass("ui primary button");
			$("#idCheckBtn").attr("onclick", "checkId()");
			$("#idResult").css("color", "red");
			msg = "중복된 아이디 입니다.";
		}

		$("#idResult").text(msg);
	}).fail(function(data) {
		alert("접속에러");
	});
};

/* 비밀번호 일치 여부 */
$(".password").on("change paste keyup", function() {
	$("#passwordResult").text("");
	
	var pwd1 = $("#emp_pwd1").val();
	var pwd2 = $("#emp_pwd2").val();
	
	if(pwd1.length < 4 || pwd2.length < 4) {
		passCheck = false;
		$("#passwordResult").text("비밀번호는 최소 4자리 이상이어야 합니다.").css("color", "red");
	}else if(pwd1 != pwd2) {
		passCheck = false;
		$("#passwordResult").text("비밀번호가 일치하지 않습니다.").css("color", "red");
	}else {
		passCheck = true;
		$("#passwordResult").text("비밀번호가 일치합니다.").css("color", "#1e70bf");
	}
});

/* 이메일 주소 선택 */
$("#emailSelect").change(function() {
	if ($("#emailSelect").val() == "직접입력"
			|| $("#emailSelect").val() == "") {
		$("#email2").val("");
	} else {
		$("#email2").val($("#emailSelect").val());
	}
});

/* 가입 form 전체 체크 */
function check() {
	var empId = $("#emp_id").val();
	var password = $("#emp_pwd1").val();
	var dept = $("#dept_code option:selected").val();
	var empName = $("#emp_name").val();
	var gender = $("input[name=gender]:checked").val();
	var birth = $("#birth").val();
	var phone = $("#phone1").val() + "-" + $("#phone2").val() + "-"
			+ $("#phone3").val() + "";
	$("#phone").val(phone);
	var email = $("#email1").val() + "@" + $("#email2").val();
	$("#email").val(email);

	if (!idCheck) {
		alert("아이디 중복체크를 해주세요.");
		$("#empId").focus();
	} else if (!passCheck) {
		alert("비밀번호를 확인해주세요.");
		$("#password2").val("");
		$("#password1").focus();
	} else if (dept <= 0) {
		alert("부서를 선택해주세요.");
	} else if (empName == "") {
		alert("이름을 입력해주세요.");
		$("#emp_name").focus();
	} else if (birth == "") {
		alert("생년월일을 입력해주세요.");
		$("#birth").focus();
	} else if ($("#phone1").val() == "" || $("#phone2").val() == ""
			|| $("#phone3").val() == "") {
		alert("휴대폰 번호를 입력해주세요.");
		$("#phone1").focus();
	} else if ($("#email1").val() == "" || $("#email2").val() == "") {
		alert("이메일을 입력해주세요.");
		$("#email1").focus();
	} else {
		/*
		$.ajax({
			url : "signup.em",
			data : $("#signupForm").serialize(),
			type : "post"
		}).done(function(data) {
			console.log(data);
			$(".content-area").html(data);
		}).fail(function() {
			alert("접속 에러");
		});
		*/
		$("#signupForm").submit();
		
	}
};