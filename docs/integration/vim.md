---
title: Using vim with rvm
---

# Integrating rvm with vim

If you wish to add rvm information to your vim status line, check out
[rvm.vim](https://github.com/tpope/vim-rvm).

## MacVim with rvm rubies.

If you wish to use MacVim with a rvm ruby, you'll have to build
MacVim from source after applying the patch located
[here](http://gist.github.com/398996).

Thanks to Michael Shapiro for providing this patch.

### MacVim, ZSH and rvm rubies.

If you are using ZSH you may find that MacVim is not loading your rvm configuration
correctly. This may be because you are sourcing the rvm scripts in your .zshrc
file.

MacVim does not source the .zshrc file, but will source the .zshenv file. To ensure
that MacVim correctly loads rvm for its shell, and running ruby commands, source
the rvm scripts from within .zshenv.

Alternatively, you can add:

```
set shell=/bin/sh
```

to your .vimrc, and ensure vim always runs from a shell, and ensure you source
rvm from within your .profile file.

Thanks to [Henry Poydar](http://github.com/henrypoydar) for finding this
[blog post](http://gabebw.wordpress.com/2010/08/02/rails-vim-rvm-and-a-curious-infuriating-bug/)
