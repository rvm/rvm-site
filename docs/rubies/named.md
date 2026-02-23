---
title: "Named Rubies"
---

# Named Rubies

RVM allows you to install the same ruby multiple times using suffixes.
This can be useful for a number of purposes, such as making and testing
patches for a ruby itself.
You may also want to read about
[how to patch](/rubies/patching/) and
[how to alias](/rubies/alias/) rubies.

## Creating a named Ruby

The process is the same as installation, just use the
**-n \{name\}** switch:

```
$ rvm install rbx -n default_19 -- --default-version=1.9
rbx-head-default_19 installing #dependencies
...
$ rvm use rbx-default_19
Using /home/mpapis/.rvm/gems/rbx-head-default_19
```

or simply add a hyphen and the name as a suffix to a valid ruby version:

```
$ rvm install 2.1.1-named
...
ruby-2.1.1-named - #configuring
...
$ rvm use 2.1.1-named
Using /Users/rys/.rvm/gems/ruby-2.1.1-named
```

## Selecting names for your Rubies

There are strict rules for the names of named rubies. First, the name of
a named ruby must match the following regexp pattern:

```
[[:alpha:]][[:alnum:]_]*
```

Second, the name must also not match any other version specifier,
nor any of the following regexp patterns:

```
head
system
nightly
preview.*
rc[[:digit:]].*
p[[:digit:]].*
r[[:digit:]].*
s[[:alnum:]].*
tv[[:digit:]].*
t[[:digit:]].*
m[[:digit:]].*
u[[:alnum:]].*
a[[:digit:]][[:digit:]].*
b[[:digit:]].*
ruby
rbx
jruby
macruby
ree
kiji
rubinius
maglev
ironruby
goruby
```

If the above list is incomplete or you find exceptions please feel free to
[contribute](/development/contributing/).
