---
title: JRuby
---

# JRuby

JRuby is a ruby interpreter that gives the best of the JVM -- as battle-tested in the field for many years -- together with the awesomeness that is Ruby syntax.

## Installing

```bash
$ rvm install jruby
```

## Choosing the Ruby API

Currently, as of this writing, JRuby loads the Ruby 1.8 API and runs as 1.8.7
version. As of JRuby version 1.7 the default will become 1.9.

If you need to run JRuby with the 1.9 Ruby API, you can do so in RVM
using after_use hooks. You must record the JRUBY configuration

```bash
export JRUBY_OPTS="--1.9"
```

Be sure to add this to your jruby environment file(s).

For your console environment, I recommend detecting JRuby in an after_use
[hook](/workflow/hooks/) and adding the export.

So for example, your after_use hook file might look something like this:

```bash
case "$GEM_HOME" in
  *jruby*)
    JRUBY_OPTS="--1.9" ; export JRUBY_OPTS
  ;;
esac
```

## Choosing the Ruby API on Install

You can choose which JRuby API to use by default on install or even
reinstall it with the desired option:

```bash
rvm install jruby --1.9 # OR
rvm install jruby --1.8
```

# Community Resources

- [https://www.jruby.org](https://www.jruby.org)
