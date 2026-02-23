---
title: "Using MacPorts with older RVM - before autolibs"
---

%h1
  Using MacPorts with older RVM - before
  %a{:href => "/rvm/autolibs"} autolibs

%h2 Using MacPorts libraries

Warning RVM 1.19+ requires autolibs to be disabled:

%pre.code
  :preserve
    rvm autolibs disable # OR:
    rvm --autolibs=disable install ruby

%p
  In order to use MacPorts libraries when installing RVM Rubies,
  set the following variables in your $HOME/.rvmrc:

%pre.code
  :preserve
    export CFLAGS="-O2 -arch x86_64"
    export LDFLAGS="-L/opt/local/lib"
    export CPPFLAGS="-I/opt/local/include"

%p
  First install MacPorts and a base MacPort ruby like 1.8.7,
  this gets most of the dependencies in place like openssl, readline, etc.

%p
  So now say we want to compile some rubies using MacPorts libraries and
  gcc, assuming we have the above variables set in our current shell(relogin):

%pre.code
  :preserve
    $ rvm install 1.8.7 --with-openssl-dir=/opt/local

%pre.code
  :preserve
    $ rvm install 1.9.2 --with-opt-dir=/opt/local

%h2 Using MacPorts and RVM libraries

%p
  Install an older version of openssl via RVM:

%pre.code
  :preserve
    $ rvm pkg install openssl

%p
  In cases of older rubies you might need to change few things to use openssl from RVM
  set the following variables in your $HOME/.rvmrc:

%pre.code
  :preserve
    export CFLAGS="-O2 -arch x86_64"
    export LDFLAGS="-L$HOME/.rvm/usr/lib -L/opt/local/lib"
    export CPPFLAGS="-I$HOME/.rvm/usr/include -I/opt/local/include"

%p
  So now say we want to compile some rubies using RVM libraries,
  assuming we have the above variables set in our current shell(relogin):

%pre.code
  :preserve
    $ rvm install 1.8.6 --with-openssl-dir=$HOME/.rvm/usr

%pre.code
  :preserve
    $ rvm install 1.9.1 --with-openssl-dir=$HOME/.rvm/usr

%p
  Thanks to metaskills and baburdick for doing the leg work on this :)
