---
title: "Using God with RVM"
---

Using RVM with God
==================

To use `god` (or any other application that needs to be started with
`init.d`) with RVM, you need to generate a wrapper script. Namely, you
need to set it up so that there is an alternative executable that loads
the correct gemset.

As an example, if you'd installed `god` under `ruby` in the `management`
gemset (aka. `ruby@management`), you would do the following:

    rvm wrapper ruby@management bootup god

Running this command will generate the executable `bootup_god` in
`~/.rvm/bin` or, if you have installed RVM system wide, in
`/usr/local/rvm/bin`.

Thus, when setting up your init files, instead of using the direct path
to `god`, you would instead use the path to `bootup_god`. As an example,
you could add the following to `/etc/rc.local` (although we suggest
using the `init.d` system of choice for your operating system):

    /home/your-long/.rvm/bin/bootup_god -c /path/to/config.god --log /var/log/god.log --no-syslog --log-level warn

Also, please note that any gems you reference in your `god`
configurations that are under other gemsets or rubies (such as `thin`
or `thor`), you will need to also generate wrapper scripts (and hence,
use the path for them) via:

    rvm wrapper ruby@gemset [scope] [binary-name]

Where `[scope]` is the prefix for the executable (e.g. `god` before and
`binary-name` is the binary to generate a wrapper for. Hence, creating
`$rvm_bin_path/[scope]_[binary-name]`, e.g. `~/.rvm/bin/myapp_thin`.

To simplify `current` can be used as `ruby@gemset` and currently used
ruby will be used for wrappers generation, eg:

    rvm wrapper current bootup god

Lastly, you would replace all calls to `thin` or the path to `thin`
in your `god` configs with the path to the wrapper instead.

