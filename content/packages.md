---
title: "Pleas use 'rvm autolibs enable'"
---

# RVM Packages

This functionality has been deprecated by `autolibs` which is now enabled by default,
however if you still need it - it is there.

## Installing from source

In some rare cases it might be required to install packages via `rvm pkg`,
if unsure try installing ruby first.

RVM can install required packages automatically via `autolibs`:

    rvm autolibs rvm_pkg

This will tell RVM to install the missing dependencies, RVM will try to detect what is missing using `pkg-config`,
as not all packages provide it please do not be surprised RVM will insist on installing `readline` - even it was installed.

There is **no need** to specify any extra `--with-*` flags, RVM will figure them out for you ... in most cases.

# On your own risk

This functionality is one of least used and those least tested, it can include bugs or issues.
Please take your time and try to help solve them, we are open for pull requests and issues:
https://github.com/wayneeseguin/rvm/issues
