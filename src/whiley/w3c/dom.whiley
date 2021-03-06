package w3c

import string from js::core
import number from js::core

// ==============================================================
// Bindings against the Document Object Model (DOM)
// ==============================================================

public final int ELEMENT_NODE = 1
public final int TEXT_NODE = 3
public final int CDATA_SECTION_NODE = 4
public final int PROCESSING_INSTRUCTION_NODE = 7
public final int COMMENT_NODE = 8
public final int DOCUMENT_NODE = 9
public final int DOCUMENT_TYPE_NODE = 10
public final int DOCUMENT_FRAGMENT_NODE = 11

public type List<T> is &{
    int length,
    // Add item to list
    method add(T),
    // Check whether item contained
    function contains(T)->bool,
    // Return ith item
    function item(int)->T,
    // Remove item
    method remove(T),
    // Mark as open
    ...
}

public type EventListener is method(Event)|method(MouseEvent)|method(KeyboardEvent)

// ===========================================================
// Enclosing Window
// ===========================================================
public type Window is &{
    // Read only reference to contained document 
    Document document,
    // Returns current event being handled
    Event event,
    // Indicates whether window is full screen or not
    bool fullScreen,
    // Returns reference to browser history
    History history,
    // Gets height of browser's content area
    int innerHeight,
    // Gets width of browser's content area    
    int innerWidth,
    // Indicates whether secure context
    bool isSecureContext,
    // Current URL of window object
    string location,
    // Gives access to data saved across browser sessions
    Storage localStorage,
    // Gives access to data saved within a session
    Storage sessionStorage,
    // Standard DOM JavaScript method
    method alert(string),
    // Decode base-64 encoded string
    method atob(string),
    // Remove focus from current window
    method blur(),
    // Encode string in base-64
    method btoa(string),
    // Clear timer set via setTimeout()
    method clearTimeout(),
    // Clear timer set via setInterval()
    method clearInterval(),
    // Close current window
    method close(),
    // Display dialog box with given message and Ok / Cancel buttons
    method confirm(string),
    // Sets focus to the current window
    method focus(),
    // Gets the current computed CSS styles applied to an element
    method getComputedStyle(Element),
    // Gets the current computed CSS styles applied to an element using pseudoelement
    //method getComputedStyle(Element, string),
    // Returns a Selection object representing the range of text selected by the user
    //  method getSelection()
    // Returns a MediaQueryList object representing the specified CSS media query string
    //  method matchMedia(string mediaQueryString)
    // Moves a window relative to its current position
    method moveBy(int, int),
    // Moves a window to the specified position
    method moveTo(int, int),
    // Open new browser window or tab.
    method open(string, string, string, bool) -> Window,
    // Prints the content of the current window
    method print(),
    // Display dialog box prompting user for input
    method prompt(string, string) -> string|null,
    // Requests the browser to call a function to update an animation before the next repaint
    method requestAnimationFrame(method(number))->int,
    // Resize window by specified pixels
    method resizeBy(int, int),
    // Resize window to specified width and height
    method resizeTo(int, int),
    // Scrolls the document by the specified number of pixels
    method scrollBy(int, int),
    // Scrolls the document to the specified coordinates
    method scrollTo(int, int),
    // Call method after delay (ms)
    method setTimeout(method(),int),
    // Call method at specified interval (ms)
    method setInterval(method(), int),
    // Stops the window from loading
    method stop(),
    // Done        
    ...    
}

// ===========================================================
// Base Nodes
// ===========================================================

public type Node is &{
    // =============================================
    // Event Listener Stuff
    // =============================================    
    method addEventListener(string,EventListener),
    method removeEventListener(string,EventListener),
    // =============================================
    // Node Stuff
    // =============================================    
    // Identifies what kind of node this i
    int nodeType,
    // Read only property returns node name
    string nodeName,
    // Parent of current node
    null|Element parent,
    // Return array of all nodes in tree
    Node[] childNodes,
    // Return first child in tree
    Node firstChild,
    // Return last child in tree
    Node lastChild,
    // Returns next child in parents tree
    Node nextSibling,
    // Returns previous child in parents tree
    Node previousSibling,
    // Indicates whether connected to "root" context (e.g. Document)
    bool isConnected,
    // Indicates whether node has children or not
    function hasChildNodes()->(bool),
    // Sets or returns the value of the current node
    string nodeValue,
    // 
    null|string textContent,
    // methods.
    method appendChild(Node),
    method removeChild(Node),    
    method replaceChild(Node,Node),
    ...
}

public type Document is (&{
    // =============================================
    // Event Listener Stuff
    // =============================================    
    method addEventListener(string,EventListener),
    method removeEventListener(string,EventListener),
    // =============================================
    // Stuff from Node
    // =============================================    
    // Identifies what kind of node this i
    int nodeType,
    // Read only property returns node name
    string nodeName,
    // Parent of current node
    null|Element parent,
    // Return array of all nodes in tree
    Node[] childNodes,
    // Return first child in tree
    Node firstChild,
    // Return last child in tree
    Node lastChild,
    // Returns next child in parents tree
    Node nextSibling,
    // Returns previous child in parents tree
    Node previousSibling,
    // Indicates whether connected to "root" context (e.g. Document)
    bool isConnected,
    // Indicates whether node has children or not
    function hasChildNodes()->(bool),
    // Sets or returns the value of the current node
    string nodeValue,
    // 
    null|string textContent,
    // methods.
    method appendChild(Node),
    method removeChild(Node),
    method replaceChild(Node,Node),
    // =============================================
    // Document specific stuff
    // =============================================    
    // Create raw Element
    method createElement(string)->(Element),
    // Create text node
    method createTextNode(string)->(Text),
    // Return element with matching id attribute
    method getElementById(string)->(Element),
    // Write text directly into HTML Document
    method write(string),
    // Write text directly into HTML Document, with newline character.
    method writeln(string),
    // Other stuff
    ...
} n) where n->nodeType == DOCUMENT_NODE

public type Element is &{
    // =============================================
    // Event Listener Stuff
    // =============================================    
    method addEventListener(string,EventListener),
    method removeEventListener(string,EventListener),
    // =============================================
    // Stuff from Node
    // =============================================
    // Identifies what kind of node this i
    int nodeType,
    // Read only property returns node name
    string nodeName,
    // Parent of current node
    null|Element parent,
    // Return array of all nodes in tree
    Node[] childNodes,
    // Return first child in tree
    Node firstChild,
    // Return last child in tree
    Node lastChild,
    // Returns next child in parents tree
    Node nextSibling,
    // Returns previous child in parents tree
    Node previousSibling,
    // Indicates whether connected to "root" context (e.g. Document)
    bool isConnected,
    // Indicates whether node has children or not
    function hasChildNodes()->(bool),
    // Sets or returns the value of the current node
    string nodeValue,
    // 
    null|string textContent,
    // methods.
    method appendChild(Node),
    method removeChild(Node),
    method replaceChild(Node,Node),
    // =============================================
    // Element specific stuff
    // =============================================    
    CssStyleDeclaration style,
    // Access child
    (Element)[] children,
    // Sets or returns element class
    string className,
    // Returns the class name(s) of an element
    List<string> classList,
    // Sets or returns element id
    string id,
    // Sets or returns text of this node
    string innerText,
    // Removes element from parent
    method remove(),
    //
    method setAttribute(string,string),
    method getAttribute(string),
    method removeAttribute(string),
    //
    ...
} 
public type TextArea is &{
    // =============================================
    // Event Listener Stuff
    // =============================================    
    method addEventListener(string,EventListener),
    method removeEventListener(string,EventListener),
    // =============================================
    // Stuff from Node
    // =============================================
    // Identifies what kind of node this i
    int nodeType,
    // Read only property returns node name
    string nodeName,
    // Parent of current node
    null|Element parent,
    // Return array of all nodes in tree
    Node[] childNodes,
    // Return first child in tree
    Node firstChild,
    // Return last child in tree
    Node lastChild,
    // Returns next child in parents tree
    Node nextSibling,
    // Returns previous child in parents tree
    Node previousSibling,
    // Indicates whether connected to "root" context (e.g. Document)
    bool isConnected,
    // Indicates whether node has children or not
    function hasChildNodes()->(bool),
    // Sets or returns the value of the current node
    string nodeValue,
    // 
    null|string textContent,
    // methods.
    method appendChild(Node),
    method removeChild(Node),
    method replaceChild(Node,Node),
    // =============================================
    // Element specific stuff
    // =============================================
    CssStyleDeclaration style,
    // Access child
    (Element)[] children,
    // Sets or returns text of this node
    string innerText,
    //
    method setAttribute(string,string),
    // =============================================
    // TextArea specific stuff
    // =============================================
    // Sets or returns cols attribute
    int cols,
    // Sets or returns the default value of a text area
    string defaultValue,
    // Sets or returns whether the text area is disabled, or not
    bool disabled,
    // Sets or returns the value of the maxlength attribute of a text area         
    int maxLength,
    // Sets or returns the value of the name attribute of a text area
    string name,
    // Sets or returns whether the contents of a text area is read-only
    bool readOnly,
    // Sets or returns whether the text area must be filled out before submitting a form
    bool required,
    // Sets or returns the value of the rows attribute of a text area
    int rows, 
    //
    string value,
    // Sets or returns the value of the wrap attribute of a text area
    bool wrap,
    ...
} 


public type Text is (Node n)
where n->nodeType == TEXT_NODE

// ===========================================================
// CSS
// ===========================================================

public type CssStyleDeclaration is &{
    // Indirect accessors
    method getPropertyValue(string)->string,
    // set a new value for property
    method setProperty(string,string),
    // returns a CSS property name by index
    method item(int)->string,
    // remove a property by name
    method removeProperty(string),
    // Direct accessors
    string background,
    string backgroundAttachment,
    string backgroundColor,
    string backgroundImage,
    string backgroundPosition,
    string backgroundRepeat,
    string border,
    string borderBottom,
    string borderBottomColor,
    string borderBottomStyle,
    string borderBottomWidth,
    string borderColor,
    string borderLeft,
    string borderLeftColor,
    string borderLeftStyle,
    string borderLeftWidth,
    string borderRight,
    string borderRightColor,
    string borderRightStyle,
    string borderRightWidth,
    string borderStyle,
    string borderTop,
    string borderTopColor,
    string borderTopStyle,
    string borderTopWidth,
    string borderWidth,
    string clear,
    string clip,
    string color,
    string cursor,
    string display,
    string filter,
    string cssFloat,
    string font,
    string fontFamily,
    string fontSize,
    string fontVariant,
    string fontWeight,
    string height,
    string left,
    string letterSpacing,
    string lineHeight,
    string listStyle,
    string listStyleImage,
    string listStylePosition,
    string listStyleType,
    string margin,
    string marginBottom,
    string marginLeft,
    string marginRight,
    string marginTop,
    string overflow,
    string padding,
    string paddingBottom,
    string paddingLeft,
    string paddingRight,
    string paddingTop,
    string pageBreakAfter,
    string pageBreakBefore,
    string position,
    string strokeDasharray,
    string strokeDashoffset,
    string strokeWidth,
    string textAlign,
    string textDecoration,
    string textIndent,
    string textTransform,
    string top,
    string verticalAlign,
    string visibility,
    string width,
    string zIndex
}

// =======================================================
// Events
// =======================================================

public type Event is &{
    int timeStamp,
    ...
}

public type MouseEvent is &{
    bool altKey,
    int button,
    int buttons,
    int clientX,
    int clientY,
    bool ctrlKey,
    bool metaKey,
    int movementX,
    int movementY,
    int offsetX,
    int offsetY,
    int pageX,
    int pageY,
    int region,
    int screenX,
    int screenY,
    bool shiftKey,
    ...
}

public type KeyboardEvent is &{
    bool altKey,
    string code,
    bool ctrlKey,
    bool isComposing,
    string key,    
    int keyCode,
    int location,
    bool metaKey,
    bool repeat,
    bool shiftKey,
    ...
}

// ===========================================================
// HTMLImageElement
// ===========================================================

// Utterly broken
public type HTMLImageElement is &{
    string src,
    ...
}

// ===========================================================
// Canvas
// ===========================================================

public type HTMLCanvasElement is &{
    int width,
    int height,
    method getContext(string) -> CanvasRenderingContext2D,
    ...
}

public type CanvasRenderingContext2D is &{
    // Clears rectangle at (x, y) position whose size is determined by width and height.    
    method clearRect(int, int, int, int),
    // Draws a filled rectangle at (x, y) position whose size is determined by width and height.
    method fillRect(int, int, int, int),
    // Draws a rectangle at (x, y) position whose size is determined by width and height.    
    method strokeRect(int, int, int, int),
    // Draws (fills) a given text at the given (x, y) position.
    method fillText(string, int, int),
    // Draws (steokes) a given text at the given (x, y) position.
    method strokeText(string, int, int),
    // Returns a TextMetrics object.
    method measureText(string)->TextMetrics,
    // Width of lines (default 1)
    int lineWidth,
    //
    string font,
    string textAlign,
    string textBaseLine,
    string direction,
    // Color to use inside shapes
    string fillStyle,
    // Color to use for lines around shapes
    string strokeStyle,
    // Paths
    // Starts a new path
    method beginPath(),
    // Causes pen to move back to start of current path
    method closePath(),
    // Move to starting point of path
    method moveTo(int, int),
    // Connt last point to given point in straight line
    method lineTo(int, int),
    // Fills current path
    method fill(),
    // Strokes current path
    method stroke(),
    // Images
    method drawImage(HTMLImageElement,int,int),
    // Creates a new, blank ImageData object with the specified dimensions.
    method createImageData(int,int)->ImageData,
    // Returns an ImageData object representing the underlying pixel data for an area of the canvas 
    method getImageData(int,int,int,int)->ImageData,
    // Paints data from the given ImageData object onto the bitmap
    method putImageData(ImageData,int,int),
    ...
}

public type TextMetrics is &{
    // should be a double!
    int width,
    ...
}

public type ImageData is &{
    int[] data,
    int height,
    int width,
    ...
}

public type History is &{
    int length,
    // Asynchronous method goes to previous page in history
    method back(),
    // Asynchronous method goes to next page in history
    method forward(),
    // Asynchronously loads a page from the session history
    method go(int),
    ...
}

public type Storage is &{
    // Returns number of items stored
    int length,
    function key(int)->(string),
    function getItem(string)->(null|string),
    method setItem(string,string),
    method removeItem(string),
    method clear(),
    ...
}