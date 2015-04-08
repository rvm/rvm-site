#RVM FAQ & Notes

##I have found a bug in RVM. How do I submit an issue or a patch to get this fixed?

To report bugs against RVM, please go to https://github.com/rvm/rvm/issues/ and open an Issue there. **READ ALL EXISTING REPORTS!** Sometimes the problem is already under investigation or has already been solved. Opening a new one for the same issue is a waste of time and resources and may cause your report to be summarily closed. Please use https://gist.github.com to store and file supplimentary evidence related to the bug report. Include the returned https (not git) URL in your report. Please provide

A. The output from `rvm info`
B. If you are using gemsets, the output from `gem list -dl`
C. All commands run, any errors / output, and contents of logfiles RVM tells you to look in.
D. The complete output of the following trace / debugging command. `set -x ; rvm --trace your_commands_here ; set +x` to give us maximum information to work with. These must accompany your Issue / Bug report in order for us to be able to assist you.

##What shell login means ('bash -l')

There are sites that describe this how it was 10 years ago like [here](http://askubuntu.com/questions/40287/etc-profile-not-being-sourced) or [here](http://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile/183980#183980) so read to see how it works in current world:

1. When you login graphically to your system it will read `~/.profile` so you put there settings like `LANG` which are important for graphical applications.
2. When you open a terminal (except Gnome-terminal & Screen) you open a `login` shell which sources `~/.bash_profile`
3. When you execute commands in non login shell like `ssh server command` or `scp file server:~` or `sudo`(without -i) or `su` (without -l) it will execute `~/.bashrc`

4. `~/.bashrc` is meant for non login invocations, you should not print there any output - it makes tools like `scp` fail.
5. If the shell of the user is set to `/bin/sh`, you will need to edit `/etc/passwd` and set it to `/bin/bash`

It is good idea to put environment variables in `~/.bashrc`, things that you depend upon in your scripts (for `ssh server script`)

then if your system does not source  `~/.bashrc` by default via `/etc/profile` you should source it in `~/.bash_profile` file so any login shell will have access also to the same environment like non login sessions.

RVM by default adds itself currently to `~/.bash_profile` file, and the recommended way is to enable login shell in gnome-terminal (and screen).

To fix the configuration files automatically run:

    rvm get [head|stable] --auto-dotfiles

##I noticed some incorrect information on the RVM website. How do I submit a patch or Issue?

Please feel free to fork [rvm-site](https://github.com/rvm/rvm-site/) and to fix anything you find amiss. Then submit a Pull Request. Regardless, whether you feel comfortable doing the above or not, please file an Issue at [Issue Tracker](https://github.com/rvm/rvm-site/issues/) complete with the current error and the change as you see it. If you created a pull request, please  reference the URL in your Issue.

##Do I need to use sudo with gems?

**NO. DO NOT USE sudo** for RVM managed rubygems. If you require more explanation see the [rubygems](/rubies/rubygems/) page.

##Install gems as root?
**NO.** If you require more explanation see the [rubygems](/rubies/rubygems/) page.

##RVM is not found or the RVM selected default ruby is not set for new shells...

RVM must be included at the bottom of the profile files. Otherwise your settings will clobber it's (example: PATH). Refer to the [install directions](/rvm/install/) to include this in your PATH.

##Does RVM work on windows? Will it in the future?

NO. If you would like to manage multiple versions of ruby on windows please use pik which is an
excellent tool by Gordon Thiesfeld. You can find it on [GitHub](http://github.com/vertiginous/pik/).
There are plans to include windows support in RVM 2.0 =>
<https://www.bountysource.com/fundraisers/489-rvm-2-0>.

##Can I use a path with spaces?

Currently spaces in paths are not supported. Patches welcome :)

##How do I set a ruby to be default?

Setting the default ruby is [explained here](/rubies/default/).

##What are the defaults.

The default interpreter is 'ruby'. The default versions for each ruby interpreter are set in ~/.rvm/config/db and can be overridden by the user in ~/.rvm/config/user.

##Where are Ruby Gems kept?

* Ruby Gems for all installed ruby interpreters and versions are stored completely separate.
* Gems are located in ~/.rvm/gems/$ruby_string.
* Gems can be additionally separated using [Gem Sets](/gemsets/).
* A gem directory using gemsets is of the form:  ~/.rvm/gems/$ruby_string@gemset_name

##Where is everything installed to ?

RVM installs everything into ~/.rvm. To remove RVM from your system run ``rm -rf ~/.rvm``. You may have one additional config file in ~/.rvmrc and of course the RVM hook in your bash/zsh startup files.

##Do I need the gem after I install RVM?

No, the gem is only used for distribution, you can just as easily clone the github repo and run ./install. After installation the Gem is no longer necessary and can be safely removed. Unless, that is, you are using the RVM Ruby API. Then using the gem can be helpful but not necessary, as it can also be loaded from ~/.rvm/lib/.

##My ruby is compiling as 32 bit but I am on Mac OS X Snow Leopard which has heavy advertisement that it is 64 bit!!!

RVM compiles to your current running kernel's architecture. This means that if your kernel is running as a 32 bit kernel (uname -m) it will compile 32 bit. You can override this behavior by placing the following in your ~/.rvmrc before installing the ruby interpreter:

    rvm_archflags="-arch x86_64"

##I'm using the `ruby` method in my Gemfile to select the ruby version in production - how do I use another ruby version for development?

Place a .ruby-version (or .rvmrc if you need scripting) file in the project directory with the version of Ruby to use for development.

The .ruby-version file has a higher precendence then the Gemfile but not the .rvmrc file and if you are on Heroku it will be ignored.

The .ruby-version file can contain a specific ruby version, or  be left empty in order to just use the currently selected ruby version.

##I want to install for root only!

Please note that if you want to install for root only, using a per-user install, then you **must** prepopulate root's $HOME/.rvmrc with the following BEFORE you attempt to install:

    echo 'export rvm_prefix="$HOME"' > /root/.rvmrc
    echo 'export rvm_path="$HOME/.rvm"' >> /root/.rvmrc

to override the checking done that assumes that if root is executing the install it must be a Multi-User installation type, and that RVM must go into /usr/local/rvm. This also negates the need to use sudo, as the combination of all these factors effeccively turns it into a Per-User installation type specifically for the root user only.

**Please note that this is *not* a typical, or generally supported installation type.**
