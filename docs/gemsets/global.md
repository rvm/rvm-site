---
title: "Global gemsets"
---

## Interpreter global gemsets

RVM provides (>= 0.1.8) a @global gemset *per ruby interpreter.*

Gems you install to the @global gemset for a given ruby are available to all other gemsets you create in association with that ruby.

This is a good way to allow all of your projects to share the same installed gem for a specific ruby interpreter installation.

To install a gem in the global gemset

`rvm @global do gem install ...`
