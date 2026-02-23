---
title: Continuous Integration with Hudson
---

# Continuous Integration with Jenkins

Integrating rvm with [Jenkins](http://jenkins-ci.org/) not only allows you to test multiple projects
with different gemsets yet it also lets you test varying codebases against
multiple rubies at the same time. The follow guide is aimed based primarily
on a Ubuntu install but the instructions should be compatible with
any platform.

Please note these instructions were based off of Nick Quaranto's
[excellent blog post](http://robots.thoughtbot.com/post/712609699/sailing-down-the-hudson-with-rvm)
on the thoughbot blog and adapted for more general purpose use.

## General Overview

In general, you need to:

- Have jenkins setup on a special user
- Setup rvm (optionally with rvm settings to automatically install rubies)
- Use rvmrc's where possible / bundle install in shell tasks with the -e passed to the shebang.
- Source rvm manually if it's not available.

For a more detailed guide, see below:

## Step 1. Getting and Installing Jenkins

The first step is to install jenkins on your system of choice. Currently,
you have several ways of getting it:

1. Installing via os-level packages (in our case, the debian package)
2. Downloading and setting it up manually
3. Using [jenkins.rb](http://github.com/cowboyd/jenkins.rb-history) (which bundles common plugins etc)

If you choose method two or three, you'll need to first create a new user
for jenkins (typically called 'jenkins'). In our case, we'll use the first option
by following [the instructions](http://wiki.jenkins-ci.org/display/jenkins/Installing+Jenkins+on+Ubuntu)
on the official jenkins website. This approach takes care of automatically setting
up init.d for us and also automatically creates the jenkins user.

If setting it up manually, I suggest installing jenkins via jenkins.rb for
the niceties it offers.

## Step 2. Setting up RVM

The next step is arguably the most important - you need to actually setup rvm for the
jenkins user added in the last step. First things first, we need to install all the dependencies.
RVM would automatically install the items required to build each ruby.

```bash
sudo apt-get install curl bison build-essential zlib1g-dev libssl-dev libreadline5-dev libxml2-dev git-core
```

Note that if you wish to also run ci against jruby, you'll need to install more packages
including the jdk - see the ubuntu page linked above for more information.

Next, you'll need to login as the ubuntu user, in this case - jenkins.

```bash
sudo -Hiu jenkins
```

This should put you at a shell with bash loaded. So, now you can run the instructions
on the [rvm installation](/rvm/install/) page - We strongly suggest using the rvm-install-head method
setting it up only for the jenkins user.

Next, we need to add rvm to our shell profile - in this case, we'll add the following
to the end of our ~/.bashrc:

```bash
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
```

Also, with ubuntu the default .bashrc has a line containing "&& return" - If the
same is true for your system, please ensure your replace it with an if as instructed
but the rvm install.

Lastly, if we exit and relogin as jenkins, rvm should now be loaded. You
can confirm this by typing:

```bash
type rvm | head -1
```

Which should result in 'rvm is a function'.

Lastly, we'll add the following lines to ~/.rvmrc as the jenkins user
to make the actual process easier in general:

```
rvm_install_on_use_flag=1
rvm_project_rvmrc=1
rvm_gemset_create_on_use_flag=1
```

For an explanation of what each means, please see the
[rvmrc page](/workflow/rvmrc/) which goes into detail about each one / the appropriate
sections of this documentation - the general idea with this
approach is when we first use a ruby / gemset, rvm will automatically
install the ruby and create a gemset.

## Step 3. Configuring Jenkins / Adding projects

For the actual hard work, we will be using the ability to run a shell script
with jenkins.

Our suggested setup is to use scripts like follows with the jenkins
option to "Execute Shell Script":

```bash
#!/bin/bash
# Use the correct ruby
rvm use "ruby@gemset"
# Set "fail on error" in bash
set -e
# Do any setup
# e.g. possibly do 'rake db:migrate db:test:prepare' here
bundle install
# Finally, run your tests
rake
```

The -e option causes bash to exit if any commands exit with
an error. This is key to making the script work as expected.

Note that in some setups the environment may not be loaded correctly.
In these situations, you should add the following below the shebang:

```bash
source "$HOME/.rvm/scripts/rvm"
```

If you wish to use matrix builds, this approach means you can define
an environment variable e.g. build_ruby and set the matrix fields to be
each ruby you wish to use, replacing the rvm use line with:

```bash
rvm use "$build_ruby@gemset-to-use"
```

And when cloning from git repositories, you'll need to ensure you add a ssh
key for the jenkins user.

Lastly, if you wish to use rubies from an rvmrc automatically / handle
setup that way, you may want to add:

```bash
[[ -s ".rvmrc" ]] && source .rvmrc
```

In place of the rvm use command / associated setup.
