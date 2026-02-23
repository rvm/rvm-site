---
title: "Installing Rubies"
---

# Installing Rubies

Official ruby interpreter releases that are supported by RVM can be installed using any of the below methods.

## Known Rubies (Interpreters)

RVM maintains a list of interpreters and versions thereof to which it may install.
In order to see this list run the following command.

```
$ rvm list known
```

Please note that RVM is not limited to simply this list.

## Automatic dependencies installation

When installing rubies, RVM might need to use sudo to install dependencies. Make sure that user, who calls RVM commands, have sudo rights.

If you want to be able to run RVM commands by the user who does not have sudo rights, you would need to turn off automatic dependency installation:

```
rvm autolibs disable
```

It would mean though, that you have to manage dependencies manually.

## Quick Install

Install ruby (follow the instructions):

```bash
$ rvm install 2.1.1
```

You can also:

- watch the most accurate (but not official) [rvm screencast](https://www.youtube.com/watch?v=cQVb7fHFjSM)
- starting with Rails? watch the [RailsCasts.com on Getting Started with Rails](http://railscasts.com/episodes/310-getting-started-with-rails)

## Automated installation

RVM allows two basic modes of operation interactive and non interactive.
In interactive mode RVM is sourced as a function and is intended to interact with environment.
In non interactive mode RVM is only added to PATH and can not interact with the environment.
Because the interactive mode is intended mostly for use by users it also will display additional
information and dialogs. To avoid this do not source rvm as a function or fallback to using binary
with one of the following methods:

```bash
$ /full/path/to/rvm/bin/rvm install 2.1.1
```

OR:

```bash
$ command rvm install 2.1.1
```

## Patch Levels

Installing specific ruby patch levels (official releases)

# Patch Levels with RVM

For each C-based interpreter, you can also specify a patchlevel using the '-l' or '--level' options.
Each interpreter defaults to the latest patchlevel known to RVM.
For example, RVM (as of this writing) defaults ruby 1.8.7 to patchlevel 352.
If you wanted to switch to patchlevel 160 to test something out you can easily do that by:

```
$ rvm install 2.1.1

Installing Ruby from source to: ...

$ ruby -v

ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-darwin12.0]
```

which will download, compile and install ruby-2.1.1 and then set it to current.
Switching between patchlevels is very easy:

```
$ rvm ruby-2.0.0-p451

Switching to ruby 2.0.0-p451 ...

$ rvm ruby-2.0.0-p481

Switching to ruby 2.0.0-p481 ...
```

Don't forget about the shorthand due to defaults. The above is equivalent to

```
$ rvm 2.0.0-p451    # same as: rvm ruby-2.0.0-p451
$ rvm 2.0.0-p481    # same as: rvm ruby-2.0.0-p481
```

## Getting the Latest and Greatest

You can get the head/trunk version of any given ruby as follows.

For any interpreter which has '-head' support, postfix '-head' after the
interpreter name. For example, in order to install the latest development
trunk for ruby 2.1:

```
$ rvm install ruby-2.1-head
$ rvm use ruby-2.1-head
```

# Install on Use

If you would like RVM to automatically install a ruby when you *use* it, add the following flag to your rvmrc file:

```
$ cat $HOME/.rvmrc
rvm_install_on_use_flag=1
```

# Configure flags

Configure script flags can be passed by a comma-separated list with no spaces after -C, like so:

```
$ rvm install 2.1.1 -C --enable-shared,--with-readline-dir=$HOME/.rvm/usr
```

# Compile Flags

If you need to pass compile flags for the compile process, just set the
corresponding environment variables.

As an example, to enable gdb for ruby 2.1.1:

```
$ export optflags="-O0 -ggdb"
$ rvm install 2.1.1
```

# Static MRI

If you wish to compile an MRI Ruby (1.9/2.0/2.1) as statically-linked instead
of dynamically, then pass the --static flag like so:

```
$ rvm --static install 2.1.1
```

# Generating Documentation

In order to conserve space, RVM does not automatically generate and install
each Ruby's ri / rdoc documentation. To generate this documentation for Ruby
please execute the following command:

```
$ rvm docs generate all
```

Please note that this requires the extracted source for the currently selected
Ruby version be on the system ($rvm_path/src/<ruby_version>) so the best time
to execute this command is immediately after installation of that version.

Provided you have not cleaned up the extracted sources for all currently
installed Rubies by executing 'rvm cleanup all' then you can install the docs
for all currently installed Rubies by executing:

```
$ rvm all do rvm docs generate all
```

If you have executed a cleanup, unfortunately, this means to regenerate the
documentation you would need to run, for example,:

```
$ rvm reinstall 2.1.1 && rvm docs generate all
```

As always, don't forget to pass whatever additional parameters such as --patch
to the reinstall portion of the command that you initially used, if any.

For more information, please see

```
$ rvm help docs
```
