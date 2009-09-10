BadEncodings
================

Small gem that tries to make the task of finding bad ruby encodings in your project a little easier. e.g. 'find_bad_encodings .'

Installation
=======

Install gem as normal

    gem install adamsalter-bad_encodings-ruby19


Usage
-----

You can either use it as a binary:

    ~/my_unencoded_dir/$ find_bad_encodings .
    # => various wrongly encoded files.
    
or add it as a rake task to your (rails) project:

    # put this in your project Rakefile
    require 'bad_encodings/tasks'
    
    ~/my_unencoded_project/$ rake find_bad_encodings



Known Bugs
========

None. (well actually the detection of ruby encoding is pretty simple and probably not 100% accurate, certainly works for everything I've tried it on... patches welcome.)


Follow me on:  
>  Twitter: [twitter.com/adamsalter](http://twitter.com/adamsalter)  
>  Github: [github.com/adamsalter](http://github.com/adamsalter)

Copyright (c) 2009 Adam @ [Codebright.net][cb], released under the MIT license

[cb]:http://codebright.net "http://codebright.net"