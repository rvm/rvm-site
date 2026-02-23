---
title: "Using gemsets"
---

Before you can use a gemset, you must first create it.

```
$ rvm 2.1.1
$ rvm gemset create teddy
```

To use a gemset

```
$ rvm gemset use teddy
```

To stop using the custom gemset (and switch to the default one) use one of the following:

```
$ rvm gemset use default # OR:
$ rvm use @default
```

You can switch to a gemset as you start to use a ruby, by appending @gemsetname to the end of the ruby selector string:

```
$ rvm use 2.1.1@teddy
```

You can also specify a *default* gemset for a given ruby interpreter, by doing:

```
$ rvm use 2.1.1@teddy --default
```

To use a named gemset with an RVM 'do' action, append it to the ruby selector string using a '@'

```
rvm 2.1.1@teddy,ree@teddy,jruby@teddy do rake test
```

If you are aware of where you are at, and wish to fix the gemset, you can do:

```
rvm gemset use teddy
rvm 2.1.1,ree,jruby do rake --sticky test
```

If you would like to create gemsets automatically when used, export this flag in your ~/.rvmrc file:

```
rvm_gemset_create_on_use_flag=1
```
