---
title: "Using gnome-terminal with rvm"
---

Integrating RVM with gnome-terminal
===================================

If you are going to use RVM installations with gnome-terminal, you'll probably need to change it's  default options.

Multi-User RVM creates a script in /etc/profile.d, which is being sourced on startup. Also, most people put the RVM sourcing line required to load RVM in their ~/.bash_profile for Single-User installs. By default, gnome-terminal runs Bash as usual, as a non-login shell, therefore skipping /etc/profile* and executing only the user's ~/.bashrc. This means that RVM doesn't load and you get the infamous 'RVM is not a function' message.

For RVM to work properly, you have to set the 'Run command as login shell' checkbox on the Title and Command tab inside of gnome-terminal's Settings page. Like this:

![Gnome Screenshot](/images/Title_and_Command.jpg)

For more information on what this means, please read the explanation regarding [Shell logins](/support/faq/#shell_login) especially if you are in doubt, or advised by other sites to not use it.