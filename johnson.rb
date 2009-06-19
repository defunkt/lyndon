# http://developer.apple.com/documentation/Cocoa/Reference/WebKit/ObjC_classic/index.html

framework 'WebKit'

webView = WebView.new
object = webView.windowScriptObject

object.evaluateWebScript("var name = 'chris'")
puts object.evaluateWebScript("name")
