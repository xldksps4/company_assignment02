//noticeList
//공지사항 상세보기
$(document).on("click", "#noticeTable tbody tr", function() {
	var board_no = $(this).find("[name=board_no]").val();

	if (board_no > 0) {
		location.href = "detailNotice.bo?board_no=" + board_no;
	}
});

//페이징 클릭
function search(page) {
	location.href = "notice.bo?page=" + page;
}

//noticeForm
function noticeCheck() {
	var title = $("[name=board_title]");
	var content = $("[name=board_content]");

	if (title.val().length <= 0) {
		alert("제목을 입력해주세요.");
		title.focus();
	} else if (content.val().length <= 0) {
		alert("내용을 입력해주세요.");
		content.focus();
	} else {
		$("#noticeForm").submit();
	}
}

$(document).on("click", ".deleteFile", function() {
	var answer = confirm("파일을 삭제하시겠습니까?");
	var a = $(this);
	var file_no = a.find("[name=file_no]").val();

	if (answer) {
		$.ajax({
			url : "deleteFile.bo",
			data : {
				file_no : file_no
			},
			type : "post"
		}).done(function(data) {
			alert("파일 삭제");
			a.remove();
		}).fail(function(data) {
			alert("접속에러");
		});
	}
});

//noticeDetail
function deleteBoard(board_no) {
	var answer = confirm("게시글을 삭제하시겠습니까?");
	
	if(answer) {
		location.href="deleteBoard.bo?board_no=" + board_no;
	}
}

//첨부파일 다운로드
$(document).on("click", "a[name='file']", function(e){
	e.preventDefault(); 
	$(this).next("form").submit();
});

//첨부파일의 이미지 검증
var regex = /(.+?jpg$|.+?gif$|.+?jpeg$|.+?png$)/g;

$("input[name='changeName']").each(function(){
	console.log($(this).val());
	var result = regex.exec($(this).val());
	if(result!=null){
		$("#imgBox").html('<img src="resources/uploadFiles/noticeFile/'+$(this).val()+'"><br>')
	};
})

