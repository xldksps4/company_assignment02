"use strict";
/* about login */

function onKeyDown() {
	if(event.keyCode == 13) { 	// == enter
		event.preventDefault(); // 이벤트 발생 취소
						// Q : 위 함수를 사용한 이유 ?
		check();
     }
}

//로그인 클릭 시
function check() {
	
//	let emp_id = document.getElementsByTagName("emp_id").value;
//	let emp_pw = document.getElementsByTagName("emp_pwd").value;
//	console.dir(`emp_id : ${emp_id}, emp_pw : ${emp_pw}`);
//	console.log(`emp_id > ${emp_id}, emp_pw > ${emp_pw}`);
//	console.log("emp_id >> "+ emp_id + " emp_pw >> "+emp_pw)
//	
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