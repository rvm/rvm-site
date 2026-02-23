---
title: rvm info - information about rvm environments
---

# RVM Info

### Usage

```
$ rvm info [ruby_string[,ruby_string[,...] [section,[section[,...]
```

where sections are one of:

```
system rvm ruby homes binaries environment debug
```

Both ruby strings and sections are optional arguments.

By default, with no parameters, rvm info will output all sections except debug.

### Debug

To display system rvm debug information:

```
$ rvm debug
```

which will display all sections including debug for the current or specified interpreters.

### Example:

```
$ rvm info 2.1.1,1.9.3 homes,binaries

ruby-2.1.1:

  homes:
    gem:          "/Users/rys/.rvm/gems/ruby-2.1.1"
    ruby:         "/Users/rys/.rvm/rubies/ruby-2.1.1"

  binaries:
    ruby:         "/Users/rys/.rvm/rubies/ruby-2.1.1/bin/ruby"
    irb:          "/Users/rys/.rvm/rubies/ruby-2.1.1/bin/irb"
    gem:          "/Users/rys/.rvm/rubies/ruby-2.1.1/bin/gem"
    rake:         "/Users/rys/.rvm/gems/ruby-2.1.1/bin/rake"

ruby-2.1.1:

  homes:
    gem:          "/Users/rys/.rvm/gems/ruby-2.1.1"
    ruby:         "/Users/rys/.rvm/rubies/ruby-2.1.1"

  binaries:
    ruby:         "/Users/rys/.rvm/rubies/ruby-2.1.1/bin/ruby"
    irb:          "/Users/rys/.rvm/rubies/ruby-2.1.1/bin/irb"
    gem:          "/Users/rys/.rvm/rubies/ruby-2.1.1/bin/gem"
    rake:         "/Users/rys/.rvm/gems/ruby-2.1.1/bin/rake"
```
