---
title: "Docs (RDoc / YARDoc) Generation"
---

# Docs (RDoc / YARDoc) Generation

In order to conserve space, RVM does not automatically generate and install
each Ruby's ri / rdoc documentation. To generate this documentation for Ruby
please execute the following command:

```
$ rvm docs generate
```

Please note that this requires the extracted source for the currently selected
Ruby version be on the system ($rvm_path/src/<ruby_version>) so the best time
to execute this command is immediately after installation of that version.

Provided you have not cleaned up the extracted sources for all currently
installed Rubies by executing 'rvm cleanup all' then you can install the docs
for all currently installed Rubies by executing:

```
$ rvm all do rvm docs generate
```

If you have executed a cleanup, unfortunately, this means to regenerate the
documentation you would need to run, for example,:

```
$ rvm reinstall 1.9.3-p194 && rvm docs generate
```

As always, don't forget to pass whatever additional parameters such as --patch
to the reinstall portion of the command that you initially used, if any.

And finally open the core ruby documentation in your local web browser.
Note that for this to work either `open` or `xdg-open` must be found in your
system.

```
$ rvm docs open
```

For more information, please see

```
$ rvm help docs
```
