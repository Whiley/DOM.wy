# DOM.wy

Whiley bindings for the W3C Document Object Model.  Currently, these
have been developed by hand.  Hopefully, in the future, they will be
generated automatically from the [living DOM
standard](https://www.w3.org/DOM/).

## Example 1 (Hello World)

Here's a minimal example which appends some text to a root `div`:

```
import w3c::dom

public export method main(dom::Document document):
    // Extract root div
    dom::Element root = document->getElementById("root")
    // Create text node
    dom::Node text = document->createTextNode("Hello World")
    // Append to root div
    root->appendChild(text)
```

This can then be called from a webpage using something like the
following:

```
<html> <head>
<title></title>
<script type="text/javascript" src="bin/js/std.js"></script>
<script type="text/javascript" src="bin/js/js.js"></script>
<script type="text/javascript" src="bin/js/dom.js"></script>
<script type="text/javascript" src="bin/js/main.js"></script>
</head>

<body bgcolor="#ffffff">
<div id="root"></div>
<script>
  window.onload = function() { main$main(document); }
</script>
</body>
</html>
```

## Example 2 (Event Handlers)

The following illustrates a more complex example which creates a
button along with a simple event handler which fires when clicked.
The code corresponds very closely to how it would look in JavaScript:

```
import w3c::dom

public export method main(dom::Document document):
    // Extract root div
    dom::Element root = document->getElementById("root")
    // Create button
    dom::Element button = document->createElement("button")
    // Set button text
    button->appendChild(document->createTextNode("Click Me!"))
    // Set click handler
    button->addEventListener("click",&handler)
    // Append button to root div
    root->appendChild(button)

method handler(dom::MouseEvent e):
    dom::alert("Clicked!")
```

## Example 3 (AJAX Handlers)

The following illustrates the code necessary to generate an AJAX
request.  The `get` method accepts a response handler for the
successful case, along with an error handler if the request fails for
some reason.

```
import string from js::core
import w3c::ajax

method get(string url, method(string) success, method(int) error):
    // Construct a new request
    ajax::XMLHttpRequest xhttp = ajax::newXMLHttpRequest()
    // Configure an async get request
    xhttp->open("GET",url,true)
    // Configure receipt handler
    xhttp->onreadystatechange = &( -> handler(xhttp,success,error))
    // Send the request!
    xhttp->send("")

method handler(ajax::XMLHttpRequest xhttp, method(string) success, method(int) error):
    if xhttp->readyState == ajax::DONE:
        // Extract status code
        int status = xhttp->status
        // Check whether success or failure
        if status == 200:
            // success
            success(xhttp->responseText)
        else:
            // Failure
            error(status)
```


