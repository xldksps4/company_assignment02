function onKeyDown() {
	if(event.keyCode == 13) {
		event.preventDefault();
		check();
     }
}

function check() {
	$("#password-msg").text("");
	var pwd = $("#emp_pwd").val();
	
	if(pwd.length <= 0) {
		$("#password-msg").text("비밀번호를 입력해주세요.");
	}else {
		$.ajax({
			url : "passwordCheck.em",
			data : {
				emp_pwd : pwd
			}
		}).done(function(data) {
			if (data.result > 0) {
				var form = $("#changePwdFormOriginal").clone();
				form.attr("id", "changePwdForm").removeAttr("style");
				
				$("#pwdArea").html(form);
			} else {
				$("#password-msg").text("비밀번호가 일치하지 않습니다.");
			}
		}).fail(function(data) {
			alert("접속에러");
		});
	}
}

//변경할 비밀번호와 확인 비밀번호가 일치한지
function updatePwd() {
	var pwd1 = $("#changePwdForm").find("#emp_pwd1").val();
	var pwd2 = $("#changePwdForm").find("#emp_pwd2").val();
	var msg = "";
	
	if(pwd1.length <= 0 || pwd2.length <= 0) {
		$("#changePwdForm").find("#passwordResult").text("변경할 비밀번호를 입력하세요");
	}else if(pwd1.length < 4 || pwd2.length < 4) {
		$("#changePwdForm").find("#passwordResult").text("비밀번호의 길이는 최소 4자리 이상입니다.");
	}else if(pwd1 != pwd2) {
		$("#changePwdForm").find("#passwordResult").text("비밀번호가 일치하지 않습니다.");
	}else {
		$.ajax({
			url : "updatePwd.em",
			data : {
				emp_pwd : pwd1,
				emp_no : $("[name=emp_no]").val()
			},
			type : "post"
		}).done(function(data) {
			alert("비밀번호가 변경되었습니다.");
			$(".bottom").eq(1).html(data);
		}).fail(function(data) {
			alert("접속에러");
		});
	}
}