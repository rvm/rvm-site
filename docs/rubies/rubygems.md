---
title: "RVM and RubyGems"
---

# RVM and RubyGems

RVM creates a new completely separate gem directory for each version of ruby.
In addition you can separate this further and have a set of gems per project/application/gerbil color... see the
[gemsets](/gemsets/basics) for more details on using sets of gems.

# **DO NOT use sudo...**

to work with RVM gems.
When you do sudo you are running commands as root, another user in another shell and hence all of the setup that RVM has done for you is ignored while the command runs under sudo (such things as GEM_HOME, etc...).
So to reiterate, as soon as you 'sudo' you are running as the root system user which will clear out your environment as well as any files it creates are not able to be modified by your user and will result in strange things happening.
(You will start to think that someone has a voodoo doll of your application...)

You can see the gem directory of the currently selected ruby using the gemdir action:

```
$ rvm 2.1.1
$ rvm gemdir

/Users/rys/.rvm/gems/ruby-2.1.1
```

To change to the currently selected Ruby's gem directory, use a subshell:

```
$ rvm 2.1.1
$ cd $(rvm gemdir)
$ pwd

/Users/rys/.rvm/gems/ruby-2.1.1
```

If this is something you do frequently you can put the following bash function in your ~/.bash_profile or ~/.zshrc:

```
# Thanks for the awesome idea batasrki
function gemdir {
  if [[ -z "$1" ]] ; then
    echo "gemdir expects a parameter, which should be a valid RVM Ruby selector"
  else
    rvm "$1"
    cd $(rvm gemdir)
    pwd
  fi
}
```

Then switching to individual RVM Ruby gem directories can be done as follows.

```
$ gemdir 2.1.1

/Users/rys/.rvm/gems/ruby-2.1.1

$ pwd

/Users/rys/.rvm/gems/ruby-2.1.1
```

## RubyGems CLI API

RVM now provides a 'rubygems' CLI command which allows you to change the rubygems version for the installed interpreter. In order to install the most recent RubyGems that RVM knows about you can do:

```
$ rvm rubygems current
```

If a newer version of rubygems has been released than the one that RVM knows about then you should get the latest version of RVM, the latest git head would be best, in order to be able to install the newer version since their download url's change for each release / are not consistent (rubyforge scheme).

In order to install a specific rubygems version you can specify the version directly. For example if we wish to install RubyGems version 1.5.2 we would do so as follows.

```
$ rvm rubygems 1.5.2
```

In the case of MRI 1.9.X+ a version of RubyGems comes built in. If you install a different RubyGems via the 'rvm rubygems' API and decide to go back to the built in then you can run the following command to remove the different version installed.

```
$ rvm rubygems remove
```

## Same Ruby Version with Different RubyGem Versions

A RubyGem version is tied to a Ruby version. One can not have two different versions of RubyGems with same Ruby versions at the same time. But sometimes you will want to have two or more different versions of RubyGems tied to same version of Ruby.

In order to achieve this, we will have to install same version of a Ruby but with different
[names](/rubies/named/).

```
$ rvm install ree -n rg152
$ rvm use ree-rg152
$ gem --version
1.8.10
$ rvm rubygems 1.5.2
 ...
$ gem --version
1.5.2
```
