---
title: Integration with chruby
---

# chruby integration

One of basic RVM functionalities is to install rubies - chruby does not provide this function.
Users can use [chruby](https://github.com/postmodern/chruby) for switching rubies and
[RVM](https://github.com/rvm/rvm) for installing rubies.

## Install chruby

Follow instructions for chruby project: https://github.com/postmodern/chruby#install

## Install RVM

    curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles

## Integrate RVM

Right where chruby is sourced add a line to source RVMs integration:

    source /usr/local/share/chruby/chruby.sh
    source ~/.rvm/scripts/extras/chruby.sh

# Usage

To avoid confusion with full version of RVM the integration is called `mrvm` which stands for mini RVM.
You can use it the same way as you would use `rvm`:

    mrvm list known
    mrvm install 1.9.3
    mrvm remove 1.8.7
    mrvm upgrade 1.9.3 2.0.0

The differences between `rvm` and `mrvm` are:

1. `mrvm use` will not work,
2. every call to `mrvm` will refresh `RUBIES` to include **only** RVM installed rubies.

## Issues

Please report bugs / problems / issues to https://github.com/rvm/rvm/issues
