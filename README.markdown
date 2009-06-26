Lyndon
======

Lyndon is like [Johnson](http://github.com/jbarnette/johnson). But for MacRuby. And with JavaScriptCore.

Here It Goes
------------

    $ rip install git://github.com/defunkt/lyndon.git
    Successfully installed lyndon (41548d2)
    $ lyndon
    js> 1 + 1
    => 2
    js> function name() { return "lyndon!" }
    => undefined
    js> name
    => function name() { return "lyndon!" }
    js> name()
    => "lyndon!"
    js> Ruby.puts('Ruby, I presume.')
    Ruby, I presume.
    => undefined
    js> Ruby.File_read('hi.js')
    => "// this is hi.js\n"

Stuff like that.

With Ruby
---------

If you want:

        $ macirb
        >> require 'lyndon'
        => true
        >> Lyndon.eval('1 + 1')
        => 2
        >> r = Lyndon::Runtime.new
        => ##-<Lyndon::Runtime:...>
        >> r.eval('var name = "chris"')
        => undefined
        >> r.eval('name')
        => "chris"
        
That's basically it.

Chris Wanstrath // chris@ozmm.org
