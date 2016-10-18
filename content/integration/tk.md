# Tk

To get RVM working with Tk (on OSX) you will need ActiveState's Tcl/Tk distribution.
You will then need to reinstall your RVM Ruby to take advantage of Tk.

For instance, to do this with Ruby 2.0.0 you would do something like this:

    rvm reinstall 2.0.0 --enable-shared --enable-pthread --with-tk --with-tcl

Now, if you fire up IRB you'll be able to:

    require "tk"
