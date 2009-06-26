module Lyndon
  class Ruby
    ##
    # Lets us call simple ruby methods
    #
    #   Ruby.IO_read(file)
    #   Ruby.puts('hi')
    #   Ruby.require('uri')
    def invokeUndefinedMethodFromWebScript(name, withArguments:args)
      if respond_to? name
        send(name, *args)
      elsif Kernel.respond_to? name
        Kernel.send(name, *args)
      elsif name =~ /^([A-Z][A-Za-z]+)_(.+)/
        const = Kernel.const_get($1)
        method = $2

        if const.respond_to? method
          const.send(method, *args)
        elsif const.respond_to?("#{method}?")
          const.send("#{method}?", *args)
        elsif const.respond_to?("#{method}!")
          const.send("#{method}!", *args)
        end
      end
    end

    ##
    # Ruby('$LOAD_PATH') => array...
    # Ruby('1 + 1') => 2
    def invokeDefaultMethodWithArguments(args)
      eval(args[0])
    end
  end
end
