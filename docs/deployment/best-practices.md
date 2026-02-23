---
title: "Deployment Best Practices"
---

# Deployment Best Practices

## Warning

This article is outdated and we will be posting an update,
below is list of known bugs, please help if you can:

1. [https://github.com/sm/sm/issues/50](https://github.com/sm/sm/issues/50)

## Use the [SM Framework Project](https://github.com/sm/sm)

[SM Framework](https://github.com/sm)
extensions can be used for flexible server-side code deployments.
The following walkthrough will explain the steps involved for one example.
This example will be deploying a Ruby on Rails application from GitHub.
Please note that the deployment extension is not 'ruby specific' and can be
used for deploying any codebase desired.

#### Walkthrough

When deploying rvm applications, there are a few things to keep in mind.
Please note that all of these are our recommended practices, and are typically
best set up on a new machine:

The best way to deploy any application is to create a a new user on the target
system for each application (project / code base) to be deployed. We then
deploy each application to it's own *isolated* environment (eg. as the user,
in the user's home path); Preferably the username is the same as the
'shortname' of the application.

Use an RVM gemset for each application (project)

Also be sure to use a
[project .rvmrc](/workflow/rvmrc/#project)
for each project, for both development and deployment.

Set the rvm_path to be user-facing:

```
appuser$ echo 'rvm_path="$HOME/.rvm"' >> ~/.rvmrc
```

Now install RVM,

```
appuser$ \curl -sSL get.rvm.io | bash -s stable
```

Please note that there is a backslash before **curl**, this prevents misbehaving if
you have aliased it with other options or use a .curlrc file for this. Once
you have RVM installed for the target application user, you are ready to setup
the deployment!

Start by generating a default ~/.smrc:

```
appuser$ sm smrc
```

Next, update any settings you may need to change in the ~/.smrc file, such as the
environment, repository_url and perhaps the branch to deploy from:

```
appuser$ vim ~/.smrc
```

For example, when we deploy a redmine instance, we set the following two
variables in the ~/.smrc file:

```
appuser$ grep -E '^repository_url=|^branch=' ~/.smrc
repository_url="git://github.com/edavis10/redmine.git"
branch="1.2-stable"
```

For a Ruby application we will want to install and use the 'ruby' extension
set which includes extensions such as rvm, unicorn, and rails:

```
root# sm set install ruby
```

Next, run the Rails application setup extension action; this creates and sets
up the directories and configuration files within the application user's
~/shared path. It will also install RVM with the default ruby:

```
appuser$ sm rails setup
```

Generate the unicorn configuration file in ~/shared/config/. Edit this file
if you wish to run more than 2 unicorn worker processes by default,
and to tweak any unicorn settings:

```
appuser$ sm unicorn setup
```

Edit the default generated database.yml file, and set up your database
connection information:

```
appuser$ vim ~/shared/config/database.yml
```

Now install the deploy extension:

```
root# sm ext install deploy
```

Now we can use the deployment extension which will update ~/current with a
fresh release, using the latest code from the repository and branch
information defined in ~/.smrc:

```
appuser$ sm deploy
```

If you use rvm gemset files, do the following:

```
appuser$ source ~/.rvm/scripts/rvm # load RVM into your current shell
appuser$ rvm gemset import ~/current/production.gems
```

If you use bundler, bootstrap your gems as follows
( Note: ensure that 'gem "unicorn"' is in the Gemfile first,
*with no version specified* ):

```
appuser$ cd ~/current
appuser$ gem install bundler && bundle install
```

Once your Ruby app environment is bootstrapped, start
your application running under unicorn:

```
appuser$ sm unicorn start
```

Things are not always unicorns and rainbows, especially when changing and
updating an application's codebase. There have been many times where I have
worn keyboard imprints on my forehead for several days after being unable
to start my application's unicorn herd only to finally figure out it was
because my new codebase was using a new rubygem and I had forgotten to add
it to my application's Gemfile! When the codebase update was successful but
the unicorns will not restart, then you can check the status of this by
examining the unicorn log; For example to check the last 200 lines of the
unicorn log you issue the following command:

```
appuser$ tail -n 200 ~/shared/log/unicorn.log
```

Then you figure out what the errors are telling you, fix the issue and deploy
again!!! Aye, a vicious cycle 'tis ;)

We use the Nginx webserver to serve http/https traffic and to proxy to the
application servers.
The Nginx extension is found in the 'servers' extension set:

```
root# sm set install servers
```

We run Nginx, so for us we proceed as follows. Please note the switch to
running as root (with sudo):

```
root# sm nginx install
```

Now, 'configure the system' - which means copying the Nginx configuration
directory into /etc/nginx:

```
root# sm nginx configure system
```

Next, for each application user, you'll generate an application server
configuration file (in /etc/nginx/servers/):

```
root# sm nginx server add {{appuser}}
```

Note: this creates a /etc/nginx/servers/\{\{appuser\}\}.conf file;
configured by default to proxy to a unicorn running on a
Unix Domain Socket (UDS).

Now, ensure the appuser's directory is readable by Nginx:

```
root# chmod go+rx /home/{{appuser}}
```

Finally, start the Nginx service:

```
root# sm nginx service start
```

*Do not forget to make backups!!!*
For most this is an afterthought only brought about by an event that they are
ill prepared for. Avoid this pain for yourself.
The Rails extension provides a backup_database action.
This will backup the database based on the database.yml file into the
~/shared/backups/ directory.
(If you want them in a different location, use filesystem symlinks.):

```
user$ sm rails backup_database
```

Add the command to cron such that it is run nightly at 02:00:

```
user$ crontab -e

0 2 * * * sm rails backup_database
```

Note: this will soon change to 'sm rails backup database' (note the space)

Use wrapper scripts for managing things like god and the like:

```
user$ rvm help wrapper
```

#### Deploying a specific branch and revision

The BDSM deployment extension also allows you to specifiy the branch and/or
revision to use from the application's repository.
For example, if you use git, you can set one or both of these in the
~/.smrc file as follows:

```
branch="production"
revision="asdf4269"
```

#### Deployment Hooks

In the above walkthrough I showed you how to use a few BDSM framework
extensions to accomplish a Ruby on Rails deployment. We now have a single
server running with the application code served on port 80. We are running a
Unicorn and Nginx web server stack.

A note for those new to deployments: 'Unicorn' is called an "application server"
which means that it is what runs the actual Ruby code. Nginx, the "web server",
is used to serve static files (css, images, javascripts, etc...) and proxy all
other requests to the Unicorn herd (application servers).

Several of the above steps you must do each time you want to update your
code to the latest on your server. We will now show you how to automate these
steps even further so that you need only type 'sm deploy'!
Once installed it is not required to reinstall or update the extensions and
extension sets unless you are updating them to a newer version.
There is also no need to reconfigure the project, database and unicorn
configurations, these are all one time tasks.

If you use rvm gemsets and/or bundler (yes, you can use both together as I do
myself) then every time you deploy a new version of your application, you will
want to ensure that your gems are up to date.

This can be accomplished for you automatically during the deployment process.
Several steps are taken in order to complete a deployment.
Most of these steps occur in a staging location ($stage_path).
The deployment extension provides a before and after hook for each step in
the deployment process. In order to have actions happen at any of these hook
points in the process you create an executable file in config/deploy/.

Let us take the example of updating your gems before replacing the current
application's codebase so that you are sure the application will not
temporarily falter. We create the following executable file in our
application's code repository 'config/deploy/before_replace_current':

```
#!/bin/bash
enter "${stage_path}"
command_exists bundle || gem install bundler --no-rdoc --no-ri
bundle --without development,test
```

Once this file with this content is checked into the application code
repository, the very next time 'sm deploy' is run as \{\{appuser\}\} on the server
this file will be run just before the deployment extension replaces the
currently deployed code directory.

One thing to note is that this file is a shell script! This means that you can
run any commands to accomplish whatever it is that is required to happen on
the server before the currently running code is replaced.

Another step that must happen in order for your website to change it's running
codebase is that the application server (unicorn) must be restarted so that
it reloads the new codebase. The way to do this with the unicorn extension is:

```
appuser$ sm unicorn restart
```

This is something we want to happen after the current directory has been
replaced. So for this we can use the after_replace_current hook! Let's create
the file 'config/deploy/after_replace_current' with the following contents:

```
#!/bin/bash
enter ${release_path} # Not necessary but it makes me feel warm and fuzzy.
sm unicorn restart
```

The unicorn restart will signal the running unicorn process to reload the
codebase without dropping requests. If the unicorn herd is not running yet
then this will start the unicorn herd, which is equivalent to 'sm unicorn start'

I personally use airbrakeapp (was: hoptoadapp) for application runtime error
notifications in all of my Ruby applications and I find that it is a most
useful product! Thus my applications also have a 'config/deploy/after_deploy'
executable hook file which sends a deployment notification to the airbrake
application:

```
#!/bin/bash
enter ${release_path}
rake hoptoad:deploy TO="$environment" \
  REVISION="$(cat "${release_path}/revision")"
```

Note that this time the 'enter ${release_path}' IS necessary as the rake
command here must be run from within the application's deployed codebase so
that it can find the application's Rakefile.
