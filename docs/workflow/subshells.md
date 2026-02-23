---
title: RVM in Subshells
---

# Subshells

Using RVM it is very easily 'switch' to your default ruby or any other ruby while still maintaining all of the current shell's settings.

Let's explore a brief illustration of this:

```
$ rvm 1.8.6 # We are now using 1.8.6 for the current shell
$ ruby -v

ruby 1.8.6 (2009-08-04 patchlevel 383) [i686-darwin10.0.0]
```

We can spawn a subshell running a different ruby by prepending an RVM selector:

```
$ echo $(rvm 1.9.1 ; ruby -v)

ruby 1.9.1p243 (2009-07-16 revision 24175) [i386-darwin10.0.0]
```

What is the ruby of our original shell after running the above sub shell command?

```
$ ruby -v

ruby 1.8.6 (2009-08-04 patchlevel 383) [i686-darwin10.0.0]
```

Not changed at all! And we haven't had to mess with GEM_HOME, yay!

So we have 1.8.6p383 selected, what if we want to run something against the system's default ruby? Prepend another selector in a subshell!

```
$ echo $(rvm system ; ruby -v)

ruby 1.8.7 (2008-08-11 patchlevel 72) [universal-darwin10.0]
```

What is the ruby of our original shell after running the above sub shell?

```
$ ruby -v
ruby 1.8.6 (2009-08-04 patchlevel 383) [i686-darwin10.0.0]
```

Still the 1.8.6p383 we had selected to use.

# Community Resources
