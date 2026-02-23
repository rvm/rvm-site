---
title: Myths about RVM
---

# Myths

Whilst RVM stands for 'Ruby enVironment Manager', a lot of people seem unclear about the range of things you can use RVM for, and how well it fits into the development and deployment ecosystem. This page aims to dispel these myths, and to provide our perspective. By the way, yes, RVM originally stood for 'Ruby Version Manager', but it was changed to 'Ruby enVironment Manager' since it handles so much more than just Rubies themselves.

## Myth #1: RVM is only useful for managing ruby versions

Although RVM stands for "Ruby enVironment Manager", it does much more than that. In fact, RVM is even more useful when you consider it as a collection of tools for handling many frequent tasks commonly associated with Ruby development.

Outside of offering multiple ruby versions, it also offers gemsets (which let you keep different projects separate in terms of gems, work with multiple versions of gems even when they may not be compatible - e.g. Rails 2 and Rails 3) as well as things like:

- Automatically switching your gemset / ruby version as you change directories
- Setting up common dependencies (via packages)
- Providing a consistent ruby environment for a given project
- Letting you build custom rubies / build rubies with custom patches
- Providing a consistent interface to a given ruby
- Scripting common behaviour
- Simplifying / automating the setup of rubies and gems

More importantly, it provides an interface for dealing with ruby versions that is consistent across all platforms.

## Myth #2: RVM is only for {OSX,Linux,Your OS here}

RVM is built to work on *any* \*-nix system built on POSIX tools. If RVM doesn't work on your POSIX-compatible system of choice (the minimum requirements being the tools needed to build ruby, curl and Bash) then you've found a bug - let us know by [opening an issue](https://github.com/rvm/rvm/issues).

## Myth #3: RVM is only for Bash

RVM is currently designed to work with any shell that provides the basic features found in Bash - namely, support for arrays, [[-style tests and the like are expected. This means that it should work on any shell that provides a superset of Bash features.

If your shell doesn't work with RVM and it should (e.g. it isn't csh / ksh / some other non-sh like shell), *let us know*. Currently, it isn't compliant with the POSIX sh standard. However, there are plans to introduce support for this in the future.

## Myth #4: RVM is only for development

One of the most common misconceptions we hear is that RVM "is only for use in development". In reality, RVM was originally built for a server setting, and is perfect for such use. Not only does it include tools that can be easily automated to make setting up rubies / gems efficient, it also means you can have consistent environments from development, through testing, and into production.

More importantly, RVM lets you easily upgrade Ruby versions when you need to such as for security updates. Equally importantly, it makes automating tasks efficient.

Lastly, for those in test environments, RVM makes running tests against multiple ruby versions incredibly efficient. In continuous integration, RVM is the perfect fit for managing your rubies.

## Myth #5: Wayne is a robot / Wayne is really Batman

We neither confirm or deny these statements.
