---
title: Rubinius (rbx) Ruby
---

# Rubinius

Rubinius is a ruby interpreter written in C++ using many advanced techniques and technologies such as LLVM, a "precise, compacting, generational garbage collector",
a compatible C extension API to standard MRI Ruby, and many other awesome ideas that will give any language-nut a huge nerdon.

### Website

[http://rubini.us/](http://rubini.us/)

### Installing

```bash
$ rvm install rbx
```

Rubinius supports a 1.8 language mode (the default) and a 1.9 mode. You can install with
the 1.9 language mode as the default using the --1.9 option:

```bash
$ rvm install rbx --1.9
```

You might do this if you intend to use 1.9 mode primarily. It is also possible to create
two separate named installs, one for each mode:

```bash
$ rvm install rbx --1.8 -n d18
$ rvm install rbx --1.9 -n d19
```

Rubinius-specific configuration options can be passed following --:

```bash
$ rvm install rbx -- --with-vendor-zlib
```

If you're installing rubinius on Ubuntu, and you find that makeinfo
is missing, you can solve that by installing the texinfo package by:

```bash
$ sudo apt-get install texinfo
```
