---
title: "Setting the Default Ruby"
---

# Setting the default Ruby

If you would like to make one specific Ruby be the default ruby that is
selected when you open a new terminal shell, use the --default flag:

```
$ rvm --default use 2.1.1

$ ruby -v

ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-darwin12.0]
```

The next time you open a window Ruby 2.1.1 will be the selected ruby.

To switch back to your system ruby:

```
$ rvm use system

$ ruby -v

ruby 2.0.0p451 (2014-02-24 revision 45167) [universal.x86_64-darwin13]
```

To switch at any time to the ruby you have selected as default:

```
$ rvm default

$ ruby -v

ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-darwin12.0]
```

To show what ruby is currently the selected default, if any, do:

```
$ rvm list

rvm rubies

 * ruby-1.9.3-p484 [ x86_64 ]
   ruby-2.0.0-p481 [ x86_64 ]
=> ruby-2.1.1 [ x86_64 ]

# => - current
# =* - current && default
#  * - default
```

If you wish to switch back to your system ruby as default, remember that RVM
does not "manage" the system ruby and is "hands off".

This means to set the "system" ruby as default, you reset RVM's defaults as
follows.

```
$ rvm reset
```

Note that "default" is merely implemented as an
[alias](/rubies/alias/) with an especially significant name.

If you encounter an error such as "RVM is not a function, selecting rubies
with 'rvm use ...' will not work.", try using the
[alias](/rubies/alias/) action instead:

```
$ rvm alias create default 2.1.1
```
