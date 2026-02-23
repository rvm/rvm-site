---
title: TeamCity Integration with RVM
---

# Continuous Integration with TeamCity

TeamCity is a continuous integration server designed to automatically run tests against a project every time you make a change.
You can configure TeamCity to automatically commit changes to version control when your tests pass or deploy your changes to a remote environment.
By integrating rvm with TeamCity you can run tests against multiple ruby versions and test multiple projects with each project working
with an independent set of gems.

## General Overview

In order to run TeamCity with RVM you will need to

- Setup a TeamCity server which manages your builds and serves a web interface so you can monitor and control the build process.
- Run one or more separate build agent processes which actually perform the builds and run your tests. These build agents can be located on the same machine as the TeamCity server or connect from remote machines.
- Specify the Ruby and Gemset you want the build agent to use as part of your project's configuration on the TeamCity server.

## Installing TeamCity

[Installing and Configuring TeamCity Server](http://confluence.jetbrains.com/display/TCD5/Installing+and+Configuring+the+TeamCity+Server)

## Installing a Build Agent

[Setting up and Running Additional Build Agents](http://confluence.jetbrains.com/display/TCD5/Setting+up+and+Running+Additional+Build+Agents)

## Configuring a TeamCity Project

[Managing TeamCity Projects](http://confluence.jetbrains.com/display/TCD5/Managing+Projects)

### Setting Up Build Agents

Install the project's Ruby and Gemset on the build agent's machine. This can either be performed manually on each build agent machine or as a
command line build runner as long as it is completed on each build agent's environment before the agent attempts to build a project using RVM.

### Configuring a Build Agent to use RVM

#### Using a Rake Build Runner

TeamCity 5.1.3 includes support for RVM settings in the Rake Build Runner. In the Build Runner's "Launching Parameters" set the following options:

- The "Ruby interpreter path" can be any RVM Ruby installed on the build runner. (eg '1.9.2')
- The "RVM gemset name" can be any RVM Gemset in the specified Ruby.

#### Using a Command Line Build Runner

As of TeamCity 5.1.3 Command Line build runners do not have built in support for RVM however they can use RVM given appropriate environment
variables. The example below demonstrates running "bundle install" using a Command Line Build Runner.

##### In the Build Runner Configuration Step

- Set the "Build Runner" to "Command Line"
- Set the "Command Executable" to "~/.rvm/gems/%rvm.ruby%@%rvm.gemset%/bin/bundle"
- Set the "Command parameters" to "install"

##### In the Properties and Environment Variables Configuration Step

Add the following two "Configuration Parameters". Setting these values as configuration parameters allows them to be reused in the Build Runner
Configuration and the Environment Variables below.

| Name | Value |
|------|-------|
| rvm.ruby | Your project's Ruby |
| rvm.gemset | Your project's Gemset |

Add the following Environment Variables to the "Build Parameters"

| Name | Value |
|------|-------|
| BUNDLE_PATH | ~/.rvm/gems/%rvm.ruby%@%rvm.gemset% |
| GEM_HOME | ~/.rvm/gems/%rvm.ruby%@%rvm.gemset% |
| GEM_PATH | ~/.rvm/gems/%rvm.ruby%@%rvm.gemset%:/home/teamcity/.rvm/gems/%rvm.ruby%@global |
| PATH | ~/.rvm/bin:~/.rvm/rubies/%rvm.ruby%/bin:~/.rvm/gems/%rvm.ruby%@%rvm.gemset%/bin:~/.rvm/gems/%rvm.ruby%@global/bin:%env.PATH% |

Using either of the configurations above the build agents will be able to reference an RVM Ruby and Gemset when performing their builds.

## Other resources

- Carbon Five's overview of their TeamCity configuration using RVM: [http://blog.carbonfive.com/2010/08/ruby-on-rails/using-rvm-on-teamcity-build-agents](http://blog.carbonfive.com/2010/08/ruby-on-rails/using-rvm-on-teamcity-build-agents)
- JetBrains' official TeamCity documentation: [http://blog.carbonfive.com/2010/08/ruby-on-rails/using-rvm-on-teamcity-build-agents](http://blog.carbonfive.com/2010/08/ruby-on-rails/using-rvm-on-teamcity-build-agents)
