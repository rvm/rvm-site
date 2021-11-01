
---
title: "Troubleshooting RVM"
---

.breadcrumbs
  %a{ :href => "/" }
    Documentation
  &nbsp;>&nbsp;
  %a{ :href => "/support/" }
    Support
  &nbsp;>&nbsp;
  %a{ :href => "/support/troubleshooting/" }
    Troubleshooting
  %hr

%a{:href => "#", :name => "top"}
%h1
  Troubleshooting
%p
  Here we will explore common issues and their resolutions.
%p
  %strong
    Before trying any solution below, please verify the following
%ul
  %li
    Make sure that you are on the latest RVM version by executing
    %pre.code
      :preserve
        rvm get stable
    or, if you are more adventurous,
    %pre.code
      :preserve
        rvm get head
  %li
    Make sure that the sourcing of the RVM file occurs *last* in your shell configuration files (.bash_profile /
    .bash_profile / .zshrc) especially
    after any customizations of your $PATH, functions or aliases.
  %li
    Ensure your files do not contain "&amp;&amp; return".
  %li
    Be sure to be using either Bash or Zsh. RVM is untested, at best, in other shells.

%a{:href => "#", :name => "sudo"}
%h2 Multi-User Installs - Using the sudo command
%p The installation process is similar for both installation methods, however, when installing a multi-user
configuration, <strong>do not run the installer directly <em>as/from</em> the 'root' account!</strong>
Always use the sudo command from a non-privileged user account. This is due to variables that are different
between root's environment and a user's that aren't affected by an EUID change, as well as code checks in
the install itself. In addition, using sudo will not load the /etc/profile.d/rvm.sh, which exists for
current installs, and as such will not load RVM. You can prove this to yourself by executing:
%pre.code
  :preserve
    sudo printenv | grep -i rvm
%p
  Also, you only use the sudo command during the install process. In Multi-User configurations, any operations
  which require sudo access must use the rvmsudo command which preserves the RVM environment and passes this on to
  sudo. However, please note that are <em>very few cases</em> where rvmsudo is required <em>at all</em> once the
  core install is completed! Updating RVM itself is not one of them. Any user in the rvm group can update RVM,
  rubies, and gemsets. There is
  %strong
    never
  a reason to use sudo post-install.

%p
  Once any user(s) added to the 'rvm' group have logged out then back in to gain rvm group membership, they will
  be able to execute
%pre.code
  :preserve
    rvm get head

or
%pre.code
  :preserve
    rvm get stable

to update RVM itself. They will also be able to install any Ruby listed in
%pre.code
  :preserve
    rvm list known

as well as upgrade existing rubies, and create gemsets. Users
%strong
  not
in the rvm group will only be able to make use of, but not be able to modify, RVM. This includes adding or
modifying the 'trust' on project .rvmrc
files.

%p
  Note: Users
  %strong
    must
  log out and back in to gain rvm group membership because group memberships are only evaluated by the operating
  system at initial login time.

%a{:href => "#", :name => "ruby-debug"}
%h2 ruby-debug and ruby 1.9
%p
  If you have trouble installing ruby-debug19 try installing with the following command:
%pre.code
  :preserve
    $ rvm reinstall 1.9.3 --patch debug --force-autoconf
    $ gem install ruby-debug19 -- --with-ruby-include="${MY_RUBY_HOME/rubies/src}"

%a{:href => "#", :name => "i386"}
%h2
  I keep getting callback.func errors with Ruby 1.8.7
%p
  This is usually caused by using pre-release compilers. In this case, this usually shows up under gcc-4.6.
  This issue does not take place with gcc-4.5. It is suggested you install gcc-4.5 and add the variable
%pre.code
  :preserve
    CC=/usr/bin/gcc-4.5

%p
  to your $rvm_path/environments/[ruby_version_string] file. Most people will find this problem when using
  ArchLinux.
  %strong
    NOTE: We do NOT support pre-release compilers of any kind.
%h2
  i386 (32 bit)
%p
  I need to compile ruby X as i386 (32 bit).
%pre.code
  :preserve
    CFLAGS='-m32' CXXFLAGS='-m32' LDFLAGS='-m32' rvm install X
%p
  Also note on OSX it is enough to use:

%pre.code
  :preserve
    rvm install X --32

%a{:href => "#", :name => "segfault"}
%h2
  Bus Error / Segfault
%p
  When a command you try to run produces a segfault, possibly like the one below:
%pre.code
  :preserve
    [BUG] cross-thread violation on rb_gc()

%p
  In every case of this I have seen thus far it has always ended up being that a ruby gem/library
  with C extensions was compiled against a different ruby and/or architecture than the one that
  is trying to load it. Try uninstalling &amp; reinstalling gems with C extensions that your
  application uses to hunt this bugger down.

%a{:href => "#", :name => "mysql"}
%h2
  MySQL
%p
  If you are having issues installing MySQL gem for a ruby please visit the
  %a{:href => "/integration/databases/"}
    MySQL page.

%a{:name => "profiles-on-osx"}
%h2 .bash_profile not being loaded on OSX

%p
  If your .bash_profile isn't being correctly loaded on OSX, you need to do one of
  three things:

%ul
  %li Create a file named ~/.bash_profile and add the RVM source line there
  %li Add the RVM source line to ~/.profile
  %li
    In your terminal preferences, change the shell from the default
    of /usr/bin/login to /bin/bash.

%a{:href => "#", :name => "passenger"}
%h2
  Passenger
%p
  If you are having issues getting passenger running with an RVM installed ruby, most likely you missed the
  '.bin/[ruby string]' comment on the
  %a{:href => "/integration/passenger/"}
    passenger page.

%a{:href => "#", :name => "readline"}
%h2
  Readline
%p
  If you have an error when compiling pertaining to readline, please refer to the
  %a{:href => "/packages/readline/"} readline page.

%a{:href => "#", :name => "iconv"}
%h2
  require "iconv" # => false ?!
%p
  If you have issues with iconv not being available in ruby / irb please rever to the
  %a{:href => "/packages/iconv/"} iconv page.

%a{:href => "#", :name => "curl"}
%h2
  curl failing, 'curl is' ?!
%p
  If you see this:
%pre.code
  :preserve
    ++ curl is /opt/local/bin/curl -O -L -s -C - ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p383.tar.gz
    curl: Remote file name has no length!
    curl: try 'curl --help' or 'curl --manual' for more information
%p
  Then maybe you have aliased or symlinked the 'which' command to the 'type' command, revert this and RVM
  should work.

%a{:href => "#", :name => "pg"}
%h2
  I can't seem to install the pg gem.
%p
  Prepend with a variable assignment for PATH with the location of the pg_config file, for example:
%pre.code
  :preserve
    PATH=/usr/local/bdsm/pkg/postgresql/active/bin:$PATH gem install pg --no-rdoc --no-ri

%a{:href => "#", :name => "cd-completion"}
%h2
  I'm having trouble in Bash with tab completion of cd (and maybe $CDPATH)
%p
  rvm hooks into cd in order to do per-directory checks for '.rvmrc' files. Tab
  completion of directories should still work, but some people have reported
  problems. If tab completion was working
  %em before
  you installed rvm and now it's not, you can enable cd completion from within
  rvm itself.
%p
  Add the following to your ~/.bash_profile or ~/.profile as appropriate:
%pre.code
  :preserve
    export rvm_cd_complete_flag=1
%p
  If you have this problem, please report the details of your operating system,
  $BASH_VERSION, the version of bash_completion you're using, etc. to #rvm on
  Freenode or on GitHub. To be honest, the tab completion for cd in
  bash_completion is far more robust than the code in rvm's cd function, and
  %em should
  still work with rvm. (In fact, it
  %em does
  still work on OSX 10.6 with Bash 3.2 and Bash 4, on OpenBSD 4.7 with Bash
  4 and on Debian 5.0.6 with Bash 3.2. All of those were tested with the
  %a{:href => "https://github.com/scop/bash-completion#readme"}
    most up-to-date bash-completion
  \. If you don't have that, you may want to try it.)
  Nevertheless, some people have reported problems, and the cd completion
  inside rvm has helped them.

%a{:href => "#", :name => "disable-install-doc"}
%h2
  Building an interpreter fails with an error related to RDOC
%p
  Occasionally a build will fail because the build process picks up an an
  existing rdoc in your path. If this happens, you can add a configuration
  option that will prevent the documentation being built during installation:
%pre.code
  rvm install <ruby-version> --disable-install-doc
%p
  Alternatively, you can try installing a newer version of rdoc to the current
  environment. That way, the newer rdoc should be able to handle documentation
  from the more recent version of Ruby that you're installing.

%h2
  How do I completely clean out all traces of RVM from my system, including for system wide installs?
%p
  Here is a custom script which we name as 'cleanout-rvm'. While you can definitely use 'rvm implode'
  as a regular user or 'rvmsudo rvm implode' for a system wide install, this script is useful as it
  steps completely outside of RVM and cleans out RVM without using RVM itself, leaving no traces.
%pre.code
  :preserve
    #!/bin/bash
    /usr/bin/sudo rm -rf $HOME/.rvm $HOME/.rvmrc /etc/rvmrc /etc/profile.d/rvm.sh /usr/local/rvm /usr/local/bin/rvm
    /usr/bin/sudo /usr/sbin/groupdel rvm
    /bin/echo "RVM is removed. Please check all .bashrc|.bash_profile|.profile|.zshrc for RVM source lines and delete
    or comment out if this was a Per-User installation."

%h2
  I'm using zsh+oh-my-zsh and it keeps trying to use the system Ruby for rubygems.
%p
  Check to see if you have the bundler plugin enabled in oh-my-zsh. Do a
%pre.code
  :preserve
    set -x ; cd $some_project ; set -x
  Look in the output for 'within-bundled-project'. If you see that edit your .zshrc and remove the bundler plugin from
  the 'plugins=()' line, then log out of the shell and back in. Should all work now. The bundler plugin in oh-my-zsh
  overrides RVM's settings related to RubyGems for some reason.
