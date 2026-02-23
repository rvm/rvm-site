---
title: Hooks
---

# Hooks

RVM supports several hooks.

- after_use
- before_install
- after_install
- after_do (Triggered after any 'do' action)
- after_cd (Triggered whenever a user uses the cd command)

Each hook is a file in ~/.rvm/hooks/[hook name] in which you can place any sequence of bash scripting commands. Each hook file when run will have available to it the entire RVM environment. Some useful RVM environmental variables are:

- rvm_ruby_string - The ruby string used to uniquely identify the selected ruby interpreter.
- rvm_ruby_home - The directory containing the installation of the selected ruby interpreter.
- rvm_ruby_gem_home - The gem home directory for the selected ruby interpreter.
- rvm_gemset_name - The current gems(et) name (if any)
- rvm_ruby_interpreter - The currently selected ruby interpreter
- rvm_ruby_version - The currently selected ruby version
- rvm_ruby_patch_level - The currently selected ruby patch_level (if any)
- rvm_ruby_revision - The currently selected ruby revision (if any)
- rvm_ruby_tag - The currently selected ruby tag (if any)

For `after_use`, `after_cd` and `after_install` hooks, multiple hook files are processed. RVM provides the main hook file for each of these, which loads other files within the hooks directory that are prefixed with `[hook name]_`. Each prefixed hook file which has it's executable flag set will be loaded in alphabetical order.

Other hooks may follow this convention in the future, if necessary. When RVM is updated, any existing hook file that needs to be replaced with one of these wrappers will be renamed to `[hook name]_custom`.

As an example say we want to print out the ruby string every time we switch rubies.

```
$ cat > ~/.rvm/hooks/after_use_show_ruby <<EOF
>    echo "Now using $rvm_ruby_string"
>  EOF
$ chmod +x ~/.rvm/hooks/after_use_show_ruby
```

Will produce the following.

```
$ rvm 1.9.1
  Now using ruby-1.9.1-p243

$ rvm 1.8.7
  Now using ruby-1.8.7-p174
```

# Community Resources
