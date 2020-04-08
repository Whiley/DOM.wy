package w3c

import u16, uint from std::integer
import string from js::core

public final int UNSENT = 0
public final int OPENED = 1
public final int HEADERS_RECEIVED = 2
public final int LOADING = 3
public final int DONE = 4

public type XMLHttpRequest is &{
    // Returns a string representing all headers
    method getAllResponseHeaders()->(string),
    // Returns a string for a specified header (or null)
    method getResponseHeader(string)->(string|null),
    // Handler called when request done
    method onload(),
    // Defines handler to be called when readyState changes   
    method onreadystatechange(),
    // Specifies the request
    method open(string, string, bool),    
    // Holds the status of this request
    int readyState,
    // Returns response text as string
    string responseText,
    // Defines the response type
    null|string responseType,
    // Sends request to server (for GET)
    // method send(),
    // Sends request to server (for POST)
    method send(string),
    // Identifies the response code
    u16 status,
    // Identifies the time (in ms) before request terminated
    uint timeout,
    // Cancel current request
    method abort(),
    //
    ...
}

// Create a new XMLHttpRequest object
public native export method newXMLHttpRequest() -> XMLHttpRequest