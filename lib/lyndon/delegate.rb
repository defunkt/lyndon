module Lyndon
  class Delegate
    def webView(sender, didFinishLoadForFrame:frame)
      NSApplication.sharedApplication.stop(self)
    end
  end
end
