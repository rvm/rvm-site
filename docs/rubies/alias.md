---
title: "Naming Rubies with Aliases"
---

# Alias

RVM allows you to alias your rubies for your convenience and pleasure.

## Creating Aliases

First select a RVM ruby.

```
$ rvm alias create php ree-1.8.7-p2010.01
```

## Using Aliases

Now that you have created an alias, you can use the alias in place of the longer rvm selector string.

```
$ rvm use php
$ ruby -v
ruby 1.8.7 (2009-12-24 patchlevel 248) [i686-darwin10.3.0], MBARI 0x6770, Ruby Enterprise Edition 2010.01
```

If you use any aliases that are rather funny, please hop in #rvm and let us know :)

## Deleting Aliases

If you wish to delete an alias

```
$ rvm alias delete dotnet
```

## Listing Aliases

You can also list all current aliases

```
$ rvm alias list
php => ree-1.8.7-p2010.01
lisp => maglev-head
python => rbx-head
```
