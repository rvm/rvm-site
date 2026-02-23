---
title: Database Libraries Integration with RVM
---

## PostgreSQL

Ensure that pg_config is in your path and the pg gem *should* install with no issues.

Alternatively you can specify the location to the pg_config via the CLI:

```bash
$ gem install pg -- --with-pg-config=/usr/local/postgresql/bin/pg_config
```

## MySQL

### Linux

Ensure that mysql_config is in your path and the mysql gem *should* install with no issues.

Alternatively you can specify the location to the mysql_config via the CLI:

```bash
$ gem install mysql -- --with-mysql-config=/usr/local/mysql/bin/mysql_config
```

### Mac OS X

The architecture of mysql must match the selected ruby's architecture so you might have to re-install/compile one of them to the desired arch.

You can find out the architecture of each by inspecting the output of:

```bash
file $(which mysql)
file $(which ruby)
```

It is recommended that you install MySQL via the pre-built pkg installer provided on dev.mysql.com in the downloads section.
If you are running OSX 10.5 or later be sure to download the .pkg installer for 'x86_64' only, not the universal one nor the i386 one.

Once you have the architecture of both matching you can install the gem.

Place the following in your ~/.rvmrc file:

```
rvm_archflags="-arch x86_64"
```

Then install the mysql gem:

```bash
ARCHFLAGS="-arch x86_64" gem install mysql -- --with-mysql-config=/usr/local/mysql/bin/mysql_config
```

where in this example '/usr/local/mysql/bin/' is the path to my 'mysql_config' file installed with the .pkg mysql installer from dev.mysql.com.

Also be aware that there were just two bugfixes in building rubies:

- RVM now honors (again) the configure flags passed in on the command line -C --enable-shared,--with-iconv-dir=...
- RVM now specifies both --host and --build configure flags on OSX in order to ensure that it will properly build as x86_64 or i386.

### Fixing Virtual Timer Errors

If you are encountering a virtual timer errors such as 'Virtual Timer Expired', please try installing an older version
of the mysql gem. e.g:

```bash
gem uninstall mysql
gem install mysql --version 2.7
```
