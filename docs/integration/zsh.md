---
title: ZSH Integration with RVM.
---

# Zsh

RVM requires:

- The use of globs that can possible be empty (no matches). If you experience glob problems try setting 'setopt nullglob' in your zsh profiles.
- Shell regex support via the operator =~. =~ appeared first in 4.3.5, (it was added in [zsh-workers-23375](http://www.zsh.org/mla/workers/2007/msg00296.html).)

How can I tell if my version of zsh supports =~ ?

```bash
$ foo=baaaar; [[ $foo =~ ba*r ]] && echo "Your shell supports the =~ regex operator." || echo "Your shell does not support the =~ regex operator."
Your shell supports the =~ regex operator.
$ zsh --version
zsh 4.3.5
```

```bash
$ foo=baaaar; [[ $foo =~ ba*r ]] && echo "Your shell supports the =~ regex operator." || echo "I like sheep, they are soft and fluffy..."
zsh: condition expected: =~
$ zsh --version
zsh 4.3.4
```

How can I upgrade my zsh version?

```bash
version="4.3.10" ; mkdir -p ~/.src && cd ~/.src && \curl -O -L --create-dirs -C - http://downloads.sourceforge.net/project/zsh/zsh-dev/$version/zsh-$version.tar.bz2?use_mirror=voxel && tar jxf zsh-$version.tar.bz2* && cd zsh-$version && ./configure --prefix=/ && make && sudo make install
```

If you're using zsh (possibly with oh-my-zsh) and your prompt displays the current directory as "~rvm_rvmrc_cwd",
the fix to add the following to your shell file before sourcing rvm:

```bash
unsetopt auto_name_dirs
```

If you are using oh-my-zsh and you see something like this error:

```
pwd:4: too many arguments
```

This is caused by an alias and due to the sh style sourcing of a script using the '.' operator instead of 'source'. The alias looks like this:

```bash
# .oh-my-zsh/lib/aliases.zsh
alias .='pwd'
```

To avoid this either remove/comment the alias and/or escape the '.' to bypass the alias like so:

```bash
\. /file/being/sourced
```

The latest RVM HEAD properly escapes the sourcing '.' so this should no longer be an issue. Update (rvm get head) if you see this issue related to RVM scripts.

## zsh + iTerm

Open iTerm Preferences **Command+,**

Navigate to preferences

If there is no profile for ZSH, create one.

Set Command: to **Login shell**

Reload iTerm

If you are still getting **rvm is not a function** errors on iTerm, try:

```bash
rvm get stable --auto-dotfiles
```

## zsh + oh my zsh

If you want to use oh my zsh be sure not to use the bundler package. If rvm should take care of everything this would do for you anyways.
