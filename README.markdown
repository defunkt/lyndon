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

Oh, the DOM
-----------

    $ lyndon test.html 
    js> Lyndon.require('jquery.min.js')
    => true
    js> jQuery('#hi').html()
    => "Hello."
    js> jQuery('#hi').html('Hi.')
    => [object Object]
    js> jQuery('#hi').html()
    => "Hi."
    => "[object HTMLBodyElement]"
    js> document.body.innerHTML
    => "\n    <h1 id=\"hi\">Hi.</h1>\n  \n\n"


HTML with JavaScript
--------------------

    $ cat examples/index.html | lyndon
    <html><head>
    <title>It worked!</title>
     </head><body>
    <div id="content">
    <div id="hi">Hello world!</div></div>
    </body></html>
    
Note that the `<div id="hi">Hello world!</div></div>` does _not_ exist
in `examples/index.html` - it's added at runtime by
JavaScript. JavaScript that strips itself out and changes the
`<title`>. 

Seriously.


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
