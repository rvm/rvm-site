---
title: Quicktime
---

# QT Ruby

## Ubuntu

```bash
sudo aptitude install libqt4-core libqt4-dev
```

Download qtruby from http://rubyforge.org/projects/korundum/

```bash
version=2.1.0
wget http://rubyforge.org/frs/download.php/71843/qt4-qtruby-${version}.tar.gz
```

Extract qtruby,

```bash
tar -xvzf qt4-qtruby-${version}.tar.gz
```

```bash
cd qt4-qtruby-${version}
```

qtruby installer uses the location of the Ruby binary it is started with,

```bash
rvm use 1.8.7
cmake .
make
```

Now install,

```bash
sudo make install
```

ubuntu doesn't look here by default, but the qtruby install puts its libraries here

```bash
sudo ldconfig /usr/local/lib
```

We had to run make install with root because it writes to /usr/local/lib, but it also writes to $MY_RUBY_HOME.

we don't want root-owned files floating around in there

```bash
sudo chown -R $USER:$USER $MY_RUBY_HOME
```

NOTE: These are raw notes thanks to mcantor,
please feel free to enhance this page and send a pull request!
