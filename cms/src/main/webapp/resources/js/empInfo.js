$(document).ready(function() {
	//경력등록 클릭으로 들어왔을 시 경력등록 창 활성화
	if($("[name=info_code]").val() == 1) {
		$("#info-main-tap a").eq(2).trigger("click");
	}
	
//	let divTab = document.getElementsByClassName("menu > item")//속성 값 배열

//	divTab.addEventListener("onclick", function(){
//		if(divTab.getAttribute("data-tab").include("sub")){
//			alert('만세')
//		}
//	});
		


	$('.menu .item').click((e)=>{
// 		if(isChange){
							//화면에 데이터가 남아있는데 필요할까?
		if(confirm("변경사항이 있습니다. 누르시겠습니까?") == true){
			console.log("예")
		}else{
			console.log("아니오")
//			e.preventDefault()
//			e.stopPropagation();
//			return false;
//			return;
			$( "div" ).attr( "data-tab" ).preventDefault();
		}
		
//		}
	})
});

$('.menu .item').tab()
$('.ui.radio.checkbox').checkbox();

function showDetail(emp_no) {
	window.open("showDetailEmpForm.em?emp_no=" + emp_no);  
}