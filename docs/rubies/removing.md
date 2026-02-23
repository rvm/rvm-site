---
title: "Removing Rubies"
---

# Removing Rubies

There are two ways to remove rubies from rvm:

- rvm remove # Removes the ruby, source files and optional gemsets / archives
- rvm uninstall # Just removes the ruby - leaves everything else

## rvm remove

rvm remove is the preferred way of removing rubies from rvm. By default, not only
will it remove the ruby and it's source files, it will also get rid of aliases,
wrappers, environments and any associated binaries - in other words, it cleans up most
of the install.

Optionally, it accepts the --archive flag to remove the downloaded archive
and --gems to get rid of all associated gemsets.

As an example, to remove rubinius 1.0.0, you could do:

```
$ rvm remove rbx-1.0.0

info: Removing /Users/sutto/.rvm/src/rbx-1.0.0-20100514...

info: Removing /Users/sutto/.rvm/rubies/rbx-1.0.0-20100514...

info: Removing rbx-1.0.0-20100514 aliases...

info: Removing rbx-1.0.0-20100514 wrappers...

info: Removing rbx-1.0.0-20100514 environments...

info: Removing rbx-1.0.0-20100514 binaries...
```

## rvm uninstall

For the most basic case (e.g. you want to try clearing out a bad install), rvm uninstall
literally just removes the folder under ~/.rvm/rubies. In most cases, you should instead
use rvm remove.

You can uninstall one or many rubies. If you're using many, please ensure you separate
the ruby string with a comma, e.g.:

```
$ rvm uninstall ree,1.8.7
```

Removing a ruby removes both the install and the source.
