---
title: Ruby Enterprise Edition (ree)
---

# Ruby Enterprise Edition (REE)

REE builds on top of MRI Rubies, versions 1.8.X and later, to deliver an enhanced interpreter with many performance and memory optimizations,
including common patch-sets such as MBARI.

## Installing

```bash
$ rvm install ree
```

To install a prior version of Ruby Enterprise Edition, you'll need to do a couple of things before continuing.
Firstly, you'll need to edit ~/.rvm/config/user to update the download url base for the ruby you wish to install. As an example,
for ree-1.8.7-p2010.01, you would add:

```
ree_1.8.7_url=http://rubyforge.org/frs/download.php/68719
```

For ree-1.8.7-p20090928 you would need to add:

```
ree_1.8.7_url=http://rubyforge.org/frs/download.php/64475
```

When using 20090928 on OSX, you also need to pass in a few extra options. As an example,
you'd need to run:

```bash
$ rvm install ree-1.8.7-p20090928 --ree-options --no-tcmalloc
```

Lastly, ensure you remove the lines from ~/.rvm/config/user after you've installed the version you want.

NOTE: On any OS and REE < 2011.01, if the installation fails and the output file
reports missing readline-devel, zlib-devel, and openssl-devel
headers AND you are sure that you have read the
[packages install instructions](/packages/) -
or you are otherwise positive you have the necessary packages
installed in a known location - check your PATH environment
variable to make sure something like "/usr/lib" is NOT present.
See https://code.google.com/p/rubyenterpriseedition/issues/detail?id=59
for more information. If you don't want to change your PATH variable
then this patch fixes the issue in REE 2010.02

```
$ diff ~/.rvm/src/<ree-dir>/platform_info.rb~ ~/.rvm/src/<ree-dir>/platform_info.rb
226c226
<      if File.executable?(path)
---
>      if File.executable?(path) && File.file?(path)
```

Additional symptoms of the problem include not being able to override the include
directories with the "--with-<pkg-name>-dir" compiler flags. Other solutions (theoretically)
would be to set the CC environment variable to /usr/bin/gcc (although this may result
in more dependency issues elsewhere as it's only a solution to a symptom).
Again, make sure you try to follow the instructions
[here](/packages/) first, as the problem described in this note is an edge case.

# Community Resources

- [http://www.rubyenterpriseedition.com/](http://www.rubyenterpriseedition.com/)
