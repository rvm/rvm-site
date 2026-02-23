---
title: "Listing gemsets"
---

To see the name of the current gemset

```
$ rvm gemset use teddy
$ rvm gemset name
teddy
```

To list the full directory path for the current gemset:

```
$ rvm gemdir
/Users/rys/.rvm/gems/2.1.1@teddy
```

To list all named gemsets for the current ruby interpreter

```
$ rvm gemset list

 global
 teddy
```

To list all named gemsets for all interpreters

```
$ rvm gemset list_all
```

Looking for knowing where you are at? See [rvm-prompt](/workflow/prompt/)
