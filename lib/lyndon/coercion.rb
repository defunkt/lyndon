# help convert objects WebKit's JS returns into
# things we can use

class NSCFNumber
  def inspect
    if Integer(self) == Float(self)
      Integer(self).to_s
    else
      Float(self).to_s
    end
  end
end

class NSCFBoolean
  def inspect
    (self == NSNumber.numberWithBool(true)).to_s
  end
end

class WebScriptObject
  def inspect
    callWebScriptMethod("toString", withArguments:nil)
  end
end

class WebUndefined
  def inspect
    'undefined'
  end
end
