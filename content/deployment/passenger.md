---
title: Phusion Passenger - Come on, ride the train, hey, ride it, woo woo...
---

# Using RVM rubies with Phusion Passenger

[Phusion Passenger](https://www.phusionpassenger.com/) is an application server for Ruby and Python that can integrate into Apache and Nginx, or run standalone. It's currently one of the most popular application servers for Ruby. RVM will allow you to use any of it's MRI/YARV Rubies with Phusion Passenger very easily.

RVM works best with latest version of Phusion Passenger. Latest Phusion Passenger has full integration support for RVM and should work out of the box with no configuration. The only thing you need to tell Phusion Passenger is which Ruby you want to use for which app.

RVM also works with Phusion Passenger 3.x, although later versions have much better RVM support. Instructions for 3.x can be found [here](/deployment/passenger3/).

## Using RVM with Phusion Passenger

Follow [excelent documentation on Passenger site](https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/).

## FAQ

 * **Q: Can I run multiple projects under Phusion Passenger with each project on a different Ruby version?**

   A: Yes, since Phusion Passenger 4.
 * **Q: How do I use custom gemsets under Phusion Passenger?**

   A: Switch to that gemset first, then run 'passenger-config --ruby-command' as documented in the Phusion Passenger manual. It'll tell you what 'PasengerRuby'/'passenger_ruby' config option you should put in your virtual host. Edit your virtual host accordingly and restart the web server.
 * **Q: How can I use commands like passenger-status in conjunction with a user install but run them as root?**

   A: Mainly the key to this is to use wildcards in the sudoers file as the following examples show: `/usr/bin/env GEM_PATH=* GEM_HOME=* PATH=* passenger-status`

## Community Resources

 * [Phusion Passenger support and documentation resources](https://www.phusionpassenger.com/support)
