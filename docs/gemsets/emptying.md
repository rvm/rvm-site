---
title: "Emptying gemsets"
---

If you empty a gemset, rvm will prompt you for confirmation.
This action removes all gems installed in the gemset.

```
$ rvm gemset use albinochipmunk
$ rvm gemset empty albinochipmunk
```

To skip confirmation, pass the --force flag:

```
$ rvm gemset use albinochipmunk
$ rvm --force gemset empty albinochipmunk
```
