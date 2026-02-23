---
title: "Creating gemsets"
---

# Creating gemsets

Gemsets must be created before being used.
To create a new gemset for the current ruby, do this:

```
$ rvm 2.1.1
$ rvm gemset create teddy
Gemset 'teddy' created.
```

You can also create multiple gemsets in a single command.

```
$ rvm 2.1.1
$ rvm gemset create teddy rosie
Gemset 'teddy' created.
Gemset 'rosie' created.
```

Alternatively, if you prefer the shorthand syntax
offered by rvm use, employ the --create option
like so:

```bash
$ rvm use 2.1.1@teddy --create
```

If you would like to create gemsets automatically when used, export this flag in your ~/.rvmrc or /etc/rvmrc file:

```
rvm_gemset_create_on_use_flag=1
```
