//검색용 변수
emp_name = "";
emp_level_code = 0;

$(document).ready(function() {
	search(1);
});

//검색
function search(page) {
	console.log("[master.js]__page >>"+ typeof page);
	console.log("emp_level_code >> "+ typeof emp_level_code);
	console.log("emp_name >> "+ typeof emp_name)
	//JSON.stringify : Object >> JSON.stringify
	let data = 
		{
			emp_name : emp_name,
			emp_level_code : emp_level_code,
			page : page
		}
	
	console.dir(data)

	
	
//	//Ajax API ( post : 개발자 도구 - Network - 해당페이지 request header확인 시 payload로 데이터 전송 )
//	const xhr = new XMLHttpRequest();
//	
//	// onreadystatechange : 준비상태(200, 404, 500...)가 바뀌었을떄 트리거 되는 이벤트
//	xhr.onreadystatechange = function(data) { 
//        if(xhr.readyState === xhr.DONE){      // xhr.DONE는 서버에서 정상 응답되었을때
//           if (xhr.status === 200 || xhr.status === 201) {
//              // 응답시 받은 데이터 확인
//              console.log("성공 데이터 확인 Text : " + xhr.responseText); // 문자열 반환
//              console.log("xhr.responseXML : " + xhr.responseXML ); // 객체로 반환
//              console.log("pi 데이터 : "+ data.pi)
// //             alert('성공데이터 알림 : '+ data)
//              $("#masterTable > tbody").remove();
//        		$("#masterTable > tfoot").remove();     		
//        		$("#masterTable").append();
//           } else {
//              console.error("서버 에러 : " + xhr.response);
//           }
//        } else if(xhr.readyState === 4){      // 네트워크 문제 같은것으로 서버에 가지 못했을때 404 
////           console.error("네트워크 에러 : " + xhr.responseText);
//        	console.error(`네트워크 에러 : [상태]__ ${xhr.status} : [상태텍스트]__${xhr.statusTextx}`)
//        }
//     }
//	
//	// ** GET, POST등을 대문자로 표기하지 않으면 일부 브라우저에서 처리할 수 없음
//	xhr.open("POST","masterPage.ma", true);
//	
//	//Request Header >> Content-type ( MIME-type ) 
//	//application/x-www-form-urlencoded / application/json
//	xhr.setRequestHeader("Content-type","application/json")
//	
//	// ** send()는 제일 마지막에 위치하도록.
//	xhr.send(JSON.stringify(data));
	
	
	$.ajax({
		url : "masterPage.ma",
	//	data : JSON.stringify(data)
		data : data
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