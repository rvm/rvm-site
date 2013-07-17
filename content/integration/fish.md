---
title: Fish Shell Integration with RVM
---
  
Fish Shell
==========

Since RVM is a large collection of bash scripts and fish is not bash-compatible, users of fish need a wrapper around RVM to make it work properly with that shell. Since RVM just manipulates environment variables, we just need a way to preserve those changes.

Please note that better fish support (although not native) is expected in the future.

Install
-------

[Install RVM](/rvm/install/) as you would for use with bash. When running the `rvm-install` command, feel free to ignore the advice under the "You must now finish the install manually" section.

Setup
-----

Download the fish functions from GitHub, the first a utility function to capture the changes to environment variables, the second a wrapper around RVM for fish.

    set -l GITHUB https://raw.github.com/lunks/fish-nuggets/master/functions
    \curl --create-dirs -o ~/.config/fish/functions/rvm.fish $GITHUB/rvm.fish
    \curl -o ~/.config/fish/functions/cd.fish $GITHUB/cd.fish

Note the backslash before **curl**.

Usage
-----
Use RVM just as you would in bash or zsh as per the instructions on the website, converting any bashisms to fish as needed.

