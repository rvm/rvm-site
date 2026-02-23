---
title: "Importing gemsets"
---

### Importing a gemset

To import a gemset file called 'teddy.gems' to the teddy gemset of 2.1.1 do

```
$ rvm --create 2.1.1@teddy # The --create creates the gemset if it does not exist
$ rvm gemset import teddy
```

Note that you can use any gemset name to import into.

You can specify the gemset filename prefix also

```
$ rvm gemset use teddy
$ rvm gemset import teddy
```

Alternatively, if you already have a ruby and/or gemset selected:

```
$ rvm 2.1.1@teddy
$ rvm gemset import
```

Importing without arguments will check for gemset files in the following order:

- A gemset file with the current gemset name prefix in the current directory
- RVM then checks for 'default.gems' in the current directory
- Next RVM looks for a 'system.gems' in the current directory.
- Finally RVM looks for a '.gems' file in the current directory

gemset files have the following format, particularly for denoting versions:

```
fastercsv
rails -v4.1.0
rake
tzinfo -v0.3.27
```

You might also be interested in [Copying](/gemsets/copying/) gemsets from one rvm ruby[@gemset] to another.
