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
	
	let emp_id = document.getElementsByName("emp_id")[0].value;
	let emp_pw = document.getElementsByName("emp_pwd")[0].value;
	let res = document.getElementById("signin-msg");
	
	if(emp_id != "" && emp_pw !="" ){
		signin();
		
	}else if(emp_id == "" || emp_pw =="") {
//		console.log(`null is exist >> id : ${emp_id}, pw : ${emp_pw}`);
		res.textContent ="";
		res.style.display = "block";
		res.style.color = "red";
		res.textContent = "아이디와 비밀번호를 모두 입력하세요"
	}
	
	
//	if($("[name=emp_id]").val() == "" || $("[name=emp_pwd]").val() =="") {
//		$("#signin-msg").text("아이디와 비밀번호를 모두 입력하세요");
//	}else {
//		signin();
//	}
}

function signin() {
	$("#signinForm").submit();
}

function signup() {
	location.href="signupForm.em";
}