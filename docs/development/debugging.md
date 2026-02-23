---
title: "Debugging RVM"
---

## Debugging RVM

If you encounter an issue with rvm, you can make it greatly easier
for us by following the steps below. Each one helps provide
additional insight into what is going wrong.

### Tracking Down Bugs

If you do encounter a bug, the first (and most important) information we need
is related to how rvm is loaded. You should first confirm that rvm is loaded as a function.
Do this by running:

```bash
$ type rvm | head -1
```

which should output "rvm is a function". If it shows anything else, rvm isn't
loading correctly. For information on why this occurs, and how to solve it,
please see [the bottom of the Installation instructions](/rvm/install/).

Next, we'll need two sets of information. Namely, the output
of running 'rvm debug', like so:

```bash
$ rvm debug
```

And the output of running the broken command *with the trace option*, e.g. if you're having a use problem:

```bash
$ rvm use ree
```

you would need to try running it as:

```bash
$ rvm --trace use ree
```

To share this information use: [GitHub's Gist](http://gist.github.com/)

### Reporting Bugs

First, please ensure you've read ["How to Report Bugs Effectively"](http://www.chiark.greenend.org.uk/~sgtatham/bugs.html) in order to speed up the whole process.

Report the bug on the project's [GitHub Issues](https://github.com/rvm/rvm/issues) page.
