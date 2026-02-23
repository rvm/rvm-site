---
title: Upgrading RVM
---

# Upgrading RVM

RVM supports few ways of upgrading itself.

Every month or two a **stable** release of RVM is created, it includes minor version increase. Between releases only bugfixes and ruby version updates are added to it with teeny version update. Normal development and major changes continue on the master branch to install it use **head** version. It's important to use head version before reporting errors as those could be already fixed.

### To upgrade to the most stable version

```
$ rvm get stable
```

installs the stable version.

### To upgrade to the most stable version from VERY OLD versions (e.g. 1.9.2)

Is **rvm get stable** not working? Is **rvm get latest** telling you **"You already have the latest version!"**, but you know you don't? Try this:

```
$ rvm get head
$ rvm reload
$ rvm get stable
```

If that does not work for you, you can always use the installer to update:

```
$ \curl -sSL https://get.rvm.io | bash -s stable
$ rvm reload
```

### Upgrading to the latest repository source version (the most bugfixes)

```
$ rvm get head
```

obtains the latest RVM repository version.

### The installer is also able to update RVM

```
$ \curl -sSL https://get.rvm.io | bash -s stable # update to stable
$ \curl -sSL https://get.rvm.io | bash -s head   # update to head
$ rvm reload
```

Yes, there's a backslash before the **curl**. It is important to reload after using installer for update.

### Auto update sourcing line

```
$ rvm get stable --auto
```

by using the auto flag RVM will know to update the user configuration files to the best known way of sourcing RVM.

### Latest

In early days RVM was developed only on master branch, versions were released to RVM server and when version was bug free the **latest** file was updated to point to it. This has changed, as mentioned above RVM stable is released and only bugfixes / ruby version updates are applied to it. The current equivalent of **latest** is **stable** and should be used **instead.** When updating very old versions **head** should be used and can be followed by **stable.**

### Upgrading to someones else forked branch

```
$ rvm get branch [owner/][branch]
```

obtains the given branch possibly from the given owner, examples:

```
$ rvm get branch shoes        # shoes  branch from wayneeseguin rvm repository
$ rvm get branch mpapis/      # master branch from mpapis rvm repository
$ rvm get branch mpapis/shoes # shoes  branch from mpapis rvm repository
```

### Overriding default and global gemsets

```
rvm get head --without-gems="rvm bundler rubygems-bundler" --with-gems="hirb" --with-default-gems="rails haml"
```

will remove the gems rvm, bundler and rubygems-bundler from global.gems, will add hirb to global gems and will add rails and haml to default.gems.

After updating RVM, you may be also interested in [Upgrading Rubies](/rubies/upgrading/).
