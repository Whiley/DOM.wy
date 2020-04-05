package w3c

import js_string from js::util
import std::ascii

// Standard DOM JavaScript method
public native export method alert(ascii::string str)

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
    js_string location,
    // Gives access to data saved across browser sessions
    Storage localStorage,
    // Gives access to data saved within a session
    Storage sessionStorage,
    ...    
}

// ===========================================================
// Base Nodes
// ===========================================================

public type Node is &{
    // =============================================
    // Event Listener Stuff
    // =============================================    
    method addEventListener(js_string,method(Event)|method(MouseEvent)|method(KeyboardEvent)),
    method removeEventListener(js_string,method(Event)|method(MouseEvent)|method(KeyboardEvent)),
    // =============================================
    // Node Stuff
    // =============================================    
    // Identifies what kind of node this i
    int nodeType,
    // Read only property returns node name
    js_string nodeName,
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
    js_string nodeValue,
    // 
    null|js_string textContent,
    // methods.
    method appendChild(Node),
    method replaceChild(Node,Node),
    ...
}

public type Document is (&{
    // =============================================
    // Event Listener Stuff
    // =============================================    
    method addEventListener(js_string,method(Event)|method(MouseEvent)|method(KeyboardEvent)),
    method removeEventListener(js_string,method(Event)|method(MouseEvent)|method(KeyboardEvent)),
    // =============================================
    // Stuff from Node
    // =============================================    
    // Identifies what kind of node this i
    int nodeType,
    // Read only property returns node name
    js_string nodeName,
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
    js_string nodeValue,
    // 
    null|js_string textContent,
    // methods.
    method appendChild(Node),
    method replaceChild(Node,Node),
    // =============================================
    // Document specific stuff
    // =============================================    
    // Create raw Element
    method createElement(js_string)->(Element),
    // Create text node
    method createTextNode(js_string)->(Text),
    // Return element with matching id attribute
    method getElementById(js_string)->(Element),
    // Write text directly into HTML Document
    method write(js_string),
    // Write text directly into HTML Document, with newline character.
    method writeln(js_string),
    // Other stuff
    ...
} n) where n->nodeType == DOCUMENT_NODE

public type Element is &{
    // =============================================
    // Event Listener Stuff
    // =============================================    
    method addEventListener(js_string,method(Event)|method(MouseEvent)|method(KeyboardEvent)),
    method removeEventListener(js_string,method(Event)|method(MouseEvent)|method(KeyboardEvent)),
    // =============================================
    // Stuff from Node
    // =============================================
    // Identifies what kind of node this i
    int nodeType,
    // Read only property returns node name
    js_string nodeName,
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
    js_string nodeValue,
    // 
    null|js_string textContent,
    // methods.
    method appendChild(Node),
    method replaceChild(Node,Node),
    // =============================================
    // Element specific stuff
    // =============================================
    CssStyleDeclaration style,
    // Access child
    (Element)[] children,
    // Sets or returns text of this node
    js_string innerText,
    //
    method setAttribute(js_string,js_string),
    //
    ...
} 

public type Text is (Node n)
where n->nodeType == TEXT_NODE

// ===========================================================
// CSS
// ===========================================================

public type CssStyleDeclaration is &{
    // Indirect accessors
    method getPropertyValue(js_string)->js_string,
    // set a new value for property
    method setProperty(js_string,js_string),
    // returns a CSS property name by index
    method item(int)->js_string,
    // remove a property by name
    method removeProperty(js_string),
    // Direct accessors
    js_string background,
    js_string backgroundAttachment,
    js_string backgroundColor,
    js_string backgroundImage,
    js_string backgroundPosition,
    js_string backgroundRepeat,
    js_string border,
    js_string borderBottom,
    js_string borderBottomColor,
    js_string borderBottomStyle,
    js_string borderBottomWidth,
    js_string borderColor,
    js_string borderLeft,
    js_string borderLeftColor,
    js_string borderLeftStyle,
    js_string borderLeftWidth,
    js_string borderRight,
    js_string borderRightColor,
    js_string borderRightStyle,
    js_string borderRightWidth,
    js_string borderStyle,
    js_string borderTop,
    js_string borderTopColor,
    js_string borderTopStyle,
    js_string borderTopWidth,
    js_string borderWidth,
    js_string clear,
    js_string clip,
    js_string color,
    js_string cursor,
    js_string display,
    js_string filter,
    js_string cssFloat,
    js_string font,
    js_string fontFamily,
    js_string fontSize,
    js_string fontVariant,
    js_string fontWeight,
    js_string height,
    js_string left,
    js_string letterSpacing,
    js_string lineHeight,
    js_string listStyle,
    js_string listStyleImage,
    js_string listStylePosition,
    js_string listStyleType,
    js_string margin,
    js_string marginBottom,
    js_string marginLeft,
    js_string marginRight,
    js_string marginTop,
    js_string overflow,
    js_string padding,
    js_string paddingBottom,
    js_string paddingLeft,
    js_string paddingRight,
    js_string paddingTop,
    js_string pageBreakAfter,
    js_string pageBreakBefore,
    js_string position,
    js_string strokeDasharray,
    js_string strokeDashoffset,
    js_string strokeWidth,
    js_string textAlign,
    js_string textDecoration,
    js_string textIndent,
    js_string textTransform,
    js_string top,
    js_string verticalAlign,
    js_string visibility,
    js_string width,
    js_string zIndex
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
    js_string code,
    bool ctrlKey,
    bool isComposing,
    js_string key,    
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
    js_string src,
    ...
}

// ===========================================================
// Canvas
// ===========================================================

public type HTMLCanvasElement is &{
    int width,
    int height,
    method getContext(js_string) -> CanvasRenderingContext2D,
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
    method fillText(js_string, int, int),
    // Draws (steokes) a given text at the given (x, y) position.
    method strokeText(js_string, int, int),
    // Returns a TextMetrics object.
    method measureText(js_string)->TextMetrics,
    // Width of lines (default 1)
    int lineWidth,
    //
    js_string font,
    js_string textAlign,
    js_string textBaseLine,
    js_string direction,
    // Color to use inside shapes
    js_string fillStyle,
    // Color to use for lines around shapes
    js_string strokeStyle,
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
    function key(int)->(js_string),
    function getItem(js_string)->(null|js_string),
    method setItem(js_string,js_string),
    method removeItem(js_string),
    method clear(),
    ...
}