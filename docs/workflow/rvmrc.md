---
title: rvmrc
---

# rvmrc files

There are 3 types of rvmrc files: system, user, and project.

## System (/etc/rvmrc)

The system rvmrc file is loaded before RVM initializes and before the user's ~/.rvmrc. /etc/rvmrc settings are applied to all users on the system.

## User ($HOME/.rvmrc)

The users rvmrc file overwrites settings in /etc/rvmrc and is loaded before RVM initializes. $HOME/.rvmrc settings are applied only for the user belonging to $HOME.

## System and User rvmrc examples

Have RVM install rubies when used instead of only displaying a warning and exiting.

```
rvm_install_on_use_flag=1
```

Have RVM compile using say, 3, compile threads (note that rvm uses all CPU threads by default).

```
rvm_make_flags=( -j 3 )
```

Have RVM install to a different location (notice that it ends with /rvm).

```
rvm_path=/opt/rvm
```

Have RVM compile rubies and libraries as x86_64 on *Mac OS X*.

```
rvm_archflags="-arch x86_64"
```

Similarly for i386 on *Mac OS X*.

```
rvm_archflags="-arch i386"
```

More examples may be found in ~/.rvm/examples/rvmrc.

## Project (project_directory/.rvmrc)

The project .rvmrc file is different than the system & user. System & user rvmrc files are meant for altering the settings and behavior of RVM as a whole. The project rvmrc files are intended to be used to setup your project's ruby environment when you switch to the project root directory.

As of RVM 1.8.0, after a survey where greater than 80% of respondants wanted the feature on by default, **automatic loading of project .rvmrc files is opt-out by default (therefore on).** In order to disable this feature, set the following value in either /etc/rvmrc or ~/.rvmrc:

```
rvm_project_rvmrc=0
```

As of 1.11.0 RVM supports multiple files to configure project, more details here: [Project workflow](/workflow/projects/)
