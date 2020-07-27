function getQueryStringParams(str) {
    var params = {};
    str.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
    return params;
}