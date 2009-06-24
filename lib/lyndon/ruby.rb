module Lyndon
  class Ruby
    def puts(*args)
      super
    end

    def invokeUndefinedMethodFromWebScript(name, withArguments:args)
      if respond_to? name
        send(name, *args)
      end
    end
  end
end
