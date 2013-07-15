---
title: Phusion Passenger - Come on, ride the train, hey, ride it, woo woo...
---

# Using RVM rubies with Phusion Passenger

[Phusion Passenger](https://www.phusionpassenger.com/) is an application server for Ruby and Python that can integrate into Apache and Nginx, or run standalone. It's currently one of the most popular application servers for Ruby. RVM will allow you to use any of it's MRI/YARV Rubies with Phusion Passenger very easily.

RVM works best with Phusion Passenger version 4.0.0. Phusion Passenger 4 has full integration support for RVM and should work out of the box with no configuration. The only thing you need to tell Phusion Passenger is which Ruby you want to use for which app.

RVM also works with Phusion Passenger 3.x, although 4.0 has much better RVM support. Instructions for 3.x can be found [here](/deployment/passenger3/).

## Using RVM with Phusion Passenger for Apache/Nginx

First of all you need to run

    passenger-install-apache2-module

or

    passenger-install-nginx-module

as documented in the Phusion Passenger manuals. At the end of the installation it outputs a `PassengerDefaultRuby` (Apache) or `passenger_ruby` (Nginx) configuration snippet for the web server. Its value is set to the RVM Ruby wrapper script that corresponds with the RVM Ruby and RVM gemset that was used to run the installer. This should be all you need for configuration of Phusion Passenger!

If you want to run any apps under a different RVM Ruby or RVM gemset, then you need to set a `PassengerRuby` (Apache) or `passenger_ruby` (Nginx) configuration option in that app's virtual host. The value must correspond to the desired RVM Ruby or RVM gemset. This is explained in detail in the Phusion Passenger document: [Apache manual](http://www.modrails.com/documentation/Users%20guide%20Apache.html#PassengerRuby), [Nginx manual](http://www.modrails.com/documentation/Users%20guide%20Nginx.html#PassengerRuby). There's a section in that manual that covers RVM, and there's even a tool to aid RVM users.

## Using RVM with Phusion Passenger Standalone

Phusion Passenger Standalone runs standalone, without needing you to install an external web server like Apache or Nginx, although it uses an Nginx core internally. Phusion Passenger Standalone can be invoked with `passenger start`. It runs the app with the RVM Ruby and RVM gemset that was used to run the `passenger start` command.

If you want to use `passenger start` with a different RVM Ruby or RVM Gemset then you need to 'gem install passenger' in that Ruby/Gemset first, after which you can invoke `passenger start`.

## Outdated information

Previous versions of this web page stated that you need to create a .rvmrc file for Phusion Passenger. This is no longer necessary. Other than the aforementioned instructions, there's really nothing else you need to follow.

## Bundler caveats

When using Bundler in your project, Passenger will try to be smart and only add to your `$LOAD_PATH` the gems listed in your Gemfile. This can lead to "unable to load" errors for your unlisted gems (this should only happen during development). You can check your run-time load path by looking in the purple Phusion Passenger error page that it shows. You won't be able to load any gems that are not in that load path.

## FAQ

 * **Q: Can I run multiple projects under Phusion Passenger with each project on a different Ruby version?**

   A: Yes, since Phusion Passenger 4.
 * **Q: How do I use custom gemsets under Phusion Passenger?**

   A: Switch to that gemset first, then run 'passenger-config --ruby-command' as documented in the Phusion Passenger manual. It'll tell you what 'PasengerRuby'/'passenger_ruby' config option you should put in your virtual host. Edit your virtual host accordingly and restart the web server.
 * **Q: How can I use commands like passenger-status in conjunction with a user install but run them as root?**

   A: Mainly the key to this is to use wildcards in the sudoers file as the following examples show: `/usr/bin/env GEM_PATH=* GEM_HOME=* PATH=* passenger-status`

## Community Resources

 * [Phusion Passenger support and documentation resources](https://www.phusionpassenger.com/support)
