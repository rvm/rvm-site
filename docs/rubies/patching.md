---
title: "'./patching' - Patching Rubies."
---

.breadcrumbs
  %a{ :href => "/" }
    Documentation
  &nbsp;>&nbsp;
  %a{ :href => "/rubies/" }
    Rubies
  &nbsp;>&nbsp;
  %a{ :href => "/rubies/patching/" }
    Patching
  %hr

%h1 Patching Rubies

%p
  As a side effect of RVM it is very easy to test patches with many versions of ruby.
  %p
    Installing specific rubies with custom ruby source patches
  %pre.code
    :preserve
      $ rvm install 2.1.1 --patch /path/to/awesome.patch
  %p
    Alternatively you can specify more than one patch, they are applied in the order given.
  %pre.code
    :preserve
      $ rvm install 2.1.1 --patch /path/to/awesome.patch,/path/to/another.patch
  %p
    Starting with RVM 1.17 it is also possible to specify an URL to a patch
  %pre.code
    :preserve
      $ rvm install 2.1.1 --patch https://url.to.your/fancy.patch

  %p
    It is also possible to specially name a patched ruby (see
    %a{ :href => "/rubies/named/" }
      Named Rubies
    for more details).
  %pre.code
    :preserve
      $ rvm install 2.1.1-named --patch /path/to/weird.patch

%h1 Contributing patches
%h2 Testing patches
%h3 Functionality improvements

%p
  %p
    Test ruby before patching
  %pre.code
    :preserve
      $ rvm install 2.1.1
      $ ruby your_test.rb #or
      $ ruby -e "puts 'your one line test'"

  %p
    Uninstall previous version before installing with patch
  %pre.code
    :preserve
      $ rvm remove 2.1.1

  %p
    Test ruby after patching
  %pre.code
    :preserve
      $ rvm install 2.1.1 --patch /path/to/awesome.patch
      $ ruby your_test.rb #or
      $ ruby -e "puts 'your one line test'"

%h3 Compilation errors

%p
  %p
    Test ruby after patching
  %pre.code
    :preserve
      $ rvm install 2.1.1 --patch /path/to/compilation.patch
      $ ruby -v

%h2 Contributing patches
%p
  If your patch fixes important issues on old branches like 2.0.0 it can
  be contributed to RVM. Open a pull request at
  %a{:href => "https://github.com/rvm/rvm"} GitHub repository.

%p
  It might appear that your patch is to awesome for everybody and you should keep it as your own vendor extension
  %strong vendor/ruby-patches/my-awesome.patch
  , and always use
  %strong --patch
  option.

%p
  To start you need to fork
  %a{:href => "http://github.com/rvm/rvm"} rvm/rvm
  clone your fork to disk, and add your patch to right directory like:
  %strong patches/ruby/2.0.0/

%p
  Install your version of RVM into system
  %p
    Backup original RVM installation
  %pre.code
    :preserve
      $ mv $HOME/.rvm $HOME/.rvm-backup

  %p
    Install extended RVM (from your checked out fork directory)
  %pre.code
    :preserve
      $ ./install

  %p
    Install ruby which should be automatically patched, test as needed
  %pre.code
    :preserve
      $ rvm install 2.1.1
      $ ruby -v #or
      $ ruby your_test.rb #or
      $ ruby -e "puts 'your one line test'"

  %p
    remove test rvm installation, restore backup
  %pre.code
    :preserve
      $ rm -rf $HOME/.rvm
      $ mv $HOME/.rvm-backup $HOME/.rvm

%p
  When the code is ready and tested:
  %ol
    %li Commit your code, don't miss a thing.
    %li push changes to github.
    %li order a pull request
