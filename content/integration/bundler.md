---
title: Bundler Integration with RVM
---

Bundler
=======

There is no need to do anything to make bundler work with RVM, but there is one thing about bundler that makes it harder to use. By default, bundler does not generate wrappers for gem binaries. To make use of the proper version of a gem binary, users are forced to prefix every command with `bundle exec`. This makes working in the console rather painful. Fortunately, there are solutions that allow us to just write binary names; the binary from 'gem' specified in the Gemfile will be used.

1. [rubygems-bundler gem](#rubygems-bundler)
2. [RVM cd hook](#cd-hook)
3. [Global executables](#global-executables)
4. [Rubygems 2.0](https://coderwall.com/p/html5w)

<h2 id="rubygems-bundler">rubygems-bundler gem (default from rvm 1.11.0)</h2>

One of the solutions for this problem is a gem which makes bundler and rubygems generate binary wrappers that are aware of bundler. Michal Papis is working with bundler and rubygems team to integrate this gem so that no extra actions would be needed to avoid `bundle exec`.

Starting with 1.11.0 new RVM installations has it enabled by default, you can still install it with:

    gem install rubygems-bundler

For more information visit [rubygems-bundler @ github](https://github.com/mpapis/rubygems-bundler).
When this gem is already installed here is basic instruction:

To make all the executables bundler compatible run:

    gem regenerate_binstubs # only once

To prevent loading `bundle exec`:

    NOEXEC_DISABLE=1 rake ...

For more information read: [https://github.com/mpapis/rubygems-bundler](https://github.com/mpapis/rubygems-bundler)

You can add/remove installation of this gem from default by adding/removing the line

    rubygems-bundler

in this files in:

* `$rvm_path/gemsets/default.gems`
* `$rvm_path/gemsets/global.gems`

<h2 id="cd-hook">RVM hook</h2>

Thanks to Rick DeNatale, we now have a hook that automatically will append `BUNDLE_BIN` path to the `PATH` when changing directories.

Enabling hook

    rvm get head && rvm reload
    chmod +x $rvm_path/hooks/after_cd_bundler

Generating bundler stubs (binaries wrappers)

    cd /path/to/project
    bundle install --binstubs=./bundler_stubs

From now on, any project which was generated this way will automatically add `$PWD/bundler_stubs` to the `PATH`.

<h2 id="global-executables">Global executables</h2>

Install all executables into single location

    bundle config bin ~/.bundler_binstubs --global

And add it to `PATH`:

    export PATH=~/.bundler_binstubs:PATh

### Community Resources

* You can read bundler's README at [GitHub](http://github.com/carlhuda/bundler)
