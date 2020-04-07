package w3c

import string from js::core

public type HttpRequestHandler is method(int,null|string)

// Perform an HTTP request using XMLHttpRequest.
public native export method makeHttpRequest(string mthd, string url, HttpRequestHandler handler)