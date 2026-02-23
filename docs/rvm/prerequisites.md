---
title: Prerequisites
---

# RVM Prerequisites

Most of the requirements below are met by standard Linux distributions.

---

RVM uses the following standard GNU tools (some of which are built-in functions to Bash):

- bash (>= 3.2.25 for bash 3 or >= 4.2 otherwise)
- awk
- sed
- grep
- which
- ls
- cp
- tar
- curl
- gunzip
- bunzip2

**Please note that RVM requires Bash, not SH, as it makes use of multiple Bash-isms that the SH shell does not support.**

RVM also requires the following libraries for installing '-head' rubies. (e.g 'rvm install 1.9.3-head')

- git (>= 1.7.6)

If you want to use RVM under Zsh, you will need a version between 4.3.5 and 4.3.12 or >= 5.0.0. Please note Zsh 4.3.15 is buggy! Be careful with it as it can break RVM; especially Multi-User installations.

NOTE: For a quick and dirty way to find out if you have these programs and where they are, copy and paste the following code into your shell. This works in both Zsh and Bash so you can copy and paste with no worries.

```
for name in {bash,awk,sed,grep,ls,cp,tar,curl,gunzip,bunzip2,git,svn} ; do which $name ;  done
```
