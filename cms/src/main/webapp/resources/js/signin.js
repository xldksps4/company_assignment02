function onKeyDown() {
	if(event.keyCode == 13) {
		event.preventDefault();
		check();
     }
}
	
function check() {
	if($("[name=emp_id]").val() == "" || $("[name=emp_pwd]").val() =="") {
		$("#signin-msg").text("아아디와 비밀번호를 모두 입력하세요");
	}else {
		signin();
	}
}

function signin() {
	$("#signinForm").submit();
}

function signup() {
	location.href="signupForm.em";
}