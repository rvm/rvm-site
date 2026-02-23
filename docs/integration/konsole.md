---
title: Konsole Integration with RVM
---

# Integrating RVM with Konsole

Before you install RVM you need to change the Command field in your profile settings. Go to
Settings >> Edit Current Profile and add a space and then --login to the end of /bin/bash.
It should go from this:

```bash
$ /bin/bash
```

To this:

```bash
$ /bin/bash --login
```

![Gnome Screenshot](/images/konsole-integration.jpg)

For more information on what this means, please read the explanation regarding
[Shell logins](/support/faq/#shell_login)
especially if you are in doubt, or advised by other sites to not use it.
