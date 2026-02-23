---
title: "Gemset initialization in RVM"
---

# Initializing Gemsets during Ruby Installs

When you install a new ruby, RVM not only creates two gemsets (the default, empty gemset
and the global gemset), it also uses a set of user-editable files to determine which
gems to install.

Working in ~/.rvm/gemsets, rvm searchs for global.gems and default.gems using a tree-hierachy
based on the ruby string being installed. Using the example of ree-1.8.7-p2010.02, rvm will
check (and import from) the following files:

- ~/.rvm/gemsets/ree/1.8.7/p2010.02/global.gems
- ~/.rvm/gemsets/ree/1.8.7/p2010.02/default.gems
- ~/.rvm/gemsets/ree/1.8.7/global.gems
- ~/.rvm/gemsets/ree/1.8.7/default.gems
- ~/.rvm/gemsets/ree/global.gems
- ~/.rvm/gemsets/ree/default.gems
- ~/.rvm/gemsets/global.gems
- ~/.rvm/gemsets/default.gems

For example, if you edited ~/.rvm/gemsets/global.gems by adding these two lines:

```
bundler
awesome_print
```

every time you install a new ruby, these two gems are installed into your global gemset.

Using the default or global gemsets, you can also make RVM include a specific version of a given gem. Here's how:

```
bundler -v~>1.0.0
awesome_print
hirb -v0.4.5
```

By default, rvm uses these gemsets to install common libraries (such as rake, and in the case of jruby, jruby-openssl.)

### Warning

default.gems and global.gems files are usually overwritten during update of rvm (rvm get ...).

It is however possible to override this behavior by either
[using after_install hook](/workflow/hooks/) or overriding with --with-default-gems/--with-gems flags during
[install](/rvm/install/) / [upgrade](/rvm/upgrading/).
