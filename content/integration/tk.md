# Tk

To get RVM working with Tk (on OSX) you will need ActiveState's Tcl/Tk distribution.
You will then need to reinstall your RVM Ruby to take advantage of Tk.

For instance, to do this with Ruby 1.9.3 you would do something like this:

    rvm reinstall 1.9.3 --enable-pthread

Now, if you fire up IRB you'll be able to:

    require "tk"
