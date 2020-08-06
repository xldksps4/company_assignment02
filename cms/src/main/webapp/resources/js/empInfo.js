$(document).ready(function(e) {
	// 경력등록 클릭으로 들어왔을 시 경력등록 창 활성화
	if($("[name=info_code]").val() == 1) {
		$("#info-main-tap a").eq(2).trigger("click");
	}
	let beforeTabA = $('#side-tap a.active').attr('data-tab');
	console.log(beforeTabA);
	let beforeTabDiv = $('#side-tap div.active').attr('data-tab');
	
	$('#side-tap .menu .item').click(()=>{

		console.log("confirm 전 ... "+beforeTabA)	;			// 화면전환 전 테이터 확인
		
		
//이벤트 변경 감지 
		
		if(confirm(" 변경사항이 있습니다. 그래도 화면을 바꾸시나요? ")){

			beforeTabA = $('#side-tap a.active').attr('data-tab');
			console.log("confirm 확인 ... "+beforeTabA);

			// 얘 실행은 밖에 있습니다.
			
		}else{
			$('.menu .item').tab('change tab', beforeTabA);
			console.log("confirm 취소 ... "+beforeTabA);
		}
	});

});

/* k.fn.init */
console.log($('.menu .item').tab({history:true, historyType: 'hash'}))

$('.menu .item').tab()
$('.ui.radio.checkbox').checkbox();


function showDetail(emp_no) {
	window.open("showDetailEmpForm.em?emp_no=" + emp_no);  
}