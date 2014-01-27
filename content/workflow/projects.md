---
title: "Typical RVM Project Workflow"
---

# Typical RVM Project Workflow

RVM supports multiple files allowing to configure project for automated ruby switching.
In any case make sure to add those files to your version control systems
as it is part of project configuration.

## Supported files

Listed in order of precedence:

- `.rvmrc`         - shell script allowing full customization of the environment,
- `.versions.conf` - `key=value` configuration file
- `.ruby-version`  - single line `ruby-version` only
- `Gemfile`"       - comment: `#ruby=1.9.3` and directive: `ruby "1.9.3"`

Notes:

- only `.rvmrc` will work in all RVM versions, the other files were introduced in RVM `1.11.0`,
- environment switching is supported since RVM `1.22.0`.

## Project file `.rvmrc`

This is first supported format and has precedence over any other files.
`.rvmrc` has one major flaw - it requires trusting to prevent execution of unauthorized code,
this makes it hard to use and complicates deployment to production.
In cases when scripting is not required use of other project files is encouraged.

Generating simple `.rvmrc`:

    echo 'rvm --create use ree@tedxperth' > .rvmrc

A more complex version:

    rvm --create use ree@tedxperth --rvmrc

The file can be edited to provide extra customizations.

To trust the file:

    rvm rvmrc trust /path/to/project

## Project file `.ruby-version`

This file is supported also by [chruby](https://github.com/postmodern/chruby#readme)
and [rbenv](https://github.com/sstephenson/rbenv#readme).
`.ruby-version` is just ruby name so it does not require trusting and is simpler in use then `.rvmrc`.

Generating `.ruby-version`:

    echo 1.9.3 > .ruby-version   # OR:
    rvm --ruby-version use 1.9.3

When in RVM `.ruby-version` supports also gemsets in form `ruby@gemset`
but this is not compatible with other Ruby Versions Managers.
Another file might be used to specify gemset without breaking compatibility - `.ruby-gemset`.

Generating `.ruby-gemset`:

    echo my_app > .ruby-version         # OR:
    rvm --ruby-version use 1.9.3@my_app

The second form will create both `.ruby-version` and `.ruby-gemset`.

Some projects require extra configuration in environment this is supported using `.ruby-env` file.

    echo "JRUBY_OPTS=--1.9" >> .ruby-env

This will be set when entering project directory
and previous value will be reverted when exiting project directory.

Note following files are also supported: `.rbenv-version` and `.rbenv-vars`, `.rbfu-version`,
they have lower precedence then `.ruby-version`.

## Project file `.versions.conf`

For more advanced projects `.versions.conf` is supported where more then ruby version can be specified.

Generating `.versions.conf`:

    rvm --create --versions-conf use 1.9.3@my_app

Example `.versions.conf`:

    ruby=jruby-1.6.8
    ruby-gemset=my_app
    env-JRUBY_OPTS=--1.9

## Project file `Gemfile`

`Gemfile`s `ruby` directive is supported and will be read by RVM.

Example `Gemfile`

    ruby "1.9.3"
    gem  "haml"

In case it is not possible to use the `ruby` directive or when more fine grained
version is required following comments will take precedence over the directive:

    #ruby=jruby-1.6.8
    #ruby-gemset=my_app
    #ruby-env-JRUBY_OPTS=--1.9

Another example, using MRI Ruby at a specific patch level:

    #ruby=ruby-1.9.3-p194
    #ruby-gemset=my_app

Comments are preferred as older versions of `bundler` did not support the directive.

## RVM configuration

Those variables can be set in `~/.rvmrc` and `/etc/rvmrc`:

- `rvm_project_rvmrc_default=1`    - Prefer default ruby when project file not found in current directory,
- `rvm_autoinstall_bundler_flag=1` - Install `bundler` gem and run `bundle install` if `Gemfile` available.

# Community resources

- [A Common .ruby-version File For Ruby Projects](https://gist.github.com/1912050) by [Fletcher Nichol](https://github.com/fnichol)
