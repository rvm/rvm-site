---
title: "Quicktime"
---

= breadcrumbs "Integration", "qtruby"

%a{:name => "qtruby"}
%h1 QT Ruby

%h2
  Ubuntu

%pre.code
  :preserve
    sudo aptitude install libqt4-core libqt4-dev

%p
  Download qtruby from http://rubyforge.org/projects/korundum/
%pre.code
  :preserve
    version=2.1.0
    wget http://rubyforge.org/frs/download.php/71843/qt4-qtruby-${version}.tar.gz
%p
  Extract qtruby,
%pre.code
  :preserve
    tar -xvzf qt4-qtruby-${version}.tar.gz
%pre.code
  :preserve
    cd qt4-qtruby-${version}

%p qtruby installer uses the location of the Ruby binary it is started with,
%pre.code
  :preserve
    rvm use 1.8.7
    cmake .
    make
%p
  Now install,
%pre.code
  :preserve
    sudo make install

%p
  ubuntu doesn't look here by default, but the qtruby install puts its libraries here
%pre.code
  :preserve
    sudo ldconfig /usr/local/lib

%p
  We had to run make install with root because it writes to /usr/local/lib, but it also writes to $MY_RUBY_HOME.

%p
  we don't want root-owned files floating around in there
%pre.code
  :preserve
    sudo chown -R $USER:$USER $MY_RUBY_HOME

%p
  NOTE: These are raw notes thanks to mcantor,
  please feel free to enhance this page and send a pull request!
