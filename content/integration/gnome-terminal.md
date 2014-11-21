---
title: "Using gnome-terminal with rvm"
---

Other terminals: [LXTerminal](/integration/lxterminal/),
[XTerm](/integration/xterm/), [Konsole](/integration/konsole/),
[Zsh + iTerm](/integration/zsh/#zsh-iterm) and
[anything else](/integration/).

Integrating RVM with gnome-terminal
===================================

If you are going to use RVM installations with gnome-terminal, you'll
probably need to change its default options.  Note that Ubuntu's and
Linux Mint Terminal application is actually `gnome-terminal`.

Multi-User RVM creates a script in `/etc/profile.d`, which is being
sourced on startup. Also, most people put the RVM sourcing line required
to load RVM in their `~/.bash_profile` for Single-User installs. By
default, gnome-terminal runs Bash as usual, as a non-login shell,
therefore skipping `/etc/profile*` and executing only the user's
`~/.bashrc`. This means that RVM doesn't load and you get the infamous
**'RVM is not a function'** message.

For RVM to work properly, you have to check the **'Run command as login
shell'** checkbox on the `Title and Command` tab of `gnome-terminal`'s
`Edit ▸ Profile Preferences` menu dialog, in case the menu is missing
right click the terminal app and navigate `Profiles ▸ Profile Preferences`.

Here is a screen shoot of the dialog with highlighted `checkbox`:

![Gnome Screenshot](/images/Title_and_Command.jpg)

For more information on what this means, please read the explanation
regarding [Shell logins](/support/faq/#shell_login) especially if you
are in doubt, or advised by other sites to not use it.
