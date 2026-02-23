---
title: RVM inside Screen
---

# Using RVM inside GNU Screen

RVM should work out of the box with screen as long as you have your profiles configured correctly. The easiest way to ensure it's working is to make screen use a login shell by placing the following in your ~/.screenrc file:

```
shell -${SHELL}
```

Read the explanation of what [Shell login](/support/faq/#shell_login) means if in doubt or advised by other sites to not use it.
