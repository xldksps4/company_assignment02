/*
   ♬ :  URL(주소) Query String 쉽게 가져오기 (인자(쿼리스트링), key, value)
   쿼리스트링 형태의 값을 JSON형태로 바꿔주는 작업
 
   ※참고 : https://gent.tistory.com/62
   		https://apost.kr/330
 */

//사용용도 : JSON.parse(JSON.stringify(result)) 할 필요 없이 그냥 리턴하면 됨
function getQueryStringParams(str) {
    var params = {};
    str.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
    return params;
}