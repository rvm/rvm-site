---
title: RVM memprof integration
---

# MemProf

MemProf should *just work* with MRI/REE 1.8.X Rubies (only those for now).

```bash
$ rvm 1.8.7@projecta
$ gem install memprof
```

Next in the application be sure to require memprof/signal:

```ruby
require `gem which memprof/signal`.strip
```

Be sure the require happens *before* anything else in your applications code.

Now Profile your application from the command line.

```bash
$ memprof --pid [pid] --name [name] --key [api_key]
```

Where

- [api_key] is your memprof.com api key.
- [pid] is the running pid of your application.
- [name] is the name you wish to assign to the memprof dump.

# Sadism at it's finest...

If you are named Joe D. or Aman G. and are insane enough to actually play around in the Ruby VM itself...

If you'd like to play around in Ruby's guts using C or Assembler... First remove an existing MRI install:

```bash
$ rvm remove 1.8.7
```

Next install the ruby with debug symbols support.

```bash
$ export optflags="-O0 -ggdb3"; rvm install 1.8.7
```

By installing your rubies this way you can extract the maximum amount of *useful* information.

Good luck you sadistically awesome person you...
