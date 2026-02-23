---
title: "Deleting gemsets"
---

When you delete a gemset, rvm will prompt you to confirm the deletion.

```
$ rvm gemset use teddy
$ rvm gemset delete teddy
```

To skip confirmation, pass the --force flag:

```
$ rvm gemset use teddy
$ rvm --force gemset delete teddy
```

By default, rvm deletes gemsets from the currently selected Ruby interpreter. To delete a gemset from a different interpreter, say 2.0.0, run your command this way:

```
$ rvm 2.0.0 do rvm gemset delete teddy
```
