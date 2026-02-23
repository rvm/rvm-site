---
title: "Patching Rubies"
---

# Patching Rubies

As a side effect of RVM it is very easy to test patches with many versions of ruby.

Installing specific rubies with custom ruby source patches

```
$ rvm install 2.1.1 --patch /path/to/awesome.patch
```

Alternatively you can specify more than one patch, they are applied in the order given.

```
$ rvm install 2.1.1 --patch /path/to/awesome.patch,/path/to/another.patch
```

Starting with RVM 1.17 it is also possible to specify an URL to a patch

```
$ rvm install 2.1.1 --patch https://url.to.your/fancy.patch
```

It is also possible to specially name a patched ruby (see
[Named Rubies](/rubies/named/) for more details).

```
$ rvm install 2.1.1-named --patch /path/to/weird.patch
```

# Contributing patches

## Testing patches

### Functionality improvements

Test ruby before patching

```
$ rvm install 2.1.1
$ ruby your_test.rb #or
$ ruby -e "puts 'your one line test'"
```

Uninstall previous version before installing with patch

```
$ rvm remove 2.1.1
```

Test ruby after patching

```
$ rvm install 2.1.1 --patch /path/to/awesome.patch
$ ruby your_test.rb #or
$ ruby -e "puts 'your one line test'"
```

### Compilation errors

Test ruby after patching

```
$ rvm install 2.1.1 --patch /path/to/compilation.patch
$ ruby -v
```

## Contributing patches

If your patch fixes important issues on old branches like 2.0.0 it can
be contributed to RVM. Open a pull request at
[GitHub repository](https://github.com/rvm/rvm).

It might appear that your patch is to awesome for everybody and you should keep it as your own vendor extension
**vendor/ruby-patches/my-awesome.patch**, and always use
**--patch** option.

To start you need to fork
[rvm/rvm](http://github.com/rvm/rvm)
clone your fork to disk, and add your patch to right directory like:
**patches/ruby/2.0.0/**

Install your version of RVM into system

Backup original RVM installation

```
$ mv $HOME/.rvm $HOME/.rvm-backup
```

Install extended RVM (from your checked out fork directory)

```
$ ./install
```

Install ruby which should be automatically patched, test as needed

```
$ rvm install 2.1.1
$ ruby -v #or
$ ruby your_test.rb #or
$ ruby -e "puts 'your one line test'"
```

remove test rvm installation, restore backup

```
$ rm -rf $HOME/.rvm
$ mv $HOME/.rvm-backup $HOME/.rvm
```

When the code is ready and tested:

1. Commit your code, don't miss a thing.
2. push changes to github.
3. order a pull request
