package w3c

import js_string from js::util

public type HttpRequestHandler is method(int,null|js_string)

// Perform an HTTP request using XMLHttpRequest.
public native export method makeHttpRequest(js_string mthd, js_string url, HttpRequestHandler handler)