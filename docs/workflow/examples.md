---
title: RVM Examples
---

# Examples of using RVM

### RVM version

```
$ rvm -v

rvm 1.25.25 (master) by Wayne E. Seguin <wayneeseguin@gmail.com>, Michal Papis <mpapis@gmail.com> [https://rvm.io/]
```

### Use a particular Ruby.

```
$ rvm use 2.1.1
```

Equivalently (because of RVM's defaults):

```
$ rvm 2.1.1
```

### List Ruby interpreters available for installation

```
$ rvm list known
  # MRI Rubies
  [ruby-]1.8.6[-p420]
  [ruby-]1.8.7[-p374]
  [ruby-]1.9.1[-p431]
  [ruby-]1.9.2[-p320]
  [ruby-]1.9.3[-p547]
  [ruby-]2.0.0-p451
  [ruby-]2.0.0[-p481]
  [ruby-]2.1.1
  [ruby-]2.1[.2]
  [ruby-]2.1-head
  ruby-head

  # GoRuby
  goruby

  # Topaz
  topaz

  # TheCodeShop - MRI experimental patches
  tcs

  # jamesgolick - All around gangster
  jamesgolick

  # Minimalistic ruby implementation - ISO 30170:2012
  mruby[-head]

  # JRuby
  jruby-1.6.8
  jruby[-1.7.12]
  jruby-head
  ...
  (plus many more; omitted for brevity)
```

### List Ruby interpreters you've already installed

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

### Ruby information for the current shell

```
$ rvm info

  ruby-2.1.1:

    system:
      uname:       "Darwin Ryss-iMac.local 13.2.0 Darwin Kernel Version 13.2.0: Thu Apr 17 23:03:13 PDT 2014; root:xnu-2422.100.13~1/RELEASE_X86_64 x86_64"
      system:      "osx/10.9/x86_64"
      bash:        "/bin/bash => GNU bash, version 3.2.51(1)-release (x86_64-apple-darwin13)"
      zsh:         "/bin/zsh => zsh 5.0.2 (x86_64-apple-darwin13.0)"

    rvm:
      version:      "rvm 1.25.25 (master) by Wayne E. Seguin <wayneeseguin@gmail.com>, Michal Papis <mpapis@gmail.com> [https://rvm.io/]"
      updated:      "4 hours 42 minutes 23 seconds ago"
      path:         "/Users/rys/.rvm"
      rvm 0.0.49 (2009.09.24) [http://rvm.beginrescueend.com/]
    ...
    (omitted for brevity)
```

### Use Ruby 2.1.1

```
$  rvm use 2.1.1
```

### Equivalent to "rvm use 2.1.1", due to defaults

```
$  rvm 2.1.1
```

### Switch to gems directory for current ruby

```
$ rvm gemdir

/Users/rys/.gem/ruby/2.1.1
```

### Switch to the system gems directory

```
$ rvm gemdir system

/Library/Ruby/Gems/2.0.0
```

### Switch to the system user gems directory

```
$ rvm gemdir system user

/Users/rys/.gem/ruby/2.0.0
```

### Use the user set default ruby

```
$  rvm default
```

### Use the system ruby (as if no rvm)

```
$  rvm system
```

### Reset to pre-RVM state.

```
$  rvm reset
```

### Uninstall RVM installed 2.0.0 version

```
$  rvm uninstall 2.0.0
```

### Install gems from system gem dir (osx: /Library/Ruby/Gems/2.0.0) using current ruby

```
$  rvm system ; rvm gemset export system.gems ; rvm 2.0.0 ; rvm gemset import system
```
