---
title: "Contributing to the RVM project"
---

# Contributing to RVM

So, you want to contribute to rvm? Excellent! We can always do with
an extra helping hand (or two). If you're not a great coder, we always
appreciate people helping out in the channel, and giving support. If you
are interested in coding, there are a few things you'll need to know - and
a few things that make the process in general a lot smoother.

We also greatly appreciate documentation patches, submitted from the rvm-site repository.

## General Guidelines

1. Read the [How to hack on RVM](https://github.com/rvm/rvm/blob/master/HACKING.md) guide. It explains how to setup a second copy of RVM to allow you to hack without disturbing your primary RVM installation and how to use the RVM test suite.

2. When contributing, either keep patches small and clear, or work on a topic branch - this makes it easier for us to merge in discrete changes, and means you always keep things separate where needed.

3. The code has to be compatible with bash, and takes an almost git-like design architecturally. Many actions (e.g. aliases) call out to a script in the ~/.rvm/scripts directory. For an example of the new, simplified style for coding these, make sure you check out:

   - scripts/snapshot
   - scripts/repair
   - scripts/tools

4. *Clean* code is preferred - if in doubt, take a look back, and refactor.

5. If you're interested in helping out, but don't have something specific in mind, check out the project's [GitHub Issues](https://github.com/rvm/rvm/issues).

## Handy Tips

1. Generally, working in a clone of the repository is by far the best way to go. When you need to test out something on a fresh install, install a new RVM to a separate path, then use `rvm switch ...` to use it. This is discussed in the [hacking guide](https://github.com/rvm/rvm/blob/master/HACKING.md).

   ```
   $ ./install --path $HOME/.rvm-dev
   $ rvm switch $HOME/.rvm-dev
   ```

2. It helps to use bash as your primary shell, but for some features you'll want to have zsh installed as well, to ensure compatibility.

## Repositories

- **Main RVM Repository:** [rvm/rvm](http://github.com/rvm/rvm)
- **RVM Website:** [rvm/rvm-site](http://github.com/rvm/rvm-site)
