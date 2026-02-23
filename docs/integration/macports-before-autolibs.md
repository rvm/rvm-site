---
title: Using MacPorts with older RVM - before autolibs
---

# Using MacPorts with older RVM - before [autolibs](/rvm/autolibs)

## Using MacPorts libraries

Warning RVM 1.19+ requires autolibs to be disabled:

```bash
rvm autolibs disable # OR:
rvm --autolibs=disable install ruby
```

In order to use MacPorts libraries when installing RVM Rubies,
set the following variables in your $HOME/.rvmrc:

```bash
export CFLAGS="-O2 -arch x86_64"
export LDFLAGS="-L/opt/local/lib"
export CPPFLAGS="-I/opt/local/include"
```

First install MacPorts and a base MacPort ruby like 1.8.7,
this gets most of the dependencies in place like openssl, readline, etc.

So now say we want to compile some rubies using MacPorts libraries and
gcc, assuming we have the above variables set in our current shell(relogin):

```bash
$ rvm install 1.8.7 --with-openssl-dir=/opt/local
```

```bash
$ rvm install 1.9.2 --with-opt-dir=/opt/local
```

## Using MacPorts and RVM libraries

Install an older version of openssl via RVM:

```bash
$ rvm pkg install openssl
```

In cases of older rubies you might need to change few things to use openssl from RVM
set the following variables in your $HOME/.rvmrc:

```bash
export CFLAGS="-O2 -arch x86_64"
export LDFLAGS="-L$HOME/.rvm/usr/lib -L/opt/local/lib"
export CPPFLAGS="-I$HOME/.rvm/usr/include -I/opt/local/include"
```

So now say we want to compile some rubies using RVM libraries,
assuming we have the above variables set in our current shell(relogin):

```bash
$ rvm install 1.8.6 --with-openssl-dir=$HOME/.rvm/usr
```

```bash
$ rvm install 1.9.1 --with-openssl-dir=$HOME/.rvm/usr
```

Thanks to metaskills and baburdick for doing the leg work on this :)
