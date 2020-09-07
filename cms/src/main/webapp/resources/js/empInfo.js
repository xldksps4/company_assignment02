$(document).ready(function(e) {
	// 경력등록 클릭으로 들어왔을 시 경력등록 창 활성화
	if($("[name=info_code]").val() == 1) {
		$("#info-main-tap a").eq(2).trigger("click");
	}
	
// Tab 전환 인식 위한 코드
	let beforeTabA = $('#side-tap a.active').attr('data-tab');
	console.log(beforeTabA);
	let beforeTabDiv = $('#side-tap div.active').attr('data-tab');
	
	$('#side-tap .menu .item').click(()=>{

		console.log("confirm 전 ... "+beforeTabA)	;			// 화면전환 전 테이터 확인
		
		
/* 이벤트 감지 실패 -- id기준, 모든 input 기준 */
		
		
//		$('#side-tap input').change(function() {
//			alert("변경사항 존재");

		
//			if(confirm(" 변경사항이 있는지 확인해주세요. 화면을 바꾸시나요? ")){
//	
//				beforeTabA = $('#side-tap a.active').attr('data-tab');
//				console.log("confirm 확인 ... "+beforeTabA);
//				$('#side-tap a.active').tab();
//				// 해당 구문의 Tab 실행은 블록 밖에 있습니다.
//
//			}else{
//				$('.menu .item').tab('change tab', beforeTabA);
//				console.log("confirm 취소 ... "+beforeTabA);
//			}
		
		
//			return true;
//		});
	});

});

/* k.fn.init */
console.log($('.menu .item').tab({history:true, historyType: 'hash'}))
let tab_cnt = 1;

$('.menu .item').tab()
tab_cnt +=1;
console.log(tab_cnt);

/*
 tab함수에 콘솔을 찍어본 결과
 탭 구문 실행 시 마다  
 */


$('.ui.radio.checkbox').checkbox();


function showDetail(emp_no) {
	window.open("showDetailEmpForm.em?emp_no=" + emp_no);  
}