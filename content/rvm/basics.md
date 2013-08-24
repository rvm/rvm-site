---
title: RVM Basics
---

The Basics of RVM
=================

Wondering why you should [use RVM?](/rvm/) For a start, not only does RVM make installing multiple ruby interpreters / runtimes easy and consistent, it provides features such as gemsets that aren't typically supported out of the box on most ruby installs.

RVM also lets you use different rubies in a manner that wont mess with your existing ruby install (unless you tell it to) as well as letting you run multiple different rubies in seperate terminals concurrently!

### Getting started

First, you must ensure that you [install RVM](/rvm/install/).

### Post Install Configuration

When you log in either via ssh or the local shell account RVM will be loaded as a function. In case of problems use one of following links as reference for configuring your terminal:

* [Gnome Terminal integration](/integration/gnome-terminal/)
* [Screen Workflow](/workflow/screen/)

For non-interactive shells RVM will be added to PATH only, not loaded. This means using rubies is not possible in this mode, but there are simple methods to load ruby:
  
    source $(rvm 1.9.3 do rvm env --path)

Then, when you login or spawn a shell this will automatically load RVM regardless of the shell type. Pretty handy, huh?

You should now open a new shell and start playing with rvm.

A note about the .bash_profile warning. In a few linux distributions, the default .bash_profile (occasionally, the .bashrc) contains the following line:
  
    [ -z "$PS1" ] && return

The condition `[ -z "$PS1" ]` is true if the string "$PS1" has zero length (a non-interactive shell). rvm needs to load for both interactive and non-interactive shells which is why it strongly is recommended to alter this file.

First ensure that the previous step was successful and that rvm is loaded correctly. To do this, and verify that RVM is loaded *as a shell function*, run: `type rvm | head -1`

Assuming this shows "rvm is a function", you're good to go. As an example, to install and use Ruby 1.9.2 you may do:

    $ rvm install 1.9.2

Once you have installed a Ruby interpreter with RVM successfully you may then use it by executing the following command:
  
    $ rvm use 1.9.2
    $ ruby -v
    ruby 1.9.2p0 (2010-08-18 revision 29036) [x86_64-darwin10.4.0]
    $ which ruby
    /Users/wayne/.rvm/rubies/ruby-1.9.2-p0/bin/ruby

NOTE: There has been some confusion amongst new users as to the proper way to switch between Ruby
versions.  It is not required to include the 'ruby-' portion of whatever is listed in the output of `rvm list` for installed rubies. This is just used to indicate the differences between, say, REE rubies, and
MRI rubies, etc. However, do note that when you are switching between an MRI or Rubinus, or REE,
as an example, *then* you need to use the ree|ruby|rbx part. When you want to switch, just use the
version number and any patch level. If its a -head version use the full string as it will not
contain numbers. This also applies when setting a default Ruby. Below is an example of what I mean:
  
    # This changes to MRI Ruby 1.9.2-p180 and sets it as your default.
    $ rvm use 1.9.2-p180 --default
    
    # The following changes to ruby-head (MRI Ruby) but does _not_
    # set it as your default Ruby.
    $ rvm use ruby-head
    
    # This changes to ree-head and _does_ set it as
    # your default ruby
    $ rvm use ree-head --default
    
    # You use the following full form if, for example,
    # you previously had an MRI or Rubinus ruby selected.
    $ rvm use ree-1.8.7-2011

    # This changes to whatever RVM recognizes as the most current
    # MRI Ruby 1.9.2, and sets it as default.
    $ rvm use 1.9.2 --default

**NOTE:** If you use *just* the Major.Minor version numbers, RVM checks for, and uses, what is the most current patchlevel in its $rvm_path/config/db for that Major.Minor version. For example, if you only have 1.9.2-p125 installed, and 1.9.2-p320 is the lastest, RVM will attempt to download, install, and set 1.9.2-p320 as your default 1.9.2 for you. This behaviour may, or may not, be what you want. If its not, then be sure to include the patch level when you specify which Ruby RVM should use when setting a default. RVM updates the known list ($rvm_path/config/db and $rvm_path/config/known) everytime you update RVM, so the 'current' version of a Major.Minor (eg. 1.9.2) can change on you. RVM does not go by what you have installed for this reason. It goes by what is maintained in those two files.

The last example above does not use a patch level because you are basically saying use the most currently released stable version of 1.9.2 which, as of the time of this writing, is 1.9.2-p290. Also, please take note that the keyword *use* above causes RVM to output the version it is switching to. Basically, it makes the change operation verbose. Note that it is *not* required in most operations, and is meant solely for console users to be given a visual prompt that RVM has, in fact, changed Rubies and to which one.

**PLEASE NOTE:** RVM is 'hands off' any system ruby that you have installed. To be able to "use" your system ruby you can tell RVM to undo the environment changes that it has applied, as follows.

    $ rvm use system
    $ ruby -v
    ruby 1.8.7 (2009-06-12 patchlevel 174) [universal-darwin10.0]
    $ which ruby
    /usr/bin/ruby

`which` tells the current shell to return the location of Ruby. In this case, you can see that RVM has, in fact, 'hidden' itself from the system, and given you access back to the system installed Ruby. Hidden does not mean RVM is gone, instead, what is done is the system environment and related variables are set back to what the system Ruby would expect them to be as if RVM were not installed at all. Executing another `$ rvm use default` will return RVM to service, and load whatever Ruby you have set as your default Ruby. You can see  what that is at any time by executing: `$ rvm alias show default`

**We can not stress this enough! RVM does not control the system Ruby or its gems. Only Rubies and gems installed by RVM are under it's control!**

### Where To Now?

For further explanation, look around the rest of the site. In particular, make sure you check out the workflow [examples.](/workflow/examples/)

Remember that switching rubies is on a per-shell basis. If you want even more information on how to set which ruby is available when you open a new shell, you'll need to read our page on how to [set a default ruby interpreter.](/rubies/default/)

After you get the hang of dealing with Ruby Interpreters, next up is starting to learn about RVM [gemsets.](/gemsets/basics/)

If you would like to know which Ruby RVM has selected and made active at any time, if any, you can add this information to your [shell prompt.](/workflow/prompt/)

If you use tab completion in your shell also see the documentation on using [shell completion.](/workflow/completion/)

### Community Resources

* Check here for an [excellent post](http://rubylearning.com/blog/2010/12/20/how-do-i-keep-multiple-ruby-projects-separate/) introducting the why of RVM, written by Steve Klabnik.