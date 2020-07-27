$('.ui.modal').modal();

//수정일 일수 계산
$(document).ready(function() {
	var mody = '<fmt:formatDate value="${ emp.mody.emp_modify_date }" pattern="yyyy-MM-dd" />';
	
	var now = new Date();
	var today = new Date(now.getFullYear(), now.getMonth()+1, now.getDate());
	
	var mody_day = mody.split("-");
	
	var mody_date = new Date(mody_day[0], mody_day[1], mody_day[2]);
	
	mody_date = today - mody_date;
	mody_date = mody_date/(24 * 3600 * 1000);
	
	if(mody_date >= 0) {
		$("#history-info-area").find("li").eq(0).append(" (" + mody_date + "일 전 수정)");
	}
});

//탈퇴하기
function deleteEmp() {
	var answer = confirm("탈퇴 요청을 하시겠습니까?");
	if (answer) {

		$.ajax({
			url : "deleteEmpRequest.em",
			data : {
				emp_no : '${ loginEmp.emp_no }'
			},
			type : "post"
		}).done(function(data) {
			alert(data.msg);
		}).fail(function(jqXHR, textStatus, errorThrown) {
			alert("접속에러");
		});

	}
}

//다음 주소 API를 통한 주소 검색
function addressSearch() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			$("#address").val(addr);
		}
	}).open();
};

//이메일 주소 선택
$("#emailSelect").change(
		function() {
			if ($("#emailSelect").val() == "직접입력"
					|| $("#emailSelect").val() == "") {
				$("#email2").val("");
			} else {
				$("#email2").val($("#emailSelect").val());
			}
		});

//항목 필수 입력 체크
function infoCheck() {

	var empName = $("#emp_name").val();
	var dept = $("#dept_code option:selected").val();
	var phone = $("#phone1").val() + "-" + $("#phone2").val() + "-"
			+ $("#phone3").val() + "";
	$("#phone").val(phone);
	var email = $("#email1").val() + "@" + $("#email2").val();
	$("#email").val(email);
	var address = $("#address").val();

	if (empName == "") {
		alert("이름을 입력해주세요.");
		$("#emp_name").focus();
	} else if (dept <= 0) {
		alert("부서를 선택해주세요.");
	} else if ($("#phone1").val() == "" || $("#phone2").val() == ""
			|| $("#phone3").val() == "") {
		alert("휴대폰 번호를 입력해주세요.");
		$("#phone1").focus();
	} else if ($("#email1").val() == "" || $("#email2").val() == "") {
		alert("이메일을 입력해주세요.");
		$("#email1").focus();
	} else if (address == "") {
		alert("주소를 입력해주세요.");
		addressSearch();
	} else {
		$("#phone").val(phone);
		$("#email").val(email);
		
		if ($("[name=emp_no]").val() > 0) {
			var answer = confirm("관리자 권한으로 해당 사원의 정보를 수정하시겠습니까?");
			if (!answer) {
				return false;
			}
		}
		
		infoMody();
	}
};

//기본정보 수정하기
function infoMody() {
	var emp = $("#empInfoForm").serialize();
	emp = decodeURIComponent(emp);
	
	$.ajax({
		url : "modyMyInfo.em",
		data : emp,
		type : "post"
	}).done(function(data) {
		alert("정보를 수정하였습니다.");
		$("#main-tap-area .segment").eq(0).html(data);
	}).fail(function(data) {
		alert("수정 실패");
	});
};

//프로필 사진 관련
//*** 삭제 모달 확인
function profileImg(type) {
	
	var emp_no = $("[name=emp_no]").val();
	
	//type : 1 - 등록 및 수정, 2 - 삭제
	if (type == 2) {
		var answer = confirm("사진을 삭제하시겠습니까?");
		if (answer) {
			//삭제처리
			profile();
		}
	} else {
		//등록 및 수정 모달 띄우기
		$.ajax({
			url : "myInfoModal.em",
			data : {
				emp_no : emp_no
			}
		}).done(function(data) {
			if(data.profile) {
				$("#oldImg").attr("src", "resources/uploadFiles/profileImage/" + data.profile.emp_no + "/" + data.profile.change_name);
			}else {
				$("#oldImg").attr("src", "resources/images/noImage.png");
			}
			$('#profileImgModal').modal('show');
		});
	}
};

//사진 등록 input 띄우기
function modyProfile() {
	var img = $('#profileImg');
	img.click();

	$('#profileImg').off('change').on('change', function() {
		readURL(this);
	});
}

//프로필 사진 미리보기
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$("#modyProfileImg").attr("src", e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

function checkProfile() {
var img = $("#profileImg").val();
	
	if (img == "") {
		alert("이미지를 등록해주세요.");
	}else {
		profile();
	}
}

//사진 등록, 수정, 삭제 처리
function profile() {
	var form = $("#profileImgForm")[0];
	var formData = new FormData(form);

	$.ajax({
		url : "modyProfileImg.em",
		type : "POST",
		enctype : 'multipart/form-data',
		data : formData,
		dataType : 'html',
		processData : false,
		contentType : false,
		cache : false,
		timeout : 600000
	}).done(function(data) {
		alert("사진을 수정하였습니다.");
		$(".ui.modal .actions>.ui.black.deny.button").trigger("click");
		$("#main-tap-area .segment").eq(0).html(data);
	}).fail(function(data) {
		alert("사진등록 실패");
	});
};

//사진 등록 취소 시, 등록 후 폼 비우기
function formEmpty() {
	$("#profileImg").val("");
	$("#modyProfileImg").attr("src", "resources/images/noImage.png");
}