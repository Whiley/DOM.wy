/**
 * Perform an HTTP request to a given URL.  Upon receipt of a
 * response, the handler is notified.
 */
function w3c$ajax$makeHttpRequest(method, url,handler) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
	if (this.readyState == 4) {
	    handler(this.status,this.responseText);
	}
    };
    xhttp.open(method, url, true);
    xhttp.send();
}
