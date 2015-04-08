---
title: Maintainers needed for RVM 1
created_at: 2015-02-15 21:00:00 +0200
kind: article
author: mpapis
author_full: Michal Papis
tags:
  - news
  - rvm1
  - rvm2
---

# Maintainers needed for RVM 1

I have started changes in my life, you can read more here:
[Changes in my open source life (and RVM 2)](http://niczsoft.com/2015/02/changes-in-my-open-source-life/).
This leads to multiple open source projects that will need help,
I'm still doing minimal work on them, but it will not be enough to keep
them running for longer time. So I need help in maintaining this projects.

<!-- more -->

**I'm looking for people willing to help with handling tickets, building
binaries, supporting the community, if you are interested please mail me
at [mpapis@gmail.com](mailto:mpapis@gmail.com)**.

## RVM 1 projects

Here are all projects related to RVM 1:

1. [RVM 1][1] - the core a shell project that requires attention in fixing compatibility for new ruby releases, new operating systems, fixing bugs.
2. [rvm-capistrano](https://github.com/rvm/rvm-capistrano) - RVM 1 + Capistrano 2 integration, mostly bug fixing
3. [rvm1-capistrano3](https://github.com/rvm/rvm1-capistrano3) - RVM 1 + Capistrano 3 integration, mostly bug fixing
4. [rvm-site](https://github.com/rvm/rvm-site) - https://rvm.io - updating docs, getting into the layout discussions, writing blog posts for version releases
5. [rvm-binary](https://github.com/rvm/rvm-binary) - building of CRuby binaries - this uses [veewee](https://github.com/jedi4ever/veewee) - which also requires maintainer / contributors
6. [rvm-binary-osx](https://github.com/rvm/rvm-binary-osx) - building of binaries for OSX - this usually just works but might require tweaking for new Ruby / OSX versions

Please spread the word, if you know someone interested in open source
with a little time to spare just let them know about [RVM 1][1].

  [1]: https://github.com/rvm/rvm
