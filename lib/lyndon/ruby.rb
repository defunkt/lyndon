module Lyndon
  class Ruby
    ##
    # Lets us call simple ruby methods
    #
    #   Ruby.IO_read(file)
    #   Ruby.puts('hi')
    def invokeUndefinedMethodFromWebScript(name, withArguments:args)
      if respond_to? name
        send(name, *args)
      elsif Kernel.respond_to? name
        Kernel.send(name, *args)
      elsif name =~ /^([A-Z][A-Za-z])_(\w+)/
        Kernel.const_get($1).send($2, *args)
      end
    end
  end
end
