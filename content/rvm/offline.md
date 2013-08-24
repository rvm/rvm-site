---
title: Offline RVM
---

# RVM in offline mode

This is only rough description of the process, not all the steps need to work right away, feel free to propose fixes here: [rvm offline source](https://github.com/rvm/rvm-site/tree/master/content/rvm/offline.md).


## Installing RVM offline

1. Choose the version of RVM you wish to deploy from: https://github.com/wayneeseguin/rvm/tags
2. Download the rvm tarball: `curl -L https://github.com/wayneeseguin/rvm/tarball/stable -o rvm-stable.tar.gz`
3. Create and enter rvm directory: `mkdir rvm && cd rvm`
4. Unpack it: `tar --strip-components=1 -xzf ../rvm-stable.tar.gz`
5. Install rvm: `./install --auto-dotfiles`
   * use --help to get the options
   * sudo may be required depending on the type of [install](/rvm/install/)
6. Load rvm: `source ~/.rvm/scripts/rvm`
   * if --path was specified when instaling rvm, use the specified path rather than '~/.rvm'


## Download Ruby, rubygems and yaml

1. Download ruby
   * Find version at: http://ftp.ruby-lang.org/pub/ruby/1.9/
   * Download with curl: : `curl -L http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.bz2 -o ruby-1.9.3-p392.tar.bz2`
   * Must use ruby source archive with .tar.bz2 extension!
2. Download rubygems
   * Find version at: https://github.com/rubygems/rubygems/tags
   * Download with curl: `curl -L http://production.cf.rubygems.org/rubygems/rubygems-1.8.25.tgz -o rubygems-1.8.25.tgz`
3. Download yaml (required by rvm)
   * Download from rvm.io with curl: `curl -L https://rvm.io/src/yaml-0.1.4.tar.gz -o yaml-0.1.4.tar.gz`
4. Save these packages for offline use by storing them in the rvm archive folder `$rvm_path/archives/` by default
   * An alternate archive folder can be specified in the `.rvmrc` file
   * sample usage: `echo rvm_archives_path=/path/to/tarballs/ >> ~/.rvmrc`


## Install dependencies

1. Disable automatic dependencies ("requirements") fetching: `rvm autolibs 1`
2. Manually download and install dependencies
   * Get the list of dependencies: `rvm requirements`
   * For each item on the list:
     * Download the source to `$rvm_path/archives/` (or somewhere else), see the yaml instructions above for example.
     * Unpack the result: `cd $rvm_path/src && tar -xzf $rvm_path/archives/this_pkg.tar.gz`
     * Configure and install: `cd $rvm_path/src/this_pkg && ./configure --prefix="$rvm_prefix/usr" && make install`
   * These instructions depend on the conventional configure/install process.  You may need to adapt them for some packages.


## Installing Ruby

1. Set rubygems version: `echo rubygems_version=1.8.25 >> $rvm_path/user/db`
   * You may need to add the rubygems checksum if it is newer than your RVM install: `echo "$rvm_path/archives/rubygems-1.8.25.tar.gz=$(_fred=$(md5sum rubygems-1.8.25.tgz) && echo ${_fred% *})" >> $rvm_path/config/md5`
   * Rubygems should be installed as a part of the ruby install process
   * You can install rubygems manually if needed: `rvm rubygems 1.8.25`
2. Clean default gems: `echo "" > ~/.rvm/gemsets/default.gems`
3. Clean global gems: `echo "" > ~/.rvm/gemsets/global.gems`
4. Install Ruby: `rvm install 1.9.3-p392 --disable-binary` (this may require sudo)
   * Install any other Ruby versions you want similarly
5. Set default Ruby version: `rvm use 1.9.3-p392 --default`


## Installing gems

There are multiple ways to install gems, you could download the gem files, but the best way seems to be Bundler:
http://gembundler.com/bundle_package.html

Example installing `rails` gem:


### Online

1. Create a (fake) project directory: `mkdir gems; cd gems`
2. Install bundler: `gem install bundler`
3. Create `Gemfile`: `bundle init`
4. Add `rails` to it: `echo "gem 'rails'" >> Gemfile`
5. Install all gems: `bundle install`
6. Get gem files: `bundle package`
7. Package project: `tar czf gems.tgz .`
8. Download bundler from https://rubygems.org/gems/bundler the **Download** link


### Offline

1. Create a (fake) project directory: `mkdir gems; cd gems`
2. Unpack gems: `tar xzf gems.tgz`
3. Install bundler: `gem install bundler-1.2.1.gem`
4. Install gems: `bundle install --local`
