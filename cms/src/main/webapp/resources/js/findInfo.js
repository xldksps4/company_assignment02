function onKeyDown() {
	if(event.keyCode == 13) {
		event.preventDefault();
		findIDCheck();
     }
}
	
function findIDCheck() {
	
	var name = $("#findIdForm [name=emp_name]").val();
	var email = $("#findIdForm [name=email]").val();
	
	if(name == "" || email =="") {
		$("#find-id-msg").text("이름과 이메일주소를 모두 입력하세요.");
	}else if(!email.includes("@")) {
		$("#find-id-msg").text("이메일 형식이 올바르지 않습니다.");
	}else {
		find("id");
	}
}

function findPwdCheck() {
	
	var id = $("#findPwdForm [name=id]").val();
	var name = $("#findPwdForm [name=emp_name]").val();
	var email = $("#findPwdForm [name=email]").val();
	
	if(id == "" || name == "" || email =="") {
		$("#find-pwd-msg").text("아이디와 이름, 이메일주소를 모두 입력하세요.");
	}else if(!email.includes("@")) {
		$("#find-pwd-msg").text("이메일 형식이 올바르지 않습니다.");
	}else {
		find("pwd");
	}
}

var params;
function find(type) {
	
	var url;
	
	if(type == "id") {
		params = $("#findIdForm").serialize();
		url = "findMyId.em";
	}else if(type = "pwd") {
		params = $("#findPwdForm").serialize();
		url = "findMyPwd.em";
	}
	
	params = decodeURIComponent(params);
	
	$.ajax({
		url : url,
		data : params,
		type: "post"
	}).done(function(data) {
		
		if(data.result != null) {
			
			var info = data.result;
			var form;
			
			if(type == "id") {
				
				form = '<div> <p><label class="info-text">';
				form += info.emp_name + ', ' + info.email;
				form += '</label>로 찾은 아이디 입니다.<br> 개인정보 보호를 위해 아이디는 8자리로, 일부는 *로 표시됩니다. </p> <h4>';
				form += (info.emp_id).substr(0, 3) + "*****";
				form += '</h4> <button class="fluid ui blue button" onclick="sendMyId()">등록한 이메일 주소로 전체 ID 전송</button> <br>'
				form += '<button class="fluid ui grey button" onclick="location.href=' + "'signinForm.em'" + '">로그인 페이지로 이동</button> </div>';
				
				$("#find-id-area").html(form);
				
				params += "&emp_id=" + info.emp_id;
				
			}else if(type == "pwd"){
				
				form = '<div> <p> <label class="info-text">';
				form += info.email;
				form += '</label>로 임시 비밀번호를 발송했습니다.<br> 로그인 후 내 정보 → 비밀번호 수정에서 비밀번호를 변경해주세요. </p>';
				form += '<button class="fluid ui blue button" onclick="location.href=' + "'signinForm.em'" + '">로그인 페이지로 이동</button> </div>'
				
				$("#find-pwd-area").html(form);
			}
			
		}else {
			if(type == "id") {
				$("#find-id-msg").text("일치하는 정보가 없습니다.");
			}else if(type == "pwd"){
				$("#find-pwd-msg").text("일치하는 정보가 없습니다.");
			}
		}
		
	}).fail(function() {
		alert("접속에러");
	});
}

function sendMyId() {
	
	$.ajax({
		url : "sendMyId.em",
		data : params,
		type : "post"
	}).done(function() {
		
		params = getQueryStringParams(params);
		
		var form = '<div> <p> <label class="info-text">';
		form += params.email;
		form += '</label>로 전체 ID를 발송했습니다.</p>';
		form += '<button class="fluid ui blue button" onclick="location.href=' + "'signinForm.em'" + '">로그인 페이지로 이동</button> </div>';
			
		$("#find-id-area").html(form);
	}).fail(function() {
		alert("메일 전송 실패");
	});
	
}