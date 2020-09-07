'use strict';

function empInfo() {
/* loginEmp가 존재한다면 저기로 보내고싶으셨나봄 */
//	if(${ loginEmp != null }) {
//		location.href="empInfoForm.em?info_code=1";
//	}
		location.href="signinForm.em";
	
}
		
function notice(board_no) {
	location.href = "detailNotice.bo?board_no=" + board_no;
}
