
# RVM in offline mode

This is only rough description of the process, not all the steps need to work right away,
feel free to propose fixes here: [rvm offline source](https://github.com/rvm/rvm-site/tree/master/content/rvm/offline.md).


## Installing RVM offline

1. Find package to download: https://github.com/wayneeseguin/rvm/tags
2. Download rvm: `curl -L https://github.com/wayneeseguin/rvm/tarball/1.17.5-o rvm-1.17.5.tar.gz`
3. Unpack it: `tar --strip-components=1 -xzf rvm-1.17.5.tar.gz`
4. Install rvm: `./install --auto`
5. Load rvm: `source ~/.rvm/scripts/rvm`


## Download Ruby and rubygems

1. Find ruby: http://ftp.ruby-lang.org/pub/ruby/1.9/
2. Download ruby: `curl -L http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p327.tar.bz2 -o ruby-1.9.3-p327.tar.bz2`
3. Find rubygems version: https://github.com/rubygems/rubygems/tags
4. Download rubygems, just replace version in the following URL: `curl -L http://production.cf.rubygems.org/rubygems/rubygems-1.8.24.tgz -o rubygems-1.8.24.tgz`


## Installing Ruby

1. Copy ruby and rubygems to `$rvm_path/archives/`
2. Set rubygems version: `echo rubygems_version=1.8.24 >> $rvm_path/user/db`
3. Clean default gems: `echo "" > ~/.rvm/gemsets/default.gems`
4. Clean global gems: `echo "" > ~/.rvm/gemsets/global.gems`
5. Install Ruby: `rvm install 1.9.3-p327`


## Installing gems

There are multiple ways to install gems, you could download the gem files, but the best way seams to be Bundler:
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
