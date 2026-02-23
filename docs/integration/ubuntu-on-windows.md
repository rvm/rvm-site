---
title: "Using RVM in bash for Ubuntu on Windows"
---

Using RVM in bash for Ubuntu on Windows
===================================

RVM creates a script in `/etc/profile.d`, which is being sourced on startup. Also, most people put the RVM sourcing line required to load RVM in their `~/.bash_profile`. Ubuntu on Windows
runs Bash as a non-login shell, therefore skipping `/etc/profile*` and executing only the user's
`~/.bashrc`. This means that RVM doesn't load.

For RVM to work properly, you have to add it to the `~/.bashrc` depending on the type of your installation:

* single-user installed in `~/.rvm/`

        echo 'source ~/.rvm/scripts/rvm' >> ~/.bashrc
    
* multi-user installed in `/usr/local/rvm`

        echo 'source /usr/local/rvm/scripts/rvm' >> ~/.bashrc

From this time it should work fine whenever you open the new bash terminal.
