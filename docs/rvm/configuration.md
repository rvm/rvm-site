---
title: RVM Configuration
---

# RVM Configuration

RVM has a configuration directory located in $rvm_config_path which for a typical installation as user to their $HOME directory will be located in ~/.rvm/config/

## Defaults

RVM has a set of defaults recorded in the file

```
$rvm_config_path/db
```

This file is replaced each time you upgrade RVM so do not edit it.

## Overriding Default Settings

RVM also has a directory for user overrides located in $rvm_path/user/. In order to override RVM's default settings, place the appropriate key=value into the db file of that folder

```
$rvm_path/user/db
```

RVM will then use these settings instead of RVM's defaults.

### Example

From the troubleshooting page we saw that ruby 1.8.7-p249 had a segfaulting bug on some systems, the fix was to downgrade 1.8.7 to p174 until this was fixed in a future release. In order to override the default patchlevel of 1.8.7 to 174, we place the following string into $rvm_config_path/user:

```
ruby_1.8.7_patch_level=174
```

Then 'rvm use 1.8.7' will use 'ruby-1.8.7-p174' instead of the default recorded in $rvm_config_path/db
