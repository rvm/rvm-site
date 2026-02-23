---
title: "Upgrading Rubies"
---

# Upgrading Rubies

Upgrades the specified (already installed) source ruby given to the
given destination ruby version. Will migrate gemsets, wrappers, aliases
and environment files.

The process will prompt you at each stage - if the versions look incorrect,
please cancel and perform it manually.

### Examples

```
$ rvm upgrade 2.1.1 2.1.2
```

Upgrade is easy, but it does all at once, if you need to do it once at a time check out following instructions.

## Copying single gemsets to new ruby

When testing another ruby distribution it is possible to simply copy gemset. Just install new ruby, copy your gemset and test if your application will past all the test you have.

### Examples

```
$ rvm gemset copy 2.1.1@myapplication 2.1.2@myapplication
```

## Manual migration of all gemsets

When there are already two versions installed of ruby, it is possible to migrate gemset from one to another. During migration gems will be copied from first to second and **removed** from first.

An good usecase would be installation of Rubinius or JRuby - just to test them and after being convinced that they work it is possible to migrate all gemsets (applications) to the new ruby of choice.

### Examples

```
$ rvm migrate 2.1.1 jruby-1.7.12
```

## Updating all gemsets

A useful option for those living on the edge. To keep all the installed gems current it is enough to use **rubygems update**, it will take care of updating everything.

### Examples

```
$ rvm gemset update
```
