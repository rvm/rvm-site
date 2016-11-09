---
title: Simple Terminal (ST) Integration with RVM
---

Simple Terminal (ST)
=======

## Enabling Login Terminal

[Simple Terminal](http://st.suckless.org/) integrates settings
during compilation, so it does not use any external configuration.
Login shell can be set at run time by adding the `-e` argument:

    $ st -e /bin/bash --login

This also works with any other shell that supports it:

    $ st -e /bin/zsh --login

## Window Manager Integration

To make this more seamless, you can set this as the default command in your
window manager.

### i3

i3 uses a config file to set the terminal emulator.
(This is typically stored at `~/.config/i3/config`.)
To start all terminals with login shell enabled, set with a command
similar to this:

    # start a terminal
    bindsym $mod+Return exec st -e /bin/zsh --login # i3-sensible-terminal
