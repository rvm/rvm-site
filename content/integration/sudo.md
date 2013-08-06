---
title: Sudo Integration with RVM
---

Sudo
====

Sudo is a program for Unix-like computer operating systems that allows users to run programs with the security privileges of another user (normally the superuser, or root). Its name is a concatenation of the su command (which grants the user a shell of another user, normally the superuser) and "do", or take action.

By default, when you use `sudo` your current shell environment is not passed through to the session created by it, but RVM already allows for easier access to sudo calls with `rvmsudo`. However, sudo's defaults are very strict and you might end up getting password prompts on commands that are set to use the sudo NOPASSWD directive.

<h2 id="sudo-settings">Changing sudo's strict defaults</h2>

There are 3 things needed to mitigate this situation if you encounter it:

* the user that is invoking sudo must have `export rvmsudo_secure_path=0` set on his shell environment (think .bashrc, .bash_profile or .zshrc)
* comment out `Defaults secure_path=...` on /etc/sudoers
* add `Defaults env_keep +="rvm_bin_path GEM_HOME IRBRC MY_RUBY_HOME`
` rvm_path rvm_prefix rvm_version GEM_PATH rvmsudo_secure_path RUBY_VERSION rvm_ruby_string rvm_delete_flag"` to /etc/sudoers

After these changes, you should be able to use `rvmsudo` preserving the same password/no-password directives as "normal" sudo calls.

### Community Resources

* You can learn more about sudo at the [official website](http://www.sudo.ws/)
