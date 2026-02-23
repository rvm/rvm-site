---
title: Using xterm with RVM
---

# Integrating RVM with xterm

If you are going to use multi-user RVM installation with xterm, you'll probably need to change it's default options.

Multi-user RVM creates a script in /etc/profile.d, which is being sourced on startup. By default, xterm runs bash as usual, non-login shell, therefore skipping /etc/profile* and executing only ~/.bashrc

For RVM to work properly, you have to set 'xterm*loginShell: true' in your $HOME/.Xdefaults file and execute 'xrdb $HOME/.Xdefaults', or execute 'xterm -ls' which makes xterm launch as a login shell.

Read the explanation of what [Shell login](/support/faq/#shell_login) means if in doubt or advised by other sites to not use it.
