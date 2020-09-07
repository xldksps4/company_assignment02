//json 객체 재정의 함수
/*
  ♬ : form 데이터를 Object로 만들어주는 함수 ( serializeArray() ) 사용
 	참고 : https://kingbbode.tistory.com/28
 		 https://gracefullight.dev/2016/12/28/jQuery-serializeObject-form%EC%9D%84-json%EC%9C%BC%EB%A1%9C-%EB%B3%80%ED%99%98/
 */

//사용용도 : 비동기 submit 진행 시  form 값을 확인해보고 json object 로 받아 한 번에 request 를 날리고 싶을 때 유용하다.
$.fn.serializeObject = function() {
	"use strict"
	var result = {}
	var extend = function(i, element) {
		var node = result[element.name]
		if ("undefined" !== typeof node && node !== null) {
			if ($.isArray(node)) {
				node.push(element.value)
			} else {
				result[element.name] = [ node, element.value ]
			}
		} else {
			result[element.name] = element.value
		}
	}
	$.each(this.serializeArray(), extend) //♬ : serializeObject는 serializeArray를 사용하여 직접 구현할 수 있습니다.
	return result
}

/*
 위 설명에 대한 예 ) 
 ** 서버로 보내야 할 데이터 스펙     vs    serializeObject 결과
{ 						ㅣ	{
 title : "", 			ㅣ		title : "",
 statudents : [			ㅣ		name1 : "",
  {						ㅣ		age1  : "",
   	name : "", 			ㅣ		name2 : "",
   	age : "" 			ㅣ		age2  : "",
  }, 					ㅣ		name3 : "",
  { 					ㅣ		age3  : ""
  	name : "", 			ㅣ	}
  	age : "" 			ㅣ
  }, 					ㅣ
  { 					ㅣ
  	name : "", 			ㅣ
  	age : "" 			ㅣ
  }						ㅣ
 ] 						ㅣ
}


 
 */