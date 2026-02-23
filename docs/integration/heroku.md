---
title: Using RVM with Heroku
---

# Using RVM with Heroku

[Heroku](https://www.heroku.com/) is a deployment platform for running rails application on a scalable architecture.

Heroku provides a managed multi-tenant environment to run rails applications and does not provide a mechanism for running RVM directly since
client apps do not have access to a configurable environment or command line. However RVM remains a useful tool for managing developments
and making sure that development and test environments match the environment on Heroku's platform.

Check which version of the Heroku stack your app will be deployed on ([http://docs.heroku.com/stack](http://docs.heroku.com/stack)
or by running the Heroku command line `heroku stack`) and setup your .rvmrc to use the same Ruby version as your stack.
