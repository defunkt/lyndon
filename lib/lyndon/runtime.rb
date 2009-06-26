# http://developer.apple.com/documentation/Cocoa/Reference/WebKit/ObjC_classic/index.html

module Lyndon
  class Runtime
    def initialize(dom = nil)
      @webView = WebView.new
      @webView.setFrameLoadDelegate(Delegate.new)

      @scripter = @webView.windowScriptObject
      @scripter.setValue(Ruby.new, forKey:"Ruby")

      load_dom(dom) if dom
      eval_file 'lib/js/lyndon'
    end

    def eval(js)
      @scripter.evaluateWebScript(js)
    end

    def eval_file(file)
      file = File.expand_path(file.to_s)
      if File.exists? file
        eval File.read(file)
      elsif File.exists? file + '.js'
        eval File.read(file + '.js')
      end
    end

    def load_dom(dom, base_url = nil)
      dom = File.exists?(dom) ? File.read(dom) : dom
      @webView.mainFrame.loadHTMLString(dom, baseURL:base_url)
      NSApplication.sharedApplication.run
    end
  end
end
