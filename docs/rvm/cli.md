---
title: RVM CLI
---

# RVM CLI Usage

RVM comes with many options, however it has lots of defaults that are intended to make the command line API much more 'natural'.

```
rvm help
```

### RVM general usage API

```
rvm [action] [interpreter] [options]
```

### Where "action" is one of

```
use       - setup current shell to use a specific ruby version
[interpreter]
          - when used as an action it is a silent 'use'
system
reset     - remove default and current settings, exit the shell.
info      - show information for current ruby
list      - show currently installed versions
reload    - reload RVM source itself (useful after changing RVM source)
implode   - removes all ruby installations it manages, everything in ~/.rvm
get       - {stable,head} upgrades RVM to the stable or git head branches.
do        - runs a named ruby file against specified and/or all rubies

install   - install one or many ruby versions
upgrade   - install new ruby, copy gemsets, make gems pristine, remove old ruby
reinstall - remove ruby, install it, make gems pristine
uninstall - uninstall one or many ruby versions, leaves their sources
remove    - uninstall one or many ruby versions and remove their sources
```

### And where [interpreter] is one of

```
ruby      - MRI/YARV Ruby (The Standard), defaults to 1.8.6
jruby     - JRuby
rbx       - rubinius
ree       - ruby Enterprise Edition
system    - use the system ruby (eg. pre-RVM state)
default   - use RVM set default ruby and system if it hasn't been set.
```

Better list can be found by running

```
rvm list
```

### And where [options] are one of

```
-v|--version  - Emit RVM version loaded for current shell
-h|--help     - Emit this output and exit
--default     - when used with ruby selection, sets a default ruby for new shells.
--debug       - Toggle debug mode on for very verbose output.
--force       - Force install, removes old install & source before install.
--all         - Used with 'rvm list' to display 'most' available versions.
--summary     - Used with 'do' to print out a summary of the commands run.
--with*       - Forwarded to `./configure`
-C            - custom configure options, comma separated, double quote
                args that need quoting, default: --enable-shared=true
```

## Usage Notes:

- Defaults above are denoted with a '*' prefix.
