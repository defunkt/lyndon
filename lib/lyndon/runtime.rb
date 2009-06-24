# http://developer.apple.com/documentation/Cocoa/Reference/WebKit/ObjC_classic/index.html

module Lyndon
  class Runtime
    def initialize
      @webView = WebView.new
      @scripter = @webView.windowScriptObject
      @scripter.setValue(Ruby.new, forKey:"Ruby")
    end

    def eval(js)
      @scripter.evaluateWebScript(js)
    end
  end
end
