---
title: "Ignoring gemsets"
---

# Ignoring

If you do not want to use gemsets and want to ignore them you can use
command line flag `--ignore-gemsets`:

```
rvm use 1.9.3@my_project --ignore-gemsets
```

it will ignore @my_project and @global, only default gemset will be set.

It can be done persistent with:

```
echo "export rvm_ignore_gemsets_flag=1" >> ~/.rvmrc
```
